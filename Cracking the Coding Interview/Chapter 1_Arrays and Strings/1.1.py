# Check String is unique
# Dictionary
def unique1(s):
	d = {}
	for e in s:
		if e in d:
			d[e] += 1
		else:
			d[e] = 0
	for key, value in d.items():
		if value != 0:
			return False
	return True

# Collection
from collections import Counter
def unique2(s):
	counter = Counter(s)
	for v in counter.values():
		if v > 1: return False
	return True
	# print counter.keys()
	# print counter.values()
	# print counter.items()

# ASCII String
# Time complexity is O(n)
# Space complexity is O(1)
def unique3(s):
	if len(s) > 128: 
		return False
	charSet = [False] * 128
	length = len(s)
	for i in xrange(length):
		order = ord(s[i])
		if charSet[order]:
			return False
		charSet[order] = True
	return True

# Bit manipulation
def unique4(s):
	print int("1000", 2) # 8
	print int("0xff", 16) # 255
	print 1 << 3 # 8
	print "{0:b}".format(10) # 1010
	print '{0:08b}'.format(10) # 00001010
	print bin(10) # 0b1010

def test():
	s = "1234abc"
	s1 = "1234abc1"
	print "Passed" if unique1(s) == True else "Failed"
	print "Passed" if unique1(s1) == False else "Failed"
	print "Passed" if unique2(s) == True else "Failed"
	print "Passed" if unique2(s1) == False else "Failed"
	print "Passed" if unique3(s) == True else "Failed"
	print "Passed" if unique3(s1) == False else "Failed"

test()
unique4("21")