// 145_ Binary Tree Postorder Traversal
// https://leetcode.com/problems/binary-tree-postorder-traversal/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, return the postorder traversal of its nodes' values.
//
//Example:
//
//Input: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//Output: [3,2,1]
//Follow up: Recursive solution is trivial, could you do it iteratively?
//

import Foundation

class Num145 {
  /// Recursive
  func postorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }
    let leftInorder = postorderTraversal_recursive(root?.left)
    let rightInorder = postorderTraversal_recursive(root?.right)
    return leftInorder + rightInorder + [root!.val]
  }

  /// Iterative
  func postorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }

    var stack: [TreeNode] = []
    // Keep traversed result nodes, not just values.
    var result: [TreeNode] = []

    var current = root
    stack.append(current!)
    while !stack.isEmpty {
      // since the left branch is called firstly in the recursive way, push them all
      // Ignore the left node, if the node is already traversed.
      while let left = current?.left, !result.contains { $0 === left } {
        stack.append(left)
        current = left
      }
      // needs to push the right branch
      // if there's a right node and the right node is not the last one just added into the result
      // why check the right node with the last result node, this is because if the last node in the
      // result is just pushed, the right node is just traversed, no need to traverse again.
      if let right = current?.right, right !== result.last {
        stack.append(right)
        current = right
      } else {
        // both left and right (either is nil or just traversed) are traversed, now it's good to add
        // the root to the result
        let last = stack.popLast()
        result.append(last!)
        // then move the current pointer to the last node
        current = stack.last
      }
    }
    return result.map { $0.val }
  }
}
