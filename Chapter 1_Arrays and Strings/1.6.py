# Given an image represented by NxN matrix, 
# where each pixel in the image is 4 bytes, 
# write a method to rotate the image by 90 degrees,
# In place?

# In place
from math import ceil
def rotate(m):
	degree = len(m)
	# Precondition
	for eachLine in m:
		if not degree == len(eachLine):
			return False
	# layer by layer
	for i in xrange(int(ceil(degree / 2.0))):
		for y in xrange(degree - i * 2 - 1):
			j = y + i
			# i stands for layer
			# j stands for index
			m[i][j], m[j][degree - 1 - i] = m[j][degree - 1 - i], m[i][j]
			m[i][j], m[degree - 1 - i][degree - 1 - j] = m[degree - 1 - i][degree - 1 - j], m[i][j]
			m[i][j], m[degree - 1 - j][i] = m[degree - 1 - j][i], m[i][j]
	return m

# Helper
def printMatrix(m):
	degree = len(m)
	# Precondition
	for eachLine in m:
		if not degree == len(eachLine):
			return False
	for row in xrange(degree):
		print m[row]

def test():
	matrix1 = [[1, 2, 3, 4],
		 	   [5, 6, 7, 8],
		 	   [9, 10, 11, 12],
		 	   [13, 14, 15, 16]]
	matrix1Rotated = [[13, 9, 5, 1],
		 	  		  [14, 10, 6, 2],
		 	  		  [15, 11, 7, 3],
		 	  		  [16, 12, 8, 4]]
	matrix2 = [[1, 2, 3, 4, 5],
		 	   [6, 7, 8, 9, 10],
		 	   [11, 12, 13, 14, 15],
		 	   [16, 17, 18, 19, 20],
		 	   [21, 22, 23, 24, 25]]
	matrix2Rotated = [[21, 16, 11, 6, 1],
					  [22, 17, 12, 7, 2],
					  [23, 18, 13, 8, 3],
					  [24, 19, 14, 9, 4],
					  [25, 20, 15, 10, 5]]

	print "Passed" if rotate(matrix1) == matrix1Rotated else "Failed"
	print "Passed" if rotate(matrix2) == matrix2Rotated else "Failed"

test()