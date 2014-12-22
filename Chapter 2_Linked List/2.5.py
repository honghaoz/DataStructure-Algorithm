from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# You have two numbers represented by a linked list, where each node contains a single digit.
# The digits are stored in reverse order, such that the 1's digit is at the head of the list.
# Write a function that adds the two numbers and returns the sum as a linked list

def sum_reversed(aList, bList):
	currentA = aList.head
	currentB = bList.head
	lastDigit = 0
	sumList = LinkedList()
	while (not currentA == None) or (not currentB == None):
		summ = (currentA.data if not currentA == None else 0) + (currentB.data if not currentB == None else 0) + lastDigit
		rest = summ % 10
		lastDigit = summ / 10
		sumList.append(rest)
		currentA = currentA.next if not currentA == None else None
		currentB = currentB.next if not currentB == None else None

	if not lastDigit == 0:
		sumList.append(lastDigit)
	return sumList	

# Forward order

def sum_forward(aNode, bNode):
	pass

def test():
	aList = LinkedList()
	aList.append(7)
	aList.append(1)
	aList.append(6)
	aList.printOut()
	
	bList = LinkedList()
	bList.append(5)
	bList.append(9)
	bList.append(2)
	bList.printOut()

	expectedList = LinkedList()
	expectedList.append(2)
	expectedList.append(1)
	expectedList.append(9)

	resultList = sum_reversed(aList, bList)
	resultList.printOut()

	print "Passed" if resultList == expectedList else "Failed"

	aList = LinkedList()
	aList.append(7)
	aList.append(1)
	aList.append(6)
	aList.append(7)
	aList.printOut()
	
	bList = LinkedList()
	bList.append(5)
	bList.append(9)
	bList.append(2)
	bList.printOut()

	expectedList = LinkedList()
	expectedList.append(2)
	expectedList.append(1)
	expectedList.append(9)
	expectedList.append(7)

	resultList = sum_reversed(aList, bList)
	resultList.printOut()

	print "Passed" if resultList == expectedList else "Failed"

test()