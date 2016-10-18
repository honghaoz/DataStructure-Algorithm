from LinkedList_Basic import Node
from Queue import Queue
from Stack import Stack

# Animal Shelter, holds only dogs/cats, and operates on a strictly "first in, first out" basis.
# People must adopt either the "oldest" of all animals at the shelter, or they can select whether
# they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot
# select which specific animal they would like to.
# Create the data structures to maintain this system and implement operations such as enqueue,
# dequeueAny, dequeueDog, dequeueCat. You may use the LinkedList

sharedOrder = 0

class Animal(object):
	def __init__(self):
		global sharedOrder
		self.order = sharedOrder
		sharedOrder += 1

class Dog(Animal):
	def __init__(self):
		super(Dog, self).__init__()

class Cat(Animal):
	def __init__(self):
		super(Cat, self).__init__()

class AnimalShelter:
	def __init__(self):
		self.dogQueue = Queue()
		self.catQueue = Queue()

	def enqueue(self, newAnimal):
		if isinstance(newAnimal, Dog):
			self.dogQueue.enqueue(newAnimal)
		elif isinstance(newAnimal, Cat):
			self.catQueue.enqueue(newAnimal)
		else:
			assert(False)

	def dequeueAny(self):
		firstDog = self.dogQueue.peek()
		firstCat = self.catQueue.peek()
		if firstDog == None:
			return self.catQueue.dequeue()
		if firstCat == None:
			return self.dogQueue.dequeue()
		if firstDog.order < firstCat.order:
			return self.dogQueue.dequeue()
		else:
			return self.catQueue.dequeue()

	def dequeueDog(self):
		return self.dogQueue.dequeue()

	def dequeueCat(self):
		return self.catQueue.dequeue()

def test():
	shelter = AnimalShelter()
	shelter.enqueue(Dog())
	shelter.enqueue(Cat())
	shelter.enqueue(Cat())
	shelter.enqueue(Dog())

	print shelter.dequeueAny()
	print shelter.dequeueAny()
	print shelter.dequeueAny()
	print shelter.dequeueAny()

test()