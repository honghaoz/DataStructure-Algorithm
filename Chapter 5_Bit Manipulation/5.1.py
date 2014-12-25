from Bit import *

# You are given two 32-bit numbers, N and M, and two bit positions, i and j.
# Write a method to insert M into N such that M starts a bit j ad ends at bit i.
# You can assume that the bits j through j have enough space to fukk all of M.
# That is, if M = 10011, you can assume that there are at least 5 bits between j and i.
# You would not, for example, have j = 3 and i = 2, because M could not fully fit between
# bit 3 and bit 2
# Example:
# Input: N = 10000000000, M = 10011, i = 2, j = 6
# Output:N = 10001001100

def merge(M, N, j, i):
	maskBeforeJ = ~((1 << (j + 1)) - 1)
	N = N & maskBeforeJ
	maskAfterI =  ~((1 << i) - 1)
	N = N & maskAfterI

	lengthM = len(intToBit(M))
	restLength = j - lengthM + 1
	M = M << restLength
	return (N | M)

def test():
	m = bitToInt("10011")
	n = bitToInt("10000000000")
	i = 2
	j = 6
	print intToBit(m)
	print intToBit(n)
	newN = merge(m, n, j, i)
	print intToBit(newN)

test()
