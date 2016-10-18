from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Find the 'next' node (i.e., in-order successor) of a given node in a binary search tree.
# You may assume that each node has a link to its parent

def findSuccessor(node):
	if node == None:
		return None
	elif node.right == None:
		parent = node.parent
		if parent == None:
			return None
		elif node == parent.left:
			return parent
		else:
			# Right
			while node == parent.right:
				node = parent
				parent = node.parent
				if parent == None:
					return None
			return parent
	else:
		return findMinNode(node.right)

def findMinNode(root):
	if root == None:
		return None
	elif root.left == None:
		return root
	else:
		return findMinNode(root.left)

def test():
	node1 = TreeNode(1)
	node2 = TreeNode(2)
	node3 = TreeNode(3)
	node4 = TreeNode(4)
	node5 = TreeNode(5)
	node6 = TreeNode(6)
	node7 = TreeNode(7)

	root = node4
	node4.addLeftChild(node2)
	node2.addLeftChild(node1)
	node2.addRightChild(node3)
	node4.addRightChild(node6)
	node6.addLeftChild(node5)
	node6.addRightChild(node7)

	root.inOrderTraverse()

	print "Passed" if findSuccessor(node1) == node2 else "Failed"
	print "Passed" if findSuccessor(node4) == node5 else "Failed"
	print "Passed" if findSuccessor(node2) == node3 else "Failed"
	print "Passed" if findSuccessor(node3) == node4 else "Failed"
	print "Passed" if findSuccessor(node5) == node6 else "Failed"
	print "Passed" if findSuccessor(node7) == None else "Failed"

test()
