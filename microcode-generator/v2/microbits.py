import math

class MicroBits_27c4096:
    '''
    This version of the Microbits class is intended to be used with a pair of 27c4096 (or equivalent) EPROMS
    with each having the following bit layout:

        Q15 - Q6 : Directly settable control lins
        Q5 - Q3 : Drives a 27HCT238 to select 7 control lines Y1 - Y7 ("high bank")
        Q2 - Q0 : Drives a 27HCT238 to select 7 control lines Y1 - Y7  ("low bank")

    Control line 1 is associated with Q15 of the left EPROM and Control line 48 is the Y1 output of the low
    bank 27HCT238 on the right EPROM.
    '''

    def __init__(self, control_line_num: int = 0):
        if control_line_num >= 1 and control_line_num <= 48:
            byte_num = math.ceil(control_line_num/24)
            byte_value = 1 << (  24 - (control_line_num - (byte_num-1)*24))
            self.left = byte_value if byte_num == 1 else 0
            self.right = byte_value if byte_num == 2 else 0
        else:
            self.left = 0
            self.right = 0

    def __repr__(self):
        return str(self)

    def __str__(self):
        return '{0:024b}-{1:024b}'.format(self.left, self.right)

    def __or__(self, other):
        mb = MicroBits_27c4096()
        self._areBitsCompatible(self.left, other.left)
        mb.left = self.left|other.left
        self._areBitsCompatible(self.right, other.right)
        mb.right = self.right|other.right
        return mb

    def __and__(self, other):
        mb = MicroBits_27c4096()
        mb.left = self.left&other.left
        mb.right = self.right&other.right
        return mb

    def _areBitsCompatible(self, bits1, bits2):
        # need to check if both sides have bits in the same
        # high or low bank of bits (representing the 27HCT238s)
        # if this is a collision, raise and exception
        highBank1 = (bits1&int('000000000011111110000000',2))
        highBank2 = (bits2&int('000000000011111110000000',2))
        if highBank1 > 0 and highBank2 > 0:
            raise ValueError('High banks have control line collision')
        lowBank1 = (bits1&int('000000000000000001111111',2))
        lowBank2 = (bits2&int('000000000000000001111111',2))
        if lowBank1 > 0 and lowBank2 > 0:
            raise ValueError('Low banks have control line collision')


    def _convertBitsToByteValue(self,bits):
        if bits == 0:
            return 0
        directBits = (bits&int('111111111100000000000000',2)) >> 8
        highBankBitsRaw = (bits&int('000000000011111110000000',2)) >> 7
        highBankBits = (int(math.log(highBankBitsRaw << 1,2)) << 3) if highBankBitsRaw != 0 else 0
        lowBankBitsRaw = (bits&int('000000000000000001111111',2))
        lowBankBits = int(math.log(lowBankBitsRaw << 1,2)) if lowBankBitsRaw != 0 else 0

        final_bits = directBits | highBankBits | lowBankBits
        return final_bits

    def getLeftByteValue(self):
        return self._convertBitsToByteValue(self.left)

    def getRightByteValue(self):
         return self._convertBitsToByteValue(self.right)
