// 110_Balanced Binary Tree
// https://leetcode.com/problems/balanced-binary-tree/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, determine if it is height-balanced.
//
//For this problem, a height-balanced binary tree is defined as:
//
//a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
//
//Example 1:
//
//Given the following tree [3,9,20,null,null,15,7]:
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//Return true.
//
//Example 2:
//
//Given the following tree [1,2,2,3,3,null,null,4,4]:
//
//       1
//      / \
//     2   2
//    / \
//   3   3
//  / \
// 4   4
//Return false.
//

import Foundation

class Num110 {
  /// Check with max depth but also return if the branch is balanced.
  func isBalanced(_ root: TreeNode?) -> Bool {
    return isBalancedHelper(root).0
  }

  /// returns if the tree is balanced and it's depth
  private func isBalancedHelper(_ root: TreeNode?) -> (Bool, Int) {
    if root == nil {
      return (true, 0)
    }
    let (leftIsBalanced, leftDepth) = isBalancedHelper(root?.left)
    let (rightIsBalanced, rightDepth) = isBalancedHelper(root?.right)
    let isBalanced = leftIsBalanced && rightIsBalanced && abs(leftDepth - rightDepth) <= 1
    return (isBalanced, max(leftDepth, rightDepth) + 1)
  }
}
