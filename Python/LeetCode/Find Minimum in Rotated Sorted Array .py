# Find Minimum in Rotated Sorted Array 
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.

# (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

# Find the minimum element.

# You may assume no duplicate exists in the array.

class Solution:
    # @param num, a list of integer
    # @return an integer
    def findMin(self, num):
        length = len(num)
        for i in xrange(length - 1):
            if num[i] > num[i + 1]:
                return num[i + 1]
        return num[0]

    def findMinSolution(self, num):
    	length = len(num)
    	if length <= 0:
    		return None
    	if length == 1:
    		return num[0]
    	p = 0
    	q = length - 1
    	while True:
    		if p == q:
    			return num[p]
    		mid = (p + q) / 2
    		l0 = num[p]
    		l1 = num[mid]
    		r0 = num[mid + 1]
    		r1 = num[q]
    		if l1 > r1:
    			p = mid + 1
    		else:
    			q = mid

def main():
	s = Solution()
	print "Passed" if 0 == s.findMin([4,5,6,7,0,1,2]) else "Failed"
	print "Passed" if 2 == s.findMin([2,3,4]) else "Failed"

	print "Passed" if 0 == s.findMinSolution([4,5,6,7,0,1,2]) else "Failed"
	print "Passed" if 2 == s.findMinSolution([2,3,4]) else "Failed"

main()
