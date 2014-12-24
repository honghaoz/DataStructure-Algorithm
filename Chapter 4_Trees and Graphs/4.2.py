from BinaryTree import TreeNode

# Given a directed graph, design an algorithm to find out whether there is a route between two nodes

# Idea: Just use BFS or DFS to traverse and see whether there is a root

def test():
	rootNode = TreeNode(1)
	node2 = TreeNode(2)
	rootNode.left = node2
	rootNode.right = TreeNode(3)
	node2.left = TreeNode(4)

	print "Passed" if isBalanced(rootNode) else "Failed"

test()
