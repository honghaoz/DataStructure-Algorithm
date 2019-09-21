// 559_Maximum Depth of N-ary Tree
// https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a n-ary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//For example, given a 3-ary tree:
//
//
//
//
//
//
//We should return its max depth, which is 3.
//
//
//
//Note:
//
//The depth of the tree is at most 1000.
//The total number of nodes is at most 5000.
//

import Foundation

class Num559 {
  // Python
  // This is DFS with recursive, basically the same with the max depth of binary tree.
//  class Solution(object):
//  def maxDepth(self, root):
//      """
//      :type root: Node
//      :rtype: int
//      """
//      if root is None:
//        return 0
//      if len(root.children) == 0:
//        return 1
//
//      height = None
//      for node in root.children:
//        nodeHeight = self.maxDepth(node)
//        if height is None:
//          height = nodeHeight
//          continue
//        height = max(nodeHeight, height)
//
//      return height + 1
}
