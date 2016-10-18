from Bit import *

# Explain what the following code does: ((n & (n - 1)) == 0)

# My answer:
# Whether n is power of 2

# My obversion:
# 1000 & 0111 -> 0
# 1111 & 1110 -> 1110
# 1010 & 1001 -> 1000

# We can see the last number is always zero, and the differences are different range from the last
# is changed to zero, so if we are comparing with 0, means full range of n is cbanged to zero.
# This only happens when n looks like 1000..., this means n is power of 2.

def test():
	pass

test()
