# Permutation

# Sorting
def isPermutationSort(s1, s2):
	return sorted(s1) == sorted(s2)

# Counter
from collections import Counter
def isPermutation(s1, s2):
	counter1 = Counter(s1)
	counter2 = Counter(s2)
	c = counter1 - counter2
	# for e in c.values():
	# 	if e > 0:
	# 		return False
	return len(c) == 0

def test():
	s = "1234abc"
	s1 = "cba4123"
	s2 = "asdf"
	print "Passed" if isPermutation(s, s1) else "Failed"
	print "Passed" if not isPermutation(s, s2) else "Failed"
	print "Passed" if isPermutationSort(s, s1) else "Failed"
	print "Passed" if not isPermutationSort(s, s2) else "Failed"

test()