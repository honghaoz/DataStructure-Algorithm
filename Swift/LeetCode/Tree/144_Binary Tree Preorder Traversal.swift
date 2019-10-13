// 144_Binary Tree Preorder Traversal
// https://leetcode.com/problems/binary-tree-preorder-traversal/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, return the preorder traversal of its nodes' values.
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
//Output: [1,2,3]
//Follow up: Recursive solution is trivial, could you do it iteratively?
//

import Foundation

class Num144 {
  // Iterative
  func preorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }
    var stack: [TreeNode] = [root!]
    var result: [Int] = []
    while !stack.isEmpty {
      let last = stack.popLast()!
      result.append(last.val)
      if let right = last.right {
        stack.append(right)
      }
      if let left = last.left {
        stack.append(left)
      }
    }
    return result
  }

  // Recursive
  func preorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }
    let leftInorder = preorderTraversal_recursive(root?.left)
    let rightInorder = preorderTraversal_recursive(root?.right)
    return [root!.val] + leftInorder + rightInorder
  }
}
