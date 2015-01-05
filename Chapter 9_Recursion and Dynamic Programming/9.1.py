# A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, or 3 steps at
# a time. Implement a method to count how many possible ways the child can run up the stairs

def countWays(stairs):
	if stairs < 0:
		return 0
	elif stairs == 0:
		return 1
	else:
		return countWays(stairs - 1) + countWays(stairs - 2) + countWays(stairs - 3)

def test():
	print "Passed" if countWays(1) == 1 else "Failed"
	print "Passed" if countWays(2) == 2 else "Failed"
	print "Passed" if countWays(3) == 4 else "Failed"

test()