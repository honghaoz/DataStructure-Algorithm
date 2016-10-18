# Linked List implementation

class Node:
	data = None
	next = None
	prev = None
	def __init__(self, data = None, next = None, prev = None):
		self.data = data
		self.next = next
		self.prev = prev

	def __str__(self):
		return str(self.data)

	def __repr__(self):
		return str(self.data)

	def __eq__(self, right):
		if not isinstance(right, Node):
			return NotImplemented
		else:
			return (self.data == right.data) and (self.next is right.next) and (self.prev is right.prev)

	def __ne__(self, right):
		result = self.__eq__(right)
		if not result == NotImplemented:
			return not result
		else:
			return result

	def append(self, aNode):
		self.next = aNode
		aNode.prev = self
		return self

	def appendBefore(self, aNode):
		self.prev = aNode
		aNode.next = self
		return aNode

	def printOut(self):
		current = self
		printBuffer = ""
		while not current == None:
			if not printBuffer == "":
				printBuffer += " -> "
			printBuffer += str(current.data)
			current = current.next
		print printBuffer if not len(printBuffer) == 0 else "Empty"

	def printOutReversed(self):
		current = self
		printBuffer = ""
		while not current == None:
			if not printBuffer == "":
				printBuffer = " -> " + printBuffer
			printBuffer = str(current.data) + printBuffer
			current = current.prev
		print printBuffer if not len(printBuffer) == 0 else "Empty"

class LinkedList:
	head = None
	tail = None

	def __init__(self, node = None):
		if node == None:
			self.head = None
			self.tail = None
			return
		if isinstance(node, Node):
			self.head = node
			current = self.head
			if current == None:
				self.tail = current
				return
			while not current.next == None:
				current = current.next
			self.tail = current

	def append(self, newData):
		newNode = newData
		# If newData is not kind of Node, create new Node
		if not isinstance(newData, Node):
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

	def __eq__(self, right):
		if not isinstance(right, LinkedList):
			return NotImplemented
		if not self.length() == right.length():
			return False
		currentA = self.head
		currentB = right.head
		while not currentA == None:
			if not currentA.data == currentB.data:
				return False
			currentA = currentA.next
			currentB = currentB.next
		return True

	def __ne__(self, right):
		result = self.__eq__(right)
		if result is NotImplemented:
			return result
		return not result

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
# 	# Node tests
# 	print "Node Tests:"
# 	aNode = Node(3)
# 	aNode.append(Node(4).append(Node(5).append(Node(6))))
# 	node2 = aNode.appendBefore(Node(2))
# 	node1 = node2.appendBefore(Node(1))
# 	node1.printOut()
# 	aNode.printOutReversed()

# 	print "\nLinkedList Tests:"
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