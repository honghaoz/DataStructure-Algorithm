from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Implement a function to check if a binary tree is a binary search tree
# General BST definition, left <= root < right

def isBST(root):
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

test()
