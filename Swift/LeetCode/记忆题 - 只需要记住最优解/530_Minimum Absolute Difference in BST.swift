// 530_Minimum Absolute Difference in BST
// https://leetcode.com/problems/minimum-absolute-difference-in-bst/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary search tree with non-negative values, find the minimum absolute difference between values of any two nodes.
//
//Example:
//
//Input:
//
//   1
//    \
//     3
//    /
//   2
//
//Output:
//1
//
//Explanation:
//The minimum absolute difference is 1, which is the difference between 2 and 1 (or between 2 and 3).
//
//
//Note: There are at least two nodes in this BST.
//

// 在一个BST中找到最近的两个值的差值

import Foundation

class Num530 {
  // MARK: Inorder but one pass
  // Keep tracking a previous node reference, when doing the inorder traversal, keep
  // tracking the min difference.

  // MARK: Inorder traversal and find the min diff between two
  func getMinimumDifference(_ root: TreeNode?) -> Int {
    guard let root = root else {
      assertionFailure()
      return 0
    }

    let inorderValues = inorder(root)
    guard inorderValues.count > 1 else {
      return 0
    }

    var minDiff = Int.max
    for i in 1..<inorderValues.count {
      minDiff = min(minDiff, inorderValues[i] - inorderValues[i - 1])
    }
    return minDiff
  }

  // Find the node in the tree whose val is the closest to the target
  private func inorder(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }
    return inorder(root.left) + [root.val] + inorder(root.right)
  }
}
