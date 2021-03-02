import math

class MicroBits:
    def __init__(self, left = 0, middle = 0, right = 0):
        self.left = left if isinstance(left, int) else int(left, 2)
        self.middle = middle if isinstance(middle, int) else int(middle, 2)
        self.right = right if isinstance(right, int) else int(right, 2)
        # each EEPROM bank is represented by 13 bits, and bit 0, which represents
        # Y0 on the 74HCT238, should always be 0.
        self.left &= int('1111111111110',2)
        self.middle &= int('1111111111110',2)
        self.right &= int('1111111111110',2)
    
    def __repr__(self):
        return str(self)
    
    def __str__(self):
        return '{0:013b}-{1:013b}-{2:013b}'.format(self.left, self.middle, self.right)
    
    def __or__(self, other):
        left = self.left|other.left
        middle = self.middle|other.middle
        right = self.right|other.right
        return MicroBits(left, middle, right)
    
    def __and__(self, other):
        left = self.left&other.left
        middle = self.middle&other.middle
        right = self.right&other.right
        return MicroBits(left, middle, right)
    
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
