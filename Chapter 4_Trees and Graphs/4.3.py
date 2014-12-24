from BinaryTree import TreeNode

# Given a sorted (increasing order) array with unique integer elements, write an algorithm to create
# a binary search tree with minimal height

# Idea: Divide and conquer, divide from middle and continue create tree for left side and right side

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
	a = [1,2,3,4,5,6,7,8,9]
	root = createBSTWithMinimalHeight(a)
	print root.key
	print root.left.key
	print root.left.left.key

	print "Pre-order"
	root.preOrderTraverse()

	print "In-order"
	root.inOrderTraverse()

	print "Post-order"
	root.postOrderTraverse()

test()
