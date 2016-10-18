from Bit import *
from operator import xor

# Write a function to determine the number of bits you would need to flip to convert 
# integer A to B.
# 29 (11101) to 15 (01111) => 2

def howManyFlips(a, b):
	c = xor(a, b)
	return countOnes(c)

# This is a better solution
# Trick: c = c & (c - 1) clears the least significant bit in c
# Like 1101 -> 1100, 1100 -> 1000, 1000 -> 0000
def bitSwapRequired(a, b):
	c = xor(a, b)
	count = 0
	while not c == 0:
		count += 1
		c = c & (c - 1)
	return count

def countOnes(num):
	count = 0
	while num > 0:
		if num % 2 == 1:
			count += 1
		num /= 2
	return count

def test():
	print howManyFlips(29, 15)
	print bitSwapRequired(29, 15)

test()
