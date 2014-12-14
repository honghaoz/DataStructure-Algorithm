# Reverse a string, NULL terminated string in C
# Python is different

# Common
def reverse(string):
	length = len(string)
	result = ""
	for i in xrange(length - 1, -1, -1):
		result += string[i]
	return result

# Inline for
def reverse_inline(string):
	return "".join(string[i] for i in xrange(len(string) - 1, -1, -1))

# Pythonic
def reverse_pythonic(string):
	return string[::-1]

def test():
	s = "1234abc"
	s_reversed = "cba4321"
	print "Passed" if reverse(s) == s_reversed else "Failed"
	print "Passed" if reverse_inline(s) == s_reversed else "Failed"
	print "Passed" if reverse_pythonic(s) == s_reversed else "Failed"

test()