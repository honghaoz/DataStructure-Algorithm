from Queue import Queue
from Stack import Stack

# Set of stacks with threshold
class SetOfStacks:
	def __init__(self, threshold = 10):
		assert(threshold > 0)
		self.threshold = threshold
		self.plates = []
		self.currentPlateIndex = 0
		self.currentStack = []
		self.plates.append(self.currentStack)

	def push(self, newElement):
		if len(self.currentStack) == self.threshold:
			self.currentPlateIndex += 1
			self.currentStack = []
			self.plates.append(self.currentStack)
			self.currentStack.append(newElement)
		else:
			self.currentStack.append(newElement)

	def pop(self):
		if len(self.currentStack) == 0:
			if len(self.plates) == 0:
				return None
			self.plates.pop()
			self.currentStack = self.plates.pop()
			self.currentPlateIndex -= 1
			return self.currentStack.pop()
		else:
			return self.currentStack.pop()

	def popAt(self, index):
		if index >= len(self.plates):
			return None
		targetStack = self.plates[index]
		if len(targetStack) == 0:
			return None
		return targetStack.pop()

def test():
	s = SetOfStacks(3)
	s.push(1)
	s.push(22)
	s.push(-1)
	s.push(99)

	print s.plates

	print s.popAt(0)
	print s.pop()
	print s.pop()
	print s.pop()
	print s.pop()

test()