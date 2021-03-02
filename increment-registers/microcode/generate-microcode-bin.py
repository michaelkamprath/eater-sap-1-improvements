#!/usr/bin/python3
import sys
import copy

from microbits import MicroBits

# define the bits constants for each microcode instruction

SCr  = MicroBits('1000000000000',0,0)
PCe  = MicroBits('0100000000000',0,0)
SUB  = MicroBits('0010000000000',0,0)
HLT  = MicroBits('0000010000000',0,0)
OUT  = MicroBits('0000001000000',0,0)
Jump = MicroBits(0,'1000000000000',0)
SUMf = MicroBits(0,'0100000000000',0)
RMi  = MicroBits(0,'0000010000000',0)
IRi  = MicroBits(0,'0000001000000',0)
Ai   = MicroBits(0,'0000000100000',0)
Bi   = MicroBits(0,'0000000010000',0)
ARi  = MicroBits(0,'0000000000010',0)
PCo  = MicroBits(0,0,'1000000000000')
SUMo = MicroBits(0,0,'0100000000000')
RMo  = MicroBits(0,0,'0000010000000')
IRo  = MicroBits(0,0,'0000001000000')
Ao   = MicroBits(0,0,'0000000100000')
Bo   = MicroBits(0,0,'0000000010000')
Ie   = MicroBits('0000000100000',0,0)
Je   = MicroBits('0000000010000',0,0)
If   = MicroBits(0,'0010000000000',0)
Jf   = MicroBits(0,'0001000000000',0)
Ii   = MicroBits(0,'0000000001000',0)
Ji   = MicroBits(0,'0000000000100',0)
Io   = MicroBits(0,0,'0000000001000')
Jo   = MicroBits(0,0,'0000000000100')

# define the instuction constants

cmd_NOP = 0
cmd_LDA = 1
cmd_ADD = 2
cmd_SUB = 3
cmd_STA = 4
cmd_LDiA = 5
cmd_JMP = 6
cmd_JC = 7
cmd_JZ = 8
cmd_LDI = 9
cmd_MVAI = 10
cmd_MVIJ = 11
cmd_DECI = 12
cmd_DECJ = 13
cmd_OUT = 14
cmd_HLT = 15

cmd_list = [
    cmd_NOP, cmd_LDA, cmd_ADD,
    cmd_SUB, cmd_STA, cmd_LDiA,
    cmd_JMP, cmd_JC, cmd_JZ,
    cmd_LDI, cmd_MVAI, cmd_MVIJ,
    cmd_DECI, cmd_DECJ,
    cmd_OUT, cmd_HLT
]

class Microcode:
    # the general format of the microcode dict is:
    #
    #   microcode[instruction][step][c-flag][z-flag]
    def __init__(self):
        self.microcode = {'X':{'X':{'X':{'X':MicroBits(0, 0, 0)}}}}
        
        # set the first two steps for every instruction
        for inst in cmd_list:
            self.setBits(ARi|PCo, instruction=inst, step = 0)
            self.setBits(PCe|IRi|RMo, instruction=inst, step = 1)
        
        # ***************************************************
        #            Set specific instruction bits
        #
        # This is where the microcode for each specific instruction
        # is set. Changes to instruction microcode should be made here only.
        #
        # ***************************************************
        self.setBits(SCr, instruction=cmd_NOP, step=2)
        
        self.setBits(ARi|IRo, instruction=cmd_LDA, step=2)
        self.setBits(Ai|RMo, instruction=cmd_LDA, step=3)
        self.setBits(SCr, instruction=cmd_LDA, step=4)
        
        self.setBits(ARi|IRo, instruction=cmd_ADD, step=2)
        self.setBits(Bi|RMo, instruction=cmd_ADD, step=3)
        self.setBits(SUMf|Ai|SUMo, instruction=cmd_ADD, step=4)
        self.setBits(SCr, instruction=cmd_ADD, step=5)
        
        self.setBits(ARi|IRo, instruction=cmd_SUB, step=2)
        self.setBits(Bi|RMo, instruction=cmd_SUB, step=3)
        self.setBits(SUB|SUMf|Ai|SUMo, instruction=cmd_SUB, step=4)
        self.setBits(SCr, instruction=cmd_SUB, step=5)
        
        self.setBits(ARi|IRo, instruction=cmd_STA, step=2)
        self.setBits(RMi|Ao, instruction=cmd_STA, step=3)
        self.setBits(SCr, instruction=cmd_STA, step=4)
        
        self.setBits(Ai|IRo, instruction=cmd_LDiA, step=2)
        self.setBits(SCr, instruction=cmd_LDiA, step=3)
        
        self.setBits(Jump|IRo, instruction=cmd_JMP, step=2)
        self.setBits(SCr, instruction=cmd_JMP, step=3)
        
        self.setBits(SCr, instruction=cmd_JC, step=2, carrry_flag=0)
        self.setBits(Jump|IRo, instruction=cmd_JC, step=2, carrry_flag=1)
        self.setBits(SCr, instruction=cmd_JC, step=3, carrry_flag=1)
        
        self.setBits(SCr, instruction=cmd_JZ, step=2, zero_flag=0)
        self.setBits(Jump|IRo, instruction=cmd_JZ, step=2, zero_flag=1)
        self.setBits(SCr, instruction=cmd_JZ, step=3, zero_flag=1)
        
        self.setBits(OUT|Ao, instruction=cmd_OUT, step=2)
        self.setBits(SCr, instruction=cmd_OUT, step=3)

        self.setBits(ARi|IRo, instruction=cmd_LDI, step=2)
        self.setBits(Ii|RMo, instruction=cmd_LDI, step=3)
        self.setBits(SCr, instruction=cmd_LDI, step=4)

        self.setBits(Ii|Ao, instruction=cmd_MVAI, step=2)
        self.setBits(SCr, instruction=cmd_MVAI, step=3)

        self.setBits(SUB|Ie, instruction=cmd_DECI, step=2)
        self.setBits(If, instruction=cmd_DECI, step=3)
        self.setBits(SCr, instruction=cmd_DECI, step=4)

        self.setBits(SUB|Je, instruction=cmd_DECJ, step=2)
        self.setBits(Jf, instruction=cmd_DECJ, step=3)
        self.setBits(SCr, instruction=cmd_DECJ, step=4)

        self.setBits(Ji|Io, instruction=cmd_MVIJ, step=2)
        self.setBits(SCr, instruction=cmd_MVIJ, step=3)

        self.setBits(HLT, instruction=cmd_HLT, step=2)
        self.setBits(SCr, instruction=cmd_HLT, step=3)
        
        return
    
    def setBits(self, bits, instruction='X', step='X', carrry_flag='X', zero_flag='X'):
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
    out_file_name = 'eeprom_microcode.bin'
    if len(sys.argv) == 2:
        out_file_name = sys.argv[1]
    
    mc = Microcode()
    # the 28C256 has 15 address lines, A0 through A14
    eeprom_size = 2**15
    eeprom_contents = bytearray(eeprom_size)
    
    print("Generating eeprom contents ...")
    for i in range(0,eeprom_size):
        eeprom_contents[i] = mc.getByteForAddress(i)

    
    print('Writing eeprom contents to "{0}"'.format(out_file_name))
    with open(out_file_name, 'wb') as f:
        f.write(eeprom_contents)
    
    print("Done!")
