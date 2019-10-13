from Queue import Queue
from Stack import Stack

# Sort a stack in ascending order (biggest items on top), you may use at most one additional
# stack to hold items

def sortStack(s):
	stackA = s
	stackB = Stack()
	while not stackA.isEmpty():
		maxm = popA(stackA)
		pushB(stackA, stackB, maxm)

	while not stackB.isEmpty():
		stackA.push(stackB.pop())

def popA(stackA):
	a = stackA.pop()
	b = stackA.pop()
	if b == None:
		return a
	if a > b:
		stackA.push(b)
		return a
	else:
		stackA.push(a)
		return b

def pushB(stackA, stackB, item):
	itemsCountPushedInA = 0
	itemHasPushed = False
	popB = stackB.pop()
	while not popB == None:
		if item < popB:
			stackB.push(popB)
			stackB.push(item)
			itemHasPushed = True
			break
		else:
			stackA.push(popB)
			itemsCountPushedInA += 1
			popB = stackB.pop()
	if not itemHasPushed:
		stackB.push(item)
	for i in xrange(itemsCountPushedInA):
		stackB.push(stackA.pop())

def test():
	s = Stack()
	s.push(3)
	s.push(1)
	s.push(2)
	s.push(5)
	s.push(4)
	sortStack(s)

	expected = Stack()
	expected.push(1)
	expected.push(2)
	expected.push(3)
	expected.push(4)
	expected.push(5)

	print s.bottomToTopList()
	print expected.bottomToTopList()
	print "Passed" if s.bottomToTopList() == expected.bottomToTopList() else "Failed"

	s = Stack()
	s.push(5)
	s.push(4)
	s.push(3)
	s.push(2)
	s.push(1)
	sortStack(s)

	expected = Stack()
	expected.push(1)
	expected.push(2)
	expected.push(3)
	expected.push(4)
	expected.push(5)

	print s.bottomToTopList()
	print expected.bottomToTopList()
	print "Passed" if s.bottomToTopList() == expected.bottomToTopList() else "Failed"

test()