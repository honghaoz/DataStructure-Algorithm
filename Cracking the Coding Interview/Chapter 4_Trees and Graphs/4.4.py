from BinaryTree import TreeNode
from LinkedList_Basic import Node, LinkedList
from Queue import Queue

# Given a binary tree, design an algorithm which creates a linked list of all the nodes at each
# Depth (e.g., if you have a tree with depth D, you'll have D linked lists).

# Traverse version
def createLinkedListTraverse(root):
	listsDict = {}
	createLinkedListTraverseHelper(root, 0, listsDict)
	return listsDict.values()

def createLinkedListTraverseHelper(root, depth, listsDict):
	if root == None:
		return
	createLinkedListTraverseHelper(root.left, depth + 1, listsDict)
	createLinkedListTraverseHelper(root.right, depth + 1, listsDict)
	currentList = None
	if depth in listsDict:
		currentList = listsDict[depth]
	else:
		currentList = LinkedList()
		listsDict[depth] = currentList
	currentList.append(root)

# BFS version
def createLinkedListBFS(root):
	linkedLists = []
	if root == None:
		return linkedLists
	currentLinkedList = LinkedList()
	currentLinkedList.append(root)

	while currentLinkedList.length() > 0:
		nextLevelList = LinkedList()
		for eachNode in currentLinkedList:
			if not eachNode.left == None:
				nextLevelList.append(eachNode.left)
			if not eachNode.right == None:
				nextLevelList.append(eachNode.right)
		linkedLists.append(currentLinkedList)
		currentLinkedList = nextLevelList
	return linkedLists

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

	lists = createLinkedListTraverse(root)
	for eachList in lists:
		print [eachElement.key for eachElement in eachList]
	
	lists = createLinkedListBFS(root)
	for eachList in lists:
		print [eachElement.key for eachElement in eachList]

test()
