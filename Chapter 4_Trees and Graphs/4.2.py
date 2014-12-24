from Graph import GraphNode, Graph
from Queue import Queue
# Given a directed graph, design an algorithm to find out whether there is a route between two nodes

# Idea: Just use BFS or DFS to traverse and see whether there is a root

# DFS version
def isConnectedDFS(graph, node1Key, node2Key):
	for node in graph.nodes:
		node.isChecked = False

	result = isConnectedDFSHelper(graph, node1Key, node2Key)
	if result == None:
		return False
	else:
		return True

def isConnectedDFSHelper(graph, node1Key, node2Key):
	node1 = graph.getNodeByKey(node1Key)
	node1.isChecked = True
	for eachNode in node1.adjacents:
		if eachNode.key == node2Key:
			return True
		eachNode.isChecked = True
		return isConnectedDFSHelper(graph, eachNode.key, node2Key)

# BFS version
def isConnectedBFS(graph, node1Key, node2Key):
	for node in graph.nodes:
		node.isChecked = False

	result = isConnectedBFSHelper(graph, node1Key, node2Key)
	if result == None:
		return False
	else:
		return True

def isConnectedBFSHelper(graph, node1Key, node2Key):
	node1 = graph.getNodeByKey(node1Key)
	q = Queue()
	q.enqueue(node1)
	while not q.isEmpty():
		node = q.dequeue()
		node.isChecked = True
		for eachNode in node.adjacents:
			if eachNode.key == node2Key:
				return True
			if not eachNode.isChecked:
				q.enqueue(eachNode)


def test():
	g = Graph()
	g.isDirected = True
	g.addEdge(1, 2)
	g.addEdge(2, 3)
	g.addEdge(2, 4)
	g.addEdge(3, 5)
	print g
	print "Passed" if isConnectedDFS(g, 1, 5) else "Failed"
	print "Passed" if not isConnectedDFS(g, 4, 5) else "Failed"
	print "Passed" if isConnectedBFS(g, 1, 5) else "Failed"
	print "Passed" if not isConnectedBFS(g, 4, 5) else "Failed"

test()
