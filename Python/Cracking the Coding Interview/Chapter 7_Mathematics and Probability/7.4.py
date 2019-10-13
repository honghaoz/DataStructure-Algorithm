# Write methods to implement the multiply, subtract, and divide operations for integers.
# Use only the add operator.

# multiply
def multiply(a, b):
	summ = 0
	if b == 0:
		return 0
	elif b > 0:
		for i in xrange(b):
			summ += a
		return summ
	else:
		for i in xrange(b, 0):
			summ += a
		return negate(summ)

def subtract(a, b):
	# a - b 
	return a + negate(b)

def negate(num):
	assert(isinstance(num, int))
	if num == 0:
		return num
	elif num > 0:
		for i in xrange(0, num + num):
			num += -1
		return num
	else:
		for i in xrange(num + num, 0):
			num += 1
		return num

def divide(a, b):
	assert(not b == 0)
	negativeFlag = False
	if a < 0 or b < 0:
		negativeFlag = True
		a = a if a > 0 else negate(a)
		b = b if b > 0 else negate(b)
	if a == b:
		return 1 if not negativeFlag else -1
	elif a < b:
		return 0
	else:
		res = 0
		while a >= b:
			res += 1
			a = subtract(a, b)
		return res if not negativeFlag else negate(res)

def test():
	print "Passed" if multiply(2, 3) == 6 else "Failed"
	print "Passed" if multiply(2, 0) == 0 else "Failed"
	print "Passed" if multiply(2, -4) == -8 else "Failed"

	print "Passed" if subtract(2, 3) == -1 else "Failed"
	print "Passed" if subtract(2, 2) == 0 else "Failed"
	print "Passed" if subtract(2, -2) == 4 else "Failed"

	print "Passed" if divide(2, 1) == 2 else "Failed"
	print "Passed" if divide(2, 4) == 0 else "Failed"
	print "Passed" if divide(2, 2) == 1 else "Failed"
	print "Passed" if divide(2, -1) == -2 else "Failed"
	print "Passed" if divide(-2, 4) == 0 else "Failed"
	print "Passed" if divide(-2, 2) == -1 else "Failed"

test()
