# Graph implementation

# Reference http://stackoverflow.com/questions/19472530/representing-graphs-data-structure-in-python
# Reference http://interactivepython.org/courselib/static/pythonds/Graphs/graphintro.html

# from enum import Enum

class GraphNode:
	def __init__(self, key):
		self.key = key
		self.adjacents = []

	def addNeighbor(self, neighbor):
		if not isinstance(neighbor, GraphNode):
			return False
		self.adjacents.append(neighbor)
		return True

	def __str__(self):
		return str(self.key) + ": " + str([x.key for x in self.adjacents])

class Graph:
	def __init__(self):
		self.nodes = []
		self.isDirected = False

	def addNode(self, keyOrNode):
		if self.contain(keyOrNode):
			return self.getNodeByKey(keyOrNode.key if isinstance(keyOrNode, GraphNode) else keyOrNode)
		newNode = keyOrNode if isinstance(keyOrNode, GraphNode) else GraphNode(keyOrNode)
		self.nodes.append(newNode)
		return newNode

	def getNodeByKey(self, key):
		if not isinstance(key, int):
			return None
		else:
			resultNodes = filter(lambda node: node.key == key, self.nodes)
			length = len(resultNodes)
			if length == 0:
				return None
			elif length == 1:
				return resultNodes[0]
			else:
				assert(False)

	def contain(self, keyOrNode):
		key = keyOrNode.key if isinstance(keyOrNode, GraphNode) else keyOrNode
		return len(filter(lambda node: node.key == key, self.nodes)) >= 1

	def addEdge(self, fromKeyOrNode, toKeyOrNode):
		fromNode = None
		toNode = None
		if not self.contain(fromKeyOrNode):
			fromNode = self.addNode(fromKeyOrNode)
		else:
			fromNode = fromKeyOrNode if isinstance(fromKeyOrNode, GraphNode) else self.getNodeByKey(fromKeyOrNode)
		if not self.contain(toKeyOrNode):
			toNode = self.addNode(toKeyOrNode)
		else:
			toNode = toKeyOrNode if isinstance(toKeyOrNode, GraphNode) else self.getNodeByKey(toKeyOrNode)
		fromNode.addNeighbor(toNode)
		if not self.isDirected:
			toNode.addNeighbor(fromNode)

	def getNodeKeys(self):
		return map(lambda node: node.key, self.nodes)

	def __iter__(self):
		return iter(self.nodes)

	def __str__(self):
		printBuffer = ""
		for eachNode in self.nodes:
			printBuffer += str(eachNode) + "\n"

		printBuffer = printBuffer[:len(printBuffer) - 1]
		return printBuffer

# def test():
# 	print "Node"
# 	node = GraphNode(1)
# 	node.addNeighbor(GraphNode(2))
# 	print node

# 	print "\nGraph"
# 	g = Graph()
# 	g.addNode(1)
# 	g.addNode(2)
# 	g.addEdge(1, 2)
# 	g.addEdge(4, 5)
# 	g.addEdge(4, 2)
# 	print g

# 	print g.nodes
# 	print g.getNodeKeys()

# 	print g.contain(node)
# 	g.addNode(node)
# 	print g

# test()