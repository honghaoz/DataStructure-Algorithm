from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

def test():
	aList = LinkedList()
	aList.printOut()
	aList.append(Node("1"))
	aList.append(Node(2))
	aList.append(3)
	aList.printOut()

	aList.delete(2)
	aList.printOut()

test()