from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Remove duplicates from an unsorted linked list
# With buffer
def remove_duplicate(aList):
	recordDict = {}
	prev = None
	current = aList.head
	while not current == None:
		if current.data in recordDict:
			if current == aList.tail:
				prev.next = None
				aList.tail = prev
				prev = current
			else:
				prev.next = current.next
		else:
			recordDict[current.data] = 0
			prev = current
		current = current.next

# Without buffer
def remove_duplicated_no_buffer(aList):
	current = aList.head
	prev = None
	runner = aList.head
	while not current == None:
		prev = current
		runner = current.next
		while not runner == None:
			if runner.data == current.data:
				prev.next = runner.next
				if runner == aList.tail:
					aList.tail = prev
				runner = runner.next
			else:
				prev = runner
				runner = runner.next
		current = current.next

def test():
	print "Test1: "
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
	remove_duplicate(aList)
	aList.printOut()
	result = str(aList)

	aList = LinkedList()
	aList.append(1)
	aList.append(4)
	aList.append(3)
	aList.append(2)
	aList.append(5)
	aList.append(10)
	aList.append(6)
	aList.append(9)
	expected = str(aList)
	print "Passed" if result == expected else "Failed"

	print "Test2: "
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
	remove_duplicated_no_buffer(aList)
	aList.printOut()
	result = str(aList)

	aList = LinkedList()
	aList.append(1)
	aList.append(4)
	aList.append(3)
	aList.append(2)
	aList.append(5)
	aList.append(10)
	aList.append(6)
	aList.append(9)
	expected = str(aList)
	print "Passed" if result == expected else "Failed"

test()