from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Partition a linked list around a value x, such that all nodes less than x 
# come before all nodes greater than or equal to x

# This buggy
# def partition(aList, x):
# 	if aList.head == None:
# 		return None
# 	prevA = None
# 	A = aList.head
# 	B = aList.head.next
# 	nextB = None

# 	while not B == None:
# 		if A.data < x:
# 			prevA = A
# 			A = B
# 			B = B.next
# 		elif A.data >= x and B.data >= x:
# 			break			
# 		else:
# 			# A.data >= x and B.data < x
# 			# Swap
# 			if not prevA == None:
# 				prevA.next = B
# 			else:
# 				aList.head = B
# 			nextB = B.next
# 			B.next = A
# 			A.next = nextB
# 			A, B = B, A

def partitionSolution(aList, x):
	firstHead = None
	firstTail = None
	secondHead = None
	secondTail = None

	current = aList.head
	while not current == None:
		if current.data < x:
			if firstTail == None:
				firstTail = current
				firstHead = current
			else:
				firstTail.next = current
				firstTail = current
		else:
			if secondTail == None:
				secondTail = current
				secondHead = current
			else:
				secondTail.next = current
				secondTail = current
		current = current.next
	if firstHead == None or secondHead == None:
		return
	else:
		# Remember to flag the tail
		firstTail.next = None
		secondTail.next = None

		aList.head = firstHead
		firstTail.next = secondHead
		aList.tail = secondTail

def test():
	aList = LinkedList()
	aList.append(3)
	aList.append(1)
	aList.append(2)
	aList.append(5)
	aList.append(4)
	aList.printOut()
	partitionSolution(aList, 3)
	aList.printOut()
	result = str(aList)
	
	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	aList.append(3)
	aList.append(5)
	aList.append(4)
	expected = str(aList)

	print "Passed" if result == expected else "Failed"

	aList = LinkedList()
	aList.append(3)
	aList.append(1)
	aList.append(2)
	aList.append(5)
	aList.append(4)
	aList.printOut()
	partitionSolution(aList, 5)
	aList.printOut()
	result = str(aList)
	
	aList = LinkedList()
	aList.append(3)
	aList.append(1)
	aList.append(2)
	aList.append(4)
	aList.append(5)
	expected = str(aList)
	
	print "Passed" if result == expected else "Failed"

	aList = LinkedList()
	aList.append(3)
	aList.append(1)
	aList.append(2)
	aList.append(5)
	aList.append(4)
	aList.append(0)
	aList.printOut()
	partitionSolution(aList, 1)
	aList.printOut()
	result = str(aList)
	
	aList = LinkedList()
	aList.append(0)
	aList.append(3)
	aList.append(1)
	aList.append(2)
	aList.append(5)
	aList.append(4)
	expected = str(aList)
	
	print "Passed" if result == expected else "Failed"

test()