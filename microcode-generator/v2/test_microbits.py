import unittest

from microbits import MicroBits_27c4096 as MicroBits


class TestMicrobits(unittest.TestCase):
    def test_microbit_construction(self):
        mb = MicroBits(1)
        self.assertEqual(mb.getLeftByteValue(), 32768)
        self.assertEqual(mb.getRightByteValue(), 0)

        mb = MicroBits(11)
        self.assertEqual(mb.getLeftByteValue(), 56)
        self.assertEqual(mb.getRightByteValue(), 0)

        mb = MicroBits(17)
        self.assertEqual(mb.getLeftByteValue(), 8)
        self.assertEqual(mb.getRightByteValue(), 0)

        mb = MicroBits(18)
        self.assertEqual(mb.getLeftByteValue(), 7)
        self.assertEqual(mb.getRightByteValue(), 0)

        mb = MicroBits(24)
        self.assertEqual(mb.getLeftByteValue(), 1)
        self.assertEqual(mb.getRightByteValue(), 0)

        mb = MicroBits(25)
        self.assertEqual(mb.getLeftByteValue(), 0)
        self.assertEqual(mb.getRightByteValue(), 32768)

        mb = MicroBits(35)
        self.assertEqual(mb.getLeftByteValue(), 0)
        self.assertEqual(mb.getRightByteValue(), 56)

        mb = MicroBits(41)
        self.assertEqual(mb.getLeftByteValue(), 0)
        self.assertEqual(mb.getRightByteValue(), 8)

        mb = MicroBits(42)
        self.assertEqual(mb.getLeftByteValue(), 0)
        self.assertEqual(mb.getRightByteValue(), 7)

        mb = MicroBits(48)
        self.assertEqual(mb.getLeftByteValue(), 0)
        self.assertEqual(mb.getRightByteValue(), 1)

    def test_microbit_math(self):
        mb = MicroBits(1)|MicroBits(25)
        self.assertEqual(mb.getLeftByteValue(), 32768)
        self.assertEqual(mb.getRightByteValue(), 32768)

        mb = MicroBits(18)|MicroBits(35)
        self.assertEqual(mb.getLeftByteValue(), 7)
        self.assertEqual(mb.getRightByteValue(), 56)

        mb = MicroBits(1)|MicroBits(2)
        self.assertEqual(mb.getLeftByteValue(), 49152)
        self.assertEqual(mb.getRightByteValue(), 0)