# Linked List implementation

class Node:
	data = None
	next = None
	def __init__(self, data = None, next = None):
		self.data = data
		self.next = next

	def __str__(self):
		return str(self.data)

	def __repr__(self):
		return str(self.data)

	def append(self, aNode):
		self.next = aNode

class LinkedList:
	head = None
	tail = None
	def __init__(self):
		self.head = None
		self.tail = None

	def append(self, newData):
		newNode = newData
		# If newData is not kind of Node, create new Node
		if not type(newData) == type(Node(0)):
			newNode = Node(newNode)
		if self.tail == None:
			self.head = newNode
			self.tail = newNode
		else:
			self.tail.next = newNode
			self.tail = newNode
		return newNode

	def delete(self, targetData):
		if targetData == None:
			return None
		prev = None
		current = self.head
		while not current == None:
			if current.data == targetData:
				if prev == None: 
					# First node
					self.head = current.next
					return current
				elif current == self.tail:
					# Last node
					prev.next = None
					self.tail = prev
					return current
				else:
					# Other
					prev.next = current.next
					return current
			prev = current
			current = current.next
		return None

	def length(self):
		current = self.head
		length = 0
		while not current == None:
			length += 1
			current = current.next
		return length

	def __str__(self):
		current = self.head
		printBuffer = ""
		while not current == None:
			if not printBuffer == "":
				printBuffer += " -> "
			printBuffer += str(current.data)
			current = current.next
		return printBuffer if not len(printBuffer) == 0 else "Empty"

	def printOut(self):
		print str(self)

# def test():
# 	aList = LinkedList()
# 	aList.printOut()
# 	aList.append(Node("1"))
# 	aList.append(Node(2))
# 	aList.append(3)
# 	aList.printOut()
# 	print aList.length()
	
# 	aList.delete(2)
# 	aList.printOut()

# 	print aList.length()

# test()