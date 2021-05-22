import math

class MicroBits:


    def __init__(self, control_line_num: int = 0):
        if control_line_num > 0:
            byte_num = math.ceil(control_line_num/12)
            byte_value = 1 << (  13 - (control_line_num - (byte_num-1)*12))
            self.left = byte_value if byte_num == 1 else 0
            self.middle = byte_value if byte_num == 2 else 0
            self.right = byte_value if byte_num == 3 else 0
        else:
            self.left = 0
            self.middle = 0
            self.right = 0

    def __repr__(self):
        return str(self)

    def __str__(self):
        return '{0:013b}-{1:013b}-{2:013b}'.format(self.left, self.middle, self.right)

    def __or__(self, other):
        mb = MicroBits()
        mb.left = self.left|other.left
        mb.middle = self.middle|other.middle
        mb.right = self.right|other.right
        return mb

    def __and__(self, other):
        mb = MicroBits()
        mb.left = self.left&other.left
        mb.middle = self.middle&other.middle
        mb.right = self.right&other.right
        return mb

    def _convertBitsToByteValue(self,bits):
        if bits == 0:
            return 0
        directBits = (bits&int('1111100000000',2)) >>5
        decoderBits = (bits&int('0000011111111',2))
        if decoderBits == 0:
            return directBits
        else:
            decoderValue = int(math.log(decoderBits,2))
            return directBits|decoderValue

    def getLeftByteValue(self):
        return self._convertBitsToByteValue(self.left)

    def getMiddleByteValue(self):
        return self._convertBitsToByteValue(self.middle)

    def getRightByteValue(self):
        return self._convertBitsToByteValue(self.right)
