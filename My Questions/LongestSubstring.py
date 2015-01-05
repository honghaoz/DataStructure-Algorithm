# Longest Substring without repeating characters
# Given a string, find the length of the longest substring without 
# repeating characters. 
# For example, the longest substring without repeating letters for 
# "abcabcbb" is "abc", which the length is 3. 
# For "bbbbb" the longest substring is "b", with the length of 1.

def longestSubstring(string):
	startIndex, endIndex = 0, 0
	duplicateDict = {}
	maxStartIndex, maxEndIndex = 0, 0
	for i in xrange(len(string)):
		if not string[i] in duplicateDict:
			duplicateDict[string[i]] = i
		else:
			if (endIndex - startIndex) > (maxEndIndex - maxStartIndex):
				maxStartIndex = startIndex
				maxEndIndex = endIndex
			startIndex = duplicateDict[string[i]] + 1
			duplicateDict[string[i]] = i
		endIndex = i + 1
	if (endIndex - startIndex) > (maxEndIndex - maxStartIndex):
		maxStartIndex = startIndex
		maxEndIndex = endIndex
	return string[maxStartIndex: maxEndIndex]

def test():
	print longestSubstring('abcabcbb')
	print longestSubstring('abcdefefghijklmnxyzmnxy')

test()