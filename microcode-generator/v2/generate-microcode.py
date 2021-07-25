#!/usr/bin/python3
import copy
import sys
import yaml

from microbits import MicroBits_27c4096 as MicroBits

class Microcode:
    # the general format of the microcode dict is:
    #
    #   microcode[extended][instruction][step][c-flag][z-flag][n-flag][o-flag]
    def __init__(self, config_dict):
        self.microcode = {'X':{'X':{'X':{'X':{'X':{'X':{'X':MicroBits(0)}}}}}}}
        # first generate the microbits objects
        microbits = {
            name : MicroBits(line_num) for name, line_num in config_dict['control_lines'].items()
        }

        # Now update microcode for instruction prefixes
        instruction_values = [
            instruction['value'] for instruction in config_dict['instructions'].values()
        ]

        for step_num, step_config_list in enumerate(config_dict['instruction_prefix_steps']):
            for step_config in step_config_list:
                for instruction_val in instruction_values:
                    self._insert_step_config(step_config, step_num, instruction_val, microbits)

        # set the instruction specific steps microbits
        step_offset = len(config_dict['instruction_prefix_steps'])
        for instruction in config_dict['instructions']:
            instruction_config = config_dict['instructions'][instruction]
            instruction_steps = instruction_config['steps']
            for step_num, step_config_list in enumerate(instruction_steps):
                for step_config in step_config_list:
                    self._insert_step_config(step_config, step_num+step_offset, instruction_config['value'], microbits)

        # and thats it
        return

    def _insert_step_config(self, step_config, step_num, instr_val, microbits):
        mb = self._generate_final_microbits(step_config['control_lines'], microbits)
        self._setBits(
            mb,
            instruction=instr_val,
            step=step_num,
            carrry_flag=(step_config['flags'].get('carry', 'X') if 'flags' in step_config else 'X'),
            zero_flag=(step_config['flags'].get('zero', 'X') if 'flags' in step_config else 'X'),
            negative_flag=(step_config['flags'].get('negative', 'X') if 'flags' in step_config else 'X'),
            overflow_flag=(step_config['flags'].get('overflow', 'X') if 'flags' in step_config else 'X'),
            extended_flag=(step_config['flags'].get('extended', 0) if 'flags' in step_config else 0),
        )

    def _generate_final_microbits(self, control_line_list, microbits):
        if control_line_list is None:
            control_line_list = []
        elif not isinstance(control_line_list, list):
            control_line_list = control_line_list.split(' ')
        microbit = MicroBits()
        for cl in control_line_list:
            microbit |= microbits[cl]
        return microbit

    def _setBits(
        self,
        bits,
        instruction='X',
        step='X',
        carrry_flag='X',
        zero_flag='X',
        negative_flag='X',
        overflow_flag='X',
        extended_flag=0,
    ):
        (
            self.microcode
            .setdefault(extended_flag, dict())
            .setdefault(instruction, dict())
            .setdefault(step, dict())
            .setdefault(carrry_flag, dict())
            .setdefault(zero_flag, dict())
            .setdefault(negative_flag, dict())
        )[overflow_flag] = bits

    def getBytesForAddress(self, address):
        instruction = (address&int('000000011111111000',2)) >> 3
        step = (address&int('000000000000111',2))
        extended_flag = (address&int('000000100000000000',2)) >> 11
        zero_flag = (address&int('000001000000000000',2)) >> 12
        carry_flag = (address&int('000010000000000000',2)) >> 13
        negative_flag = (address&int('000100000000000000',2)) >> 14
        overflow_flag = (address&int('001000000000000000',2)) >> 15
        eeprom_select = (address&int('100000000000000000',2)) >> 17

        # the order or precedence for searching for a value return is:
        #   1. extended
        #   2. instruction
        #   3. step
        #   4. carry_flag
        #   5. zero_flag
        #   6. negative_flag
        #   7. overflow_flag
        #

        # The extended flag must be 0 or 1
        extended_dict = self.microcode.get(extended_flag)
        if extended_dict is None:
            return 0

        instruction_dict = Microcode._get_with_defaulting(extended_dict, instruction)
        if instruction_dict is None:
            return 0

        step_dict = Microcode._get_with_defaulting(instruction_dict, step)
        if step_dict is None:
            # try agains with explicitly the default instruction
            instruction_dict = Microcode._get_with_defaulting(extended_dict, 'X')
            step_dict = Microcode._get_with_defaulting(instruction_dict, step)
            if step_dict is None:
                return 0

        carry_dict = Microcode._get_with_defaulting(step_dict, carry_flag)
        if carry_dict is None:
            return 0

        zero_dict = Microcode._get_with_defaulting(carry_dict, zero_flag)
        if zero_dict is None:
            return 0

        negative_dict = Microcode._get_with_defaulting(zero_dict, negative_flag)
        if negative_dict is None:
            return 0

        bits = Microcode._get_with_defaulting(negative_dict, overflow_flag)
        if bits is None:
            return 0
        else:
            # print(f'get bytes for address = {address} : instr = {instruction}, step = {step}, xtd = {extended_flag}, zero = {zero_flag}, carry = {carry_flag}, eeprom = {eeprom_select}')
            if eeprom_select == 0b0:
                return bits.getRightByteValue()
            elif eeprom_select == 0b1:
                return bits.getLeftByteValue()
        return 0

    def _get_with_defaulting(defaulting_dict, key_value, defaulting_key_value = 'X'):
        if defaulting_dict is None:
            return None
        if key_value in defaulting_dict:
            return defaulting_dict[key_value]
        elif defaulting_key_value in defaulting_dict:
            return defaulting_dict[defaulting_key_value]
        return None


if __name__ == '__main__':
    if len(sys.argv) == 2:
        config_file_path = sys.argv[1]
    else:
        print('Requires YAML config file as argument.')
        sys.exit(1)

    if config_file_path.endswith('.yaml'):
        with open(config_file_path, 'r') as yaml_file:
            try:
                microcode_config =  yaml.safe_load(yaml_file)
            except yaml.YAMLError as exc:
                sys.exit(f'ERROR: {exc}')
    else:
        print('configuration file must be YAML')
        sys.exit(1)


    mc = Microcode(microcode_config)
    # the 27c4096 has 18 address lines, A0 through A17, and a 16 bit word
    eeprom_size = 2**18
    eeprom_contents = bytearray(eeprom_size*2)

    print("Generating eeprom contents  for {0} addresses ...".format(eeprom_size))
    for i in range(0,eeprom_size):
        # the 27c4096 eprom is programmed in little endian for each 16-bit word
        value = mc.getBytesForAddress(i)
        high_byte = (value&0xFF00) >> 8
        low_byte = (value&0x00FF)
        eeprom_contents[2*i] = low_byte
        eeprom_contents[2*i+1] = high_byte

    out_file_name = microcode_config['microcode_file_name']
    print('Writing eeprom contents to "{0}"'.format(out_file_name))
    with open(out_file_name, 'wb') as f:
        f.write(eeprom_contents)

    print("Done!")
