# Replace space with %20

# Common
def replaceSpaceCommon(s):
	result = ""
	length = len(s)
	for i in xrange(length):
		e = s[i]
		if e == " ":
			result += "%20"
		else:
			result += e
	return result


# API
def replaceSpace(s):
	return s.replace(" ", "%20")

def test():
	s = " sd  234 "
	s1 = "%20sd%20%20234%20"
	print "Passed" if replaceSpaceCommon(s) == s1 else "Failed"
	print "Passed" if replaceSpace(s) == s1 else "Failed"

test()