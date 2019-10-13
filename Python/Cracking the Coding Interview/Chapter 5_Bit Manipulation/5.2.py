from Bit import *

# Given a real number between 0 and 1 (e.g.m 0.72) that is passed in as a double,
# print the binary representation. If the number cannot be represented accurrately
# in binary with at most 32 characters, print "ERROR"

def doubleToBit(n):
	assert(isinstance(n, float))
	assert(0 <= n and n <= 1)
	resultString = "0."
	while not n == 0:
		if len(resultString) > 32:
			return "ERROR"
		n = n * 2
		if n >= 1:
			resultString += "1"
			n -= 1
		else:
			resultString += "0"
	return resultString

def test():
	print doubleToBit(0.25)
	print doubleToBit(0.015)
	print doubleToBit(0.5)
	print doubleToBit(0.625)

test()
