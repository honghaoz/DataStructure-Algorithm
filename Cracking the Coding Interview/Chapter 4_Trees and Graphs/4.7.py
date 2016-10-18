from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Find the first common ancestor of two nodes in a binary tree. Avoid storing additional nodes in
# a data structure

def findCommonAncestorHasParent(node1, node2):
	parent1 = node1
	while not parent1 == None:
		parent2 = node2
		while not parent2 == None:
			if parent1 == parent2:
				return parent1
			parent2 = parent2.parent
		parent1 = parent1.parent
	return None

def contain(root, node):
	if root == None or node == None:
		return False
	if root == node:
		return True
	return contain(root.left, node) or contain(root.right, node)

def findCommonAncestorWithoutParent(root, node1, node2):
	if root == None or node1 == None or node2 == None:
		return None
	if not (contain(root, node1) and contain(root, node2)):
		return None
	if root.key == node1.key:
		if contain(root.left, node2) or contain(root.right, node2):
			return root
	if root.key == node2.key:
		if contain(root.left, node1) or contain(root.right, node1):
			return root
	isNode1Left = contain(root.left, node1)
	isNode2Left = contain(root.left, node2)
	if not isNode1Left == isNode2Left:
		return root
	elif isNode1Left == True and isNode2Left == True:
		return findCommonAncestorWithoutParent(root.left, node1, node2)
	else:
		return findCommonAncestorWithoutParent(root.right, node1, node2)

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

	node8 = TreeNode(8)

	print "Passed" if findCommonAncestorHasParent(node1, node3) == node2 else "Failed"
	print "Passed" if findCommonAncestorHasParent(node1, node5) == node4 else "Failed"
	print "Passed" if findCommonAncestorHasParent(node1, node4) == node4 else "Failed"
	print "Passed" if findCommonAncestorHasParent(node1, node8) == None else "Failed"

	print "Passed" if findCommonAncestorWithoutParent(root, node1, node3) == node2 else "Failed"
	print "Passed" if findCommonAncestorWithoutParent(root, node1, node5) == node4 else "Failed"
	print "Passed" if findCommonAncestorWithoutParent(root, node1, node4) == node4 else "Failed"
	print "Passed" if findCommonAncestorWithoutParent(root, node1, node8) == None else "Failed"

test()
