from LinkedList_Basic import Node
from LinkedList_Basic import LinkedList

# Given a circular linked list, implement an algorithm which returns the node at the beginning of the loop
# Input: A -> B -> C -> D -> E -> C
# Output: C

# Scheme: two runners, the fast one is two times faster
# Let k is length between head and loop start point
# When first time collide, slow runner is k steps away start point
# Let faster runner to head, then same speed with slow runner
# The collide point fot the second time is the start point
def findStartPoint(aNode):
	if aNode == None:
		return None
	head = aNode
	fastRunner = aNode
	slowRunner = aNode
	slowRunner = slowRunner.next
	fastRunner = fastRunner.next.next
	# First time collide
	while not slowRunner == fastRunner:
		slowRunner = slowRunner.next
		fastRunner = fastRunner.next.next

	fastRunner = head
	while not slowRunner == fastRunner:
		slowRunner = slowRunner.next
		fastRunner = fastRunner.next
	return slowRunner

def test():
	node1 = Node(1)
	node2 = Node(2)
	node3 = Node(3)
	node4 = Node(4)
	node5 = Node(5)
	node6 = Node(6)

	node1.append(node2)
	node2.append(node3)
	node3.append(node4)
	node4.append(node5)
	node5.append(node6)
	node6.next = node3

	resultNode = findStartPoint(node1)
	print resultNode.data
	print "Passed" if resultNode == node3 else "Failed"

	node1 = Node(1)
	node2 = Node(2)
	node3 = Node(3)
	node4 = Node(4)
	node5 = Node(5)
	node6 = Node(6)

	node1.append(node2)
	node2.append(node3)
	node3.append(node4)
	node4.append(node5)
	node5.append(node6)
	node6.next = node2

	resultNode = findStartPoint(node1)
	print resultNode.data
	print "Passed" if resultNode == node2 else "Failed"

test()