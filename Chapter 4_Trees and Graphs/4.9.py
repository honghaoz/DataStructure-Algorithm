from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Given a binary tree in which each node contains an integer value (could be positive or negative)
# Design an algorithm to print all paths which sum to a given value. The path does not need to start
# or end at the root or a leaf, but it must go in a straight line down

def getPaths(root, targetValue):
	if root == None:
		return []
	newTargetValue = targetValue - root.key
	if newTargetValue == 0:
		return [[root.key]]
	possiblePaths = []
	leftPaths = getPaths(root.left, newTargetValue)
	if len(leftPaths) > 0:
		for eachPath in leftPaths:
			newPath = [root.key]
			newPath.extend(eachPath)
			possiblePaths.append(newPath)
	rightPaths = getPaths(root.right, newTargetValue)
	if len(rightPaths) > 0:
		for eachPath in rightPaths:
			newPath = [root.key]
			newPath.extend(eachPath)
			possiblePaths.append(newPath) 
	return possiblePaths

def test():
	node1 = TreeNode(1)
	node2 = TreeNode(2)
	node3 = TreeNode(3)
	node4 = TreeNode(4)
	node5 = TreeNode(4)
	node6 = TreeNode(1)
	node7 = TreeNode(-1)
	node8 = TreeNode(5)

	root = node4
	node4.addLeftChild(node2)
	node4.addRightChild(node6)
	node2.addLeftChild(node1)
	node2.addRightChild(node3)
	node6.addLeftChild(node5)
	node6.addRightChild(node7)
	node7.addLeftChild(node8)

	print getPaths(root, 9)

test()
