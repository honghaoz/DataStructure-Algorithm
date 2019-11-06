// 104_Maximum Depth of Binary Tree
// https://leetcode.com/problems/maximum-depth-of-binary-tree/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, find its maximum depth.
//
//The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given binary tree [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//return its depth = 3.
//

import Foundation

class Num104 {
  // Recurisve way
  func maxDepth(_ root: TreeNode?) -> Int {
      if root == nil {
        return 0
      }
    let leftMax = maxDepth(root?.left)
    let rightMax = maxDepth(root?.right)
    return max(leftMax, rightMax) + 1
  }

  /// DFS with stack
  func maxDepth_iterative(_ root: TreeNode?) -> Int {
    guard root != nil else {
      return 0
    }

    var stack: [TreeNode] = []
    var depths: [Int] = []
    var result: Int = 0

    stack.append(root!)
    depths.append(1)

    while !stack.isEmpty {
      let last = stack.popLast()!
      let currentDepth = depths.popLast()!

      result = max(currentDepth, result)

      if let left = last.left {
        stack.append(left)
        depths.append(currentDepth + 1)
      }
      if let right = last.right {
        stack.append(right)
        depths.append(currentDepth + 1)
      }
    }
    return result
  }

  // BFS with queue
  func maxDepth_iterative2(_ root: TreeNode?) -> Int {
    guard root != nil else {
      return 0
    }

    var queue: [TreeNode] = []
    var depths: [Int] = []
    var result: Int = 0

    queue.append(root!)
    depths.append(1)

    while !queue.isEmpty {
      let last = queue.removeFirst()
      let currentDepth = depths.removeFirst()
      result = max(currentDepth, result)

      if let left = last.left {
        queue.append(left)
        depths.append(currentDepth + 1)
      }
      if let right = last.right {
        queue.append(right)
        depths.append(currentDepth + 1)
      }
    }
    return result
  }
}
