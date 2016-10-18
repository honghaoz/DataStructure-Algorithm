from Queue import Queue
from Stack import Stack

# Added min function for stack

class ExtendedStack(Stack):
	def __init__(self):
		super(ExtendedStack, self).__init__()
		self.minValueStack = [] #  (value, index)
		self.minValue = None
		self.minIndex = -1

	def push(self, newElement):
		if super(ExtendedStack, self).push(newElement):
			if self.minValue == None or newElement < self.minValue:
				self.minValue = newElement
				self.minIndex = len(self._privateList) - 1
				self.minValueStack.append((self.minValue, self.minIndex))

	def pop(self):
		popedElement = super(ExtendedStack, self).pop()
		if not popedElement == None:
			if len(self._privateList) == self.minIndex:
				if len(self.minValueStack) == 0:
					self.minValue = None
					self.minIndex = -1
				else:
					self.minValueStack.pop()
					self.minValue, self.minIndex = self.minValueStack[-1]

	def min(self):
		return self.minValue

# Below is a naive solution
class ExtendedStackNavie(Stack):
	def __init__(self):
		super(ExtendedStack, self).__init__()
		self.minValue = None
		self.minIndex = -1

	def push(self, newElement):
		if super(ExtendedStack, self).push(newElement):
			if self.minValue == None or newElement < self.minValue:
				self.minValue = newElement
				self.minIndex = len(self._privateList) - 1

	def pop(self):
		popedElement = super(ExtendedStack, self).pop()
		if not popedElement == None:
			if len(self._privateList) == self.minIndex:
				self.updateMin()

	def updateMin(self):
		self.minValue = None
		self.minIndex = -1
		length = len(self._privateList)
		for i in xrange(length):
			if self.minValue == None or self._privateList[i] < self.minValue:
				self.minValue = self._privateList[i]
				self.minIndex = i

	def min(self):
		return self.minValue

def test():
	s = ExtendedStack()
	s.push(1)
	s.push(22)
	s.push(-1)
	s.push(99)
	print "Passed" if s.min() == -1 else "Failed"

	s = ExtendedStack()
	s.push(1)
	s.push(22)
	s.push(-1)
	s.push(99)
	s.pop()
	s.pop()
	print "Passed" if s.min() == 1 else "Failed"

test()