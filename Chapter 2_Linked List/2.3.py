from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Delete a node in the middle of a singly linked list, given only access to that node
# Input: a -> b -> c -> d -> e
# Output: a -> b -> d -> e

# This is bad, head is not given
def removeMiddle(aList, middleNode):
	prev = None
	current = aList.head
	while not current == middleNode:
		prev = current
		current = current.next
	prev.next = middleNode.next

# Solution
def removeMiddleSolution(middleNode):
	currentNode = middleNode
	nextNode = middleNode.next
	while not nextNode.next == None:
		currentNode.data = nextNode.data
		currentNode = nextNode
		nextNode = nextNode.next
	currentNode.data = nextNode.data
	currentNode.next = None

def test():
	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	middle = aList.append(3)
	aList.append(4)
	aList.append(5)
	aList.printOut()
	removeMiddle(aList, middle)
	aList.printOut()
	result = str(aList)
	
	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	aList.append(4)
	aList.append(5)
	expected = str(aList)
	
	print "Passed" if result == expected else "Failed"

	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	middle = aList.append(3)
	aList.append(4)
	aList.append(5)
	aList.printOut()
	removeMiddleSolution(middle)
	aList.printOut()
	result = str(aList)
	
	aList = LinkedList()
	aList.append(1)
	aList.append(2)
	aList.append(4)
	aList.append(5)
	expected = str(aList)
	
	print "Passed" if result == expected else "Failed"

test()