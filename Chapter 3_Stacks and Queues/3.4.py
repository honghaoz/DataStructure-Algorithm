from Queue import Queue
from Stack import Stack

class Hanoi:
	def __init__(self, diskNumber = 4):
		assert(diskNumber > 0)
		self.diskNumber = diskNumber
		self.towerA = Stack()
		self.towerB = Stack()
		self.towerC = Stack()
		for i in xrange(diskNumber):
			diskIndex = diskNumber - i
			self.towerA.push(diskIndex)

	def printTowers(self):
		towerA = self.towerA.bottomToTopList()
		towerB = self.towerB.bottomToTopList()
		towerC = self.towerC.bottomToTopList()
		for i in xrange(self.diskNumber):
			x = self.diskNumber - i -1
			printBuffer = ""
			printBuffer += str(towerA[x]) if x < len(towerA) else " " + "\t"
			printBuffer += str(towerB[x]) if x < len(towerB) else " " + "\t"
			printBuffer += str(towerC[x]) if x < len(towerC) else " "
			print printBuffer
		print "_\t_\t_"

	def play(self):
		self.moveTopNdisks(self.diskNumber, self.towerA, self.towerB, self.towerC)

	def moveTopNdisks(self, diskNumber, fromTower, middleTower, toTower):
		if diskNumber == 1:
			toTower.push(fromTower.pop())
		elif diskNumber == 2:
			# toTower.push(fromTower.pop())
			# middleTower.push(fromTower.pop())
			# fromTower.push(toTower.pop())
			# toTower.push(middleTower.pop())
			# toTower.push(fromTower.pop())
			middleTower.push(fromTower.pop())
			toTower.push(fromTower.pop())
			toTower.push(middleTower.pop())
		else:
			self.moveTopNdisks(diskNumber - 1, fromTower, middleTower, toTower)
			middleTower.push(fromTower.pop())
			self.moveTopNdisks(diskNumber - 1, toTower, middleTower, fromTower)
			toTower.push(middleTower.pop())
			self.moveTopNdisks(diskNumber - 1, fromTower, middleTower, toTower)

def test():
	h = Hanoi(6)
	h.printTowers()
	h.play()
	h.printTowers()

test()