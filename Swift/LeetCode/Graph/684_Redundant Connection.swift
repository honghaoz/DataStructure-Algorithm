// 684_Redundant Connection
// https://leetcode.com/problems/redundant-connection/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// In this problem, a tree is an undirected graph that is connected and has no cycles.
//
//The given input is a graph that started as a tree with N nodes (with distinct values 1, 2, ..., N), with one additional edge added. The added edge has two different vertices chosen from 1 to N, and was not an edge that already existed.
//
//The resulting graph is given as a 2D-array of edges. Each element of edges is a pair [u, v] with u < v, that represents an undirected edge connecting nodes u and v.
//
//Return an edge that can be removed so that the resulting graph is a tree of N nodes. If there are multiple answers, return the answer that occurs last in the given 2D-array. The answer edge [u, v] should be in the same format, with u < v.
//
//Example 1:
//
//Input: [[1,2], [1,3], [2,3]]
//Output: [2,3]
//Explanation: The given undirected graph will be like this:
//  1
// / \
//2 - 3
//Example 2:
//
//Input: [[1,2], [2,3], [3,4], [1,4], [1,5]]
//Output: [1,4]
//Explanation: The given undirected graph will be like this:
//5 - 1 - 2
//    |   |
//    4 - 3
//Note:
//
//The size of the input 2D-array will be between 3 and 1000.
//Every integer represented in the 2D-array will be between 1 and N, where N is the size of the input array.
//

// 找出一个冗余的connection，删掉这个connection后，这个图就变成一个tree
// 如果有多个connection可以删除，删除掉最后一个出现的

import Foundation

class Num684 {
  // MARK: - 用Union-Find
  // TODO:
  // 需要构建一个特殊的data structure，保存每个节点的parent信息和每个parent的rank信息
  // find就是找出一个node的parent
  // union就是连接两个node，其实就是把两个node设置为同一个parent（具体选哪个为同一个parent，选rank高的那个）
  // rank越高的parent会有更多的节点
  // union会返回成功还是失败，如果失败，就代表两个node已经share同一个parent，那么这个就是冗余的connection
  // https://leetcode.com/articles/redundant-connection/
  
//  class DSU(object): // Disjoint Set Union (DSU)
//      def __init__(self):
//          self.par = range(1001)
//          self.rnk = [0] * 1001
//
//      def find(self, x):
//          if self.par[x] != x:
//              self.par[x] = self.find(self.par[x])
//          return self.par[x]
//
//      def union(self, x, y):
//          xr, yr = self.find(x), self.find(y)
//          if xr == yr:
//              return False
//          elif self.rnk[xr] < self.rnk[yr]:
//              self.par[xr] = yr
//          elif self.rnk[xr] > self.rnk[yr]:
//              self.par[yr] = xr
//          else:
//              self.par[yr] = xr
//              self.rnk[xr] += 1
//          return True
//
//  class Solution(object):
//      def findRedundantConnection(self, edges):
//          """
//          :type edges: List[List[int]]
//          :rtype: List[int]
//          """
//          dsu = DSU()
//          for edge in edges:
//              if not dsu.union(*edge):
//                  return edge
//
}
