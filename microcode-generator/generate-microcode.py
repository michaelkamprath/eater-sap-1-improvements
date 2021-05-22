#!/usr/bin/python3
import copy
import sys
import yaml

from microbits import MicroBits


class Microcode:
    # the general format of the microcode dict is:
    #
    #   microcode[instruction][step][c-flag][z-flag]
    def __init__(self, config_dict):
        self.microcode = {'X':{'X':{'X':{'X':MicroBits(0)}}}}
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
                mb = self._generate_final_microbits(step_config['control_lines'], microbits)
                carry_flag = (step_config['flags']['carry'] if 'flags' in step_config else 'X')
                zero_flag = (step_config['flags']['zero'] if 'flags' in step_config else 'X')
                for instruction_val in instruction_values:
                    self._setBits(mb, instruction=instruction_val, step=step_num, carrry_flag=carry_flag, zero_flag=zero_flag)

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
            carrry_flag=(step_config['flags']['carry'] if 'flags' in step_config else 'X'),
            zero_flag=(step_config['flags']['zero'] if 'flags' in step_config else 'X'),
        )

    def _generate_final_microbits(self, control_line_list, microbits):
        if not isinstance(control_line_list, list):
            control_line_list = control_line_list.split(' ')
        microbit = MicroBits()
        for cl in control_line_list:
            microbit |= microbits[cl]
        return microbit

    def _setBits(self, bits, instruction='X', step='X', carrry_flag='X', zero_flag='X'):
        instruction_dict = self.microcode.setdefault(instruction, dict())
        step_dict = instruction_dict.setdefault(step, dict())
        carry_dict = step_dict.setdefault(carrry_flag, dict())
        carry_dict[zero_flag] = bits

    def getByteForAddress(self, address):
        instruction = (address&int('000000111111000',2)) >> 3
        step = (address&int('000000000000111',2))
        carry_flag = (address&int('000001000000000',2)) >> 9
        zero_flag = (address&int('000010000000000',2)) >> 10
        eeprom_select = (address&int('110000000000000',2)) >> 13

        # the order or precedence for searching for a value return is:
        #   1. instruction
        #   2. step
        #   3. carry_flag
        #   4. zero_flag
        instruction_dict = Microcode._get_with_defaulting(self.microcode, instruction)
        if instruction_dict is None:
            return 0

        step_dict = Microcode._get_with_defaulting(instruction_dict, step)
        if step_dict is None:
            # try agains with explicitly the default instruction
            instruction_dict = Microcode._get_with_defaulting(self.microcode, 'X')
            step_dict = Microcode._get_with_defaulting(instruction_dict, step)
            if step_dict is None:
                return 0

        carry_dict = Microcode._get_with_defaulting(step_dict, carry_flag)
        if carry_dict is None:
            return 0

        bits = Microcode._get_with_defaulting(carry_dict, zero_flag)
        if bits is None:
            return 0
        elif eeprom_select == 0b00:
            return bits.getLeftByteValue()
        elif eeprom_select == 0b10:
            return bits.getMiddleByteValue()
        elif eeprom_select == 0b01:
            return bits.getRightByteValue()
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
    # the 28C256 has 15 address lines, A0 through A14
    eeprom_size = 2**15
    eeprom_contents = bytearray(eeprom_size)

    print("Generating eeprom contents ...")
    for i in range(0,eeprom_size):
        eeprom_contents[i] = mc.getByteForAddress(i)

    out_file_name = microcode_config['microcode_file_name']
    print('Writing eeprom contents to "{0}"'.format(out_file_name))
    with open(out_file_name, 'wb') as f:
        f.write(eeprom_contents)

    print("Done!")
