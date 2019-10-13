# Write a method to compute all permutations of a string of unique characters
# abc -> ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']

def myPermutation(s):
	if len(s) == 1:
		return [s]
	else:
		result = []
		lastChar = s[-1]
		subS = s[:-1]
		for eachString in myPermutation(subS):
			for i in xrange(len(eachString) + 1):
				result.append(insertString(eachString, i, lastChar))
		return result

def insertString(string, index, newString):
	preString = string[:index]
	postString = string[index:]
	return preString + newString + postString

def permutations(A, B = ''): 
	assert len(A) >= 0 
	assert len(A) == len(set(A)) 
	if len(A) == 0: 
		return [B] 
	else: 
		res = [] 
		for i in range(len(A)): 
			res.extend(permutations(A[0:i] + A[i+1:], B + A[i])) 
		return res 

def test():
	print sorted(permutations('abcd'))
	print len(permutations("abcd"))
	print sorted(myPermutation('abcd'))
	print len(myPermutation('abcd'))

test()