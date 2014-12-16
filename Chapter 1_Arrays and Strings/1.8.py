# !!!
# Assume you have a method isSubstring which checks if one word is a substring of another.
# Given two strings, s1 and s2, write code to check if s2 is a rotation of s1, using
# only one call to isSubstring
# e.g., "waterbottle" is a rotation of "erbottlewat"

def isSubstring(sub, s):
	return sub in s

# Check whether s1 is rotation of s2
def isRotation(s1, s2):
	if not len(s1) == len(s1):
		return False
	xy = s2 + s2
	return isSubstring(s1, xy)

def test():
	s1 = "waterbottle"
	s2 = "erbottlewat"
	s3 = "sads"
	print "Passed" if isRotation(s1, s2) else "Failed"
	print "Passed" if not isRotation(s2, s3) else "Failed"

test()