from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Implement a function to check if a binary tree is a binary search tree
# General BST definition, left <= root < right

# Another idea is to in-order traverse the tree and check the array

def isBST(root):
	minn, maxx = isBSTHelper(root)
	if minn == False:
		return False
	else:
		return True

# This will return min and max value of tree rooted from root node
def isBSTHelper(root):
	if root == None:
		return None, None
	elif root.left == None and root.right == None:
		return root.key, root.key
	elif root.left == None:
		rightMin, rightMax = isBSTHelper(root.right)
		if rightMin == False:
			return False, False
		elif root.key >= rightMin:
			return False, False
		else:
			return root.key, rightMax
	elif root.right == None:
		leftMin, leftMax = isBSTHelper(root.left)
		if leftMin == False:
			return False, False
		elif leftMax > root.key:
			return False, False
		else:
			return leftMin, root.key
	else:
		leftMin, leftMax = isBSTHelper(root.left)
		if leftMin == False:
			return False, False
		rightMin, rightMax = isBSTHelper(root.right)
		if rightMin == False:
			return False, False
		if leftMax > root.key or root.key >= rightMin:
			return False, False
		else:
			return leftMin, rightMax

# Below is a buggy function
def isBST_Buggy(root):
	if root == None:
		return True
	elif root.left == None and root.right == None:
		return True
	elif root.left == None:
		if root.key >= root.right.key:
			return False
		else:
			return isBST(root.right)
	elif root.right == None:
		if root.left.key > root.key:
			return False
		else:
			return isBST(root.left)
	elif (root.left.key > root.key) or (root.key >= root.right.key):
		return False
	else:
		return isBST(root.left) and isBST(root.right)

# Helper
def createBSTWithMinimalHeight(array):
	lengthArray = len(array)
	if lengthArray == 0:
		return None
	elif lengthArray == 1:
		return TreeNode(array[0])
	else:
		middle = lengthArray / 2
		root = TreeNode(array[middle])
		root.left = createBSTWithMinimalHeight(array[:middle])
		root.right = createBSTWithMinimalHeight(array[middle + 1:])
		return root

def test():
	a = [1,2,3,4,5]
	root = createBSTWithMinimalHeight(a)
	print "Passed" if isBST(root) else "Failed"

	a = [1,2,6,4,5]
	root = createBSTWithMinimalHeight(a)
	print "Passed" if not isBST(root) else "Failed"

	root = TreeNode(3)
	node2 = TreeNode(2)
	root.left = node2
	node2.right = TreeNode(4)
	root.right = TreeNode(5)
	print "Passed" if not isBST(root) else "Failed"

	root = TreeNode(3)
	node2 = TreeNode(2)
	root.left = node2
	node2.right = TreeNode(3)
	root.right = TreeNode(5)
	print "Passed" if isBST(root) else "Failed"

	root = TreeNode(3)
	root.left = TreeNode(2)
	node5 = TreeNode(5)
	root.right = node5
	node5.left = TreeNode(4)
	print "Passed" if isBST(root) else "Failed"

	root = TreeNode(3)
	root.left = TreeNode(2)
	node5 = TreeNode(5)
	root.right = node5
	node5.left = TreeNode(2)
	print "Passed" if not isBST(root) else "Failed"

	root = TreeNode(3)
	root.left = TreeNode(2)
	node5 = TreeNode(5)
	root.right = node5
	node5.left = TreeNode(3)
	print "Passed" if not isBST(root) else "Failed"

test()
