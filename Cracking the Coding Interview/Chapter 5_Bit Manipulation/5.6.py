from Bit import *
from operator import xor

# Write a program to swap odd and even bits in an integer with as few instructions as possible
# (e.g., bit 0 and bit 1 are swapped, bit 2 and bit 3 are swapped, and so on)

# Suppose 32-bit integer
def swapOddWithEven(num):
	oddMask = bitToInt("01010101010101010101010101010101")
	evenMask = bitToInt("10101010101010101010101010101010")
	oddNumbers = num & oddMask
	evenNumbers = num & evenMask
	oddNumbers  = oddNumbers << 1
	evenNumbers = evenNumbers >> 1
	num = oddNumbers | evenNumbers
	return num

def test():
	print "Passed" if swapOddWithEven(bitToInt("0101")) == bitToInt("1010") else "Failed"
	print "Passed" if swapOddWithEven(bitToInt("100101")) == bitToInt("011010") else "Failed"

test()
