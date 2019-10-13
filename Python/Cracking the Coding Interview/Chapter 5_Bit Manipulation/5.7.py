from Bit import *
from operator import xor

# An array A contains all the integers from 0 to n, except for one number which is missing.
# In this problem, we cannot access an entire integer in A with a single operation. The
# element of A are represented in binary, and the only operation we can use to access them
# is "fetch the jth bit of A[i]", which takes constant time.
# Find the missing integer, in O(n) time

def findMissing(a):
	lastNumber = None
	lastLSB = None
	length = len(a)
	for i in xrange(length):
		currentNumber = a[i]
		currentLSB = getBit(currentNumber, 0)
		if lastNumber == None:
			lastNumber = currentNumber
			lastLSB = currentLSB
			continue
		
		if currentLSB == lastLSB:
			return  currentNumber - 1
		lastNumber = currentNumber
		lastLSB = currentLSB
	return None

def test():
	print "Passed" if findMissing([4,5,6,8,9,10]) == 7 else "Failed"
	print "Passed" if findMissing([95,96,97,98,99,101,102,103]) == 100 else "Failed"
	print "Passed" if findMissing([5,6,7,8,9,10]) == None else "Failed"

test()
