from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Find the kth to last element of a singly linked list
# Start with 1
def findKthToLast(aList, k):
	length = aList.length()
	target = length - k
	if target < 0 or target >= length:
		return None
	currentIndex = 0
	current = aList.head
	while not current == None:
		if currentIndex == target:
			return current.data
		currentIndex += 1
		current = current.next

# Recursion, only print out, return counter
def printKthToLast(node, k):
	if node == None:
		return 0
	else:
		index = printKthToLast(node.next, k) + 1
		if index == k:
			print node.data
		return index

# Recursion
def headIndexToLast(node):
	if node == None:
		return 0
	else:
		return headIndexToLast(node.next) + 1

def findKthToLastRecursion(node, k):
	if node == None:
		return None
	if headIndexToLast(node) == k:
		return node.data
	else:
		return findKthToLastRecursion(node.next, k)
# Summary of recursion: need to pass back counter and value, could use static value or class wrapper to do it

# Iterative
def findKthToLastIterative(aList, k):
	# Set up two pointer with offset
	p1 = aList.head
	p2 = aList.head
	for i in xrange(k):
		if p2.next == None:
			return None
		p2 = p2.next

	# Run it
	while not p2 == None:
		p1 = p1.next
		p2 = p2.next

	return p1.data

def test():
	aList = LinkedList()
	aList.append(1)
	aList.append(4)
	aList.append(3)
	aList.append(2)
	aList.append(4)
	aList.append(3)
	aList.append(1)
	aList.append(5)
	aList.append(10)
	aList.append(6)
	aList.append(9)
	aList.append(6)
	aList.printOut()
	
	print "Passed" if 6 == findKthToLast(aList, 1) else "Failed"
	print "Passed" if 6 == findKthToLast(aList, 3) else "Failed"

	printKthToLast(aList.head, 2)
	print "Passed" if 6 == findKthToLastRecursion(aList.head, 1) else "Failed"
	print "Passed" if 6 == findKthToLastRecursion(aList.head, 3) else "Failed"

	print "Passed" if 6 == findKthToLastIterative(aList, 1) else "Failed"
	print "Passed" if 6 == findKthToLastIterative(aList, 3) else "Failed"

test()