// 111_Minimum Depth of Binary Tree
// https://leetcode.com/problems/minimum-depth-of-binary-tree/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, find its minimum depth.
//
//The minimum depth is the number of nodes along the shortest path from the root node down to the nearest leaf node.
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
//return its minimum depth = 2.
//
//
//

import Foundation

class Num111 {
  /// DFS but check if the there's real branch
  func minDepth(_ root: TreeNode?) -> Int {
    return minDepthHelper(root) ?? 0
  }

  /// Returns the min depth of a node, returns nil if this node is nil.
  private func minDepthHelper(_ root: TreeNode?) -> Int? {
    if root == nil {
      return nil
    }

    let left = minDepthHelper(root?.left)
    let right = minDepthHelper(root?.right)
    if let realLeft = left, let realRight = right {
      return min(realLeft, realRight) + 1
    }
    else if let realLeft = left, right == nil {
      return realLeft + 1
    }
    else if let realRight = right, left == nil {
      return realRight + 1
    }
    else {
      return 1
    }
  }

  /// DFS with stack
  func minDepth_iterative(_ root: TreeNode?) -> Int {
    guard root != nil else {
      return 0
    }
    var stack: [TreeNode] = []
    var depths: [Int] = []
    stack.append(root!)
    depths.append(1)

    // the current min depth
    var result: Int = Int.max

    while !stack.isEmpty {
      let last = stack.popLast()!
      let currentDepth = depths.popLast()!
      // this is the leaf, record the min depth
      if last.left == nil && last.right == nil {
        result = min(result, currentDepth)
      }

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

  /// BFS with queue
  func minDepth_iterative_bfs(_ root: TreeNode?) -> Int {
    guard root != nil else {
      return 0
    }
    var queue: [TreeNode] = []
    var depths: [Int] = []
    queue.append(root!)
    depths.append(1)

    while !queue.isEmpty {
      let last = queue.removeFirst()
      let currentDepth = depths.removeFirst()

      // this is the leaf, since this is BFS, we find the min depth
      if last.left == nil && last.right == nil {
        return currentDepth
      }

      if let left = last.left {
        queue.append(left)
        depths.append(currentDepth + 1)
      }
      if let right = last.right {
        queue.append(right)
        depths.append(currentDepth + 1)
      }
    }
    assertionFailure()
    return -1
  }
}
