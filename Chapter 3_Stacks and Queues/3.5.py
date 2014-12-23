from Queue import Queue
from Stack import Stack

class MyQueue:
	def __init__(self):
		self.inStack = Stack()
		self.outStack = Stack()

	def enqueue(self, newElement):
		self.inStack.push(newElement)

	def dequeue(self):
		if self.outStack.peek() == None:
			pop = self.inStack.pop()
			while not pop == None:
				self.outStack.push(pop)
				pop = self.inStack.pop()
		return self.outStack.pop()

def test():
	q = MyQueue()
	q.enqueue(1)
	q.enqueue(2)
	print q.dequeue()
	q.enqueue(3)
	print q.dequeue()
	print q.dequeue()
	q.enqueue(4)

	print q.dequeue()
	print q.dequeue()
	print q.dequeue()
	print q.dequeue()

test()