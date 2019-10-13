# Write an algorithm such that if an element in an MxN matrix is 0,
# its entire row and column are set to 0

def setZero(m):
	recoredRow = {}
	recoredColumn = {}
	M = len(m)
	N = len(m[0])
	for i in xrange(M):
		for j in xrange(N):
			if m[i][j] == 0:
				recoredRow[i] = 0
				recoredColumn[j] = 0
	for i in xrange(M):
		for j in xrange(N):
			if i in recoredRow or j in recoredColumn:
				m[i][j] = 0
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
		 	   [5, 0, 7, 8],
		 	   [9, 10, 11, 12],
		 	   [13, 14, 15, 16]]
	matrix1Processed = [[1, 0, 3, 4],
		 	   			[0, 0, 0, 0],
		 	   			[9, 0, 11, 12],
			 	 	    [13, 0, 15, 16]]
	matrix2 = [[1, 2, 3, 4, 5],
		 	   [6, 0, 8, 9, 10],
		 	   [11, 12, 13, 14, 15],
		 	   [16, 17, 18, 0, 20],
		 	   [21, 22, 23, 24, 25]]
	matrix2Processed = [[1, 0, 3, 0, 5],
		 	   			[0, 0, 0, 0, 0],
		 	   			[11, 0, 13, 0, 15],
		 	   			[0, 0, 0, 0, 0],
		 	   			[21, 0, 23, 0, 25]]

	print "Passed" if setZero(matrix1) == matrix1Processed else "Failed"
	print "Passed" if setZero(matrix2) == matrix2Processed else "Failed"

test()