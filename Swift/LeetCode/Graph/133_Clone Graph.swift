// 133_Clone Graph
// https://leetcode.com/problems/clone-graph/
//
// Created by Honghao Zhang on 11/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a reference of a node in a connected undirected graph, return a deep copy (clone) of the graph. Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors.
//
//
//
//Example:
//
//
//
//Input:
//{"$id":"1","neighbors":[{"$id":"2","neighbors":[{"$ref":"1"},{"$id":"3","neighbors":[{"$ref":"2"},{"$id":"4","neighbors":[{"$ref":"3"},{"$ref":"1"}],"val":4}],"val":3}],"val":2},{"$ref":"4"}],"val":1}
//
//Explanation:
//Node 1's value is 1, and it has two neighbors: Node 2 and 4.
//Node 2's value is 2, and it has two neighbors: Node 1 and 3.
//Node 3's value is 3, and it has two neighbors: Node 2 and 4.
//Node 4's value is 4, and it has two neighbors: Node 1 and 3.
//
//
//Note:
//
//The number of nodes will be between 1 and 100.
//The undirected graph is a simple graph, which means no repeated edges and no self-loops in the graph.
//Since the graph is undirected, if node p has node q as neighbor, then node q must have node p as neighbor too.
//You must return the copy of the given node as a reference to the cloned graph.
//

// Deep clone一个graph

import Foundation

class Num133 {
  // MARK: - DFS
  // 用一个全局的visited来保存original node -> copied node
  // 然后对于每个neighbor，调用clone function，然后设置为新的neighbor。
//  """
//  # Definition for a Node.
//  class Node(object):
//      def __init__(self, val, neighbors):
//          self.val = val
//          self.neighbors = neighbors
//  """
//  class Solution(object):
//      def __init__(self):
//          # Dictionary to save the visited node and it's respective clone
//          # as key and value respectively. This helps to avoid cycles.
//          self.visited = {}
//      # cloneGraph 返回的是node的clone。visited包含的是original -> clone。
//      def cloneGraph(self, node):
//          """
//          :type node: Node
//          :rtype: Node
//          """
//          if not node:
//              return node
//
//          # If the node was already visited before.
//          # Return the clone from the visited dictionary.
//          if node in self.visited:
//              return self.visited[node]
//
//          # Create a clone for the given node.
//          # Note that we don't have cloned neighbors as of now, hence [].
//          clone_node = Node(node.val, [])
//
//          # The key is original node and value being the clone node.
//          self.visited[node] = clone_node
//
//          # Iterate through the neighbors to generate their clones
//          # and prepare a list of cloned neighbors to be added to the cloned node.
//          if node.neighbors:
//              clone_node.neighbors = [self.cloneGraph(n) for n in node.neighbors]
//
//          return clone_node

  // MARK: - BFS
//  from collections import deque
//  class Solution(object):
//
//      def cloneGraph(self, node):
//          """
//          :type node: Node
//          :rtype: Node
//          """
//
//          if not node:
//              return node
//
//          # Dictionary to save the visited node and it's respective clone
//          # as key and value respectively. This helps to avoid cycles.
//          visited = {}
//
//          # Put the first node in the queue
//          queue = deque([node])
//          # Clone the node and put it in the visited dictionary.
//          visited[node] = Node(node.val, [])
//
//          # Start BFS traversal
//          while queue:
//              # Pop a node say "n" from the from the front of the queue.
//              n = queue.popleft()
//              # Iterate through all the neighbors of the node
//              for neighbor in n.neighbors:
//                  if neighbor not in visited:
//                      # Clone the neighbor and put in the visited, if not present already
//                      visited[neighbor] = Node(neighbor.val, [])
//                      # Add the newly encountered node to the queue.
//                      queue.append(neighbor)
//                  # Add the clone of the neighbor to the neighbors of the clone node "n".
//                  visited[n].neighbors.append(visited[neighbor])
//
//          # Return the clone of the node from visited.
//          return visited[node]
}
