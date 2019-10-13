# Basic string compression
# aabcccccaaa -> a2b1c5a3
# Only return smaller string

# Common
def compress(s):
	compressedString = ""
	currentLetter = ""
	currentCount = 0
	for e in s:
		if not e == currentLetter:
			if not currentLetter is "":
				compressedString += currentLetter + str(currentCount)
			currentLetter = e
			currentCount = 1
		else:
			currentCount += 1
	compressedString += currentLetter + str(currentCount)
	return compressedString if len(compressedString) < len(s) else s

def test():
	s = "aabcccccaaa"
	s_compressed = "a2b1c5a3"
	s1 = "abc"
	print "Passed" if compress(s) == s_compressed else "Failed"
	print "Passed" if compress(s1) == s1 else "Failed"

test()