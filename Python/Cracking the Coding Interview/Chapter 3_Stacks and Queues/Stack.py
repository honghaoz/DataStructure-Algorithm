# Linked List implementation

class Stack(object):
	
	def __init__(self):
		self._privateList = []
		
	def peek(self):
		return self.top()

	def top(self):
		if len(self._privateList) == 0:
			return None
		return self._privateList[-1]

	def pop(self):
		if len(self._privateList) == 0:
			return None
		return self._privateList.pop()

	def push(self, newElement):
		self._privateList.append(newElement)
		return True

	def isEmpty(self):
		return len(self._privateList) == 0

	def bottomToTopList(self):
		return self._privateList
		
	def topToBottomList(self):
		return self._privateList[::-1]

# def test():
# 	s = Stack()
# 	s.push(1)
# 	s.push(2)
# 	s.push(3)
# 	print s.pop()
# 	print s.pop()
# 	print s.pop()

# test()