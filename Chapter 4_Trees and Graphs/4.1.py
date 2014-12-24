from BinaryTree import TreeNode

# Implement a function to check if a binary tree is balanced. For the purposes of this question,
# a balanced tree is defined to be a tree such that the heights of the two subtrees of any node
# never differ by more than one.

# Time complexity is O(N log N)
def isBalanced(node):
	if node == None:
		return True
	if abs(getHeight(node.left) - getHeight(node.right)) > 1:
		return False
	else:
		return isBalanced(node.left) and isBalanced(node.right)

def getHeight(node):
	if node == None:
		return 0
	if node.left == None and node.right == None:
		return 0
	else:
		return max(getHeight(node.left), getHeight(node.right)) + 1

def isBalanced_efficient(node):
	return not checkHeight(node) == -1

def checkHeight(node):
	if node == None:
		return 0

	leftHeight = checkHeight(node.left)
	if leftHeight == -1:
		return -1

	rightHeight = checkHeight(node.right)
	if rightHeight == -1:
		return -1

	if abs(leftHeight - rightHeight) > 1:
		return -1
	else:
		return max(leftHeight, rightHeight) + 1

def test():
	rootNode = TreeNode(1)
	node2 = TreeNode(2)
	rootNode.left = node2
	rootNode.right = TreeNode(3)
	node2.left = TreeNode(4)

	print "Passed" if isBalanced(rootNode) else "Failed"
	print "Passed" if isBalanced_efficient(rootNode) else "Failed"

	rootNode = TreeNode(1)
	node2 = TreeNode(2)
	rootNode.left = node2
	rootNode.right = TreeNode(3)
	node4 = TreeNode(4)
	node2.left = node4
	node4.right = TreeNode(5)

	print "Passed" if not isBalanced(rootNode) else "Failed"
	print "Passed" if not isBalanced_efficient(rootNode) else "Failed"


test()
