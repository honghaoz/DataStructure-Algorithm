# BinarySearchTree implementation

# Reference: http://stackoverflow.com/questions/2598437/how-to-implement-a-binary-tree-in-python

class TreeNode:
	def __init__(self, key):
		self.key = key
		self.left = None
		self.right = None
		self.parent = None

class BinarySearchTree:
	def __init__(self):
		self.root = None

	def insert(self, key):
		newNode = TreeNode(key)
		currentNode = self.root
		parentOfCurrentNode = None
		while not currentNode == None:
			parentOfCurrentNode = currentNode
			if key < currentNode.key:
				currentNode = currentNode.left
			else:
				currentNode = currentNode.right
		newNode.parent = parentOfCurrentNode
		if parentOfCurrentNode == None:
			# Root node
			self.root = newNode
		else:
			if key < parentOfCurrentNode.key:
				parentOfCurrentNode.left = newNode
			else:
				parentOfCurrentNode.right = newNode
		return newNode

	# def delete(self, node):
	# 	parentOfCurrentNode = None
	# 	currentNode = self.root
	# 	while not currentNode == node:
	# 		parentOfCurrentNode
	# 		if node.key < currentNode:
	# 			currentNode


# def test():
# 	s = Stack()
# 	s.push(1)
# 	s.push(2)
# 	s.push(3)
# 	print s.pop()
# 	print s.pop()
# 	print s.pop()

# test()