# Imagine a robot sitting on the upper left corner of and X by Y grid. The robot can only move in
# two directions: right and down. How many possible paths are there for the robot go from (0,0) to
# (X, Y)

def pathsTo(x, y):
	return pathsFromTo(0, 0, x, y)

def pathsFromTo(x1, y1, x2, y2):
	if x1 > x2 or y1 > y2 or (x1 == x2 and y1 == y2):
		return 0
	elif x1 == x2 or y1 == y2:
		return 1
	else:
		return pathsFromTo(x1 + 1, y1, x2, y2) + pathsFromTo(x1, y1 + 1, x2, y2)

def test():
	print "Passed" if pathsTo(0, 0) == 0 else "Failed"
	print "Passed" if pathsTo(0, 1) == 1 else "Failed"
	print "Passed" if pathsTo(1, 0) == 1 else "Failed"
	print "Passed" if pathsTo(1, 1) == 2 else "Failed"
	print "Passed" if pathsTo(2, 1) == 3 else "Failed"
	print "Passed" if pathsTo(5, 1) == 6 else "Failed"
	print "Passed" if pathsTo(3, 4) == 35 else "Failed"

test()