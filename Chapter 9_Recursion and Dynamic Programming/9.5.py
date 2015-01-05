# Write a method to compute all permutations of a string of unique characters

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

print permutations('word')