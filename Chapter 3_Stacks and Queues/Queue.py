# Linked List implementation

class Queue:

	def __init__(self):
		self._privateList = []

	def enqueue(self, newElement):
		self._privateList.append(newElement)

	def dequeue(self):
		if len(self._privateList) == 0:
			return None
		first = self._privateList[0]
		del self._privateList[0]
		return first

# def test():
# 	q = Queue()
# 	q.enqueue(1)
# 	q.enqueue(2)
# 	q.enqueue(3)
# 	print q.dequeue()
# 	print q.dequeue()
# 	print q.dequeue()
# 	print q.dequeue()

# test()