// 617_Merge Two Binary Trees
// https://leetcode.com/problems/merge-two-binary-trees/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two binary trees and imagine that when you put one of them to cover the other, some nodes of the two trees are overlapped while the others are not.
//
//You need to merge them into a new binary tree. The merge rule is that if two nodes overlap, then sum node values up as the new value of the merged node. Otherwise, the NOT null node will be used as the node of new tree.
//
//Example 1:
//
//Input:
//  Tree 1                     Tree 2
//          1                         2
//         / \                       / \
//        3   2                     1   3
//       /                           \   \
//      5                             4   7
//Output:
//Merged tree:
//       3
//      / \
//     4   5
//    / \   \
//   5   4   7
//
//
//Note: The merging process must start from the root nodes of both trees.
//

// 重叠两个tree，有overlap的节点value求和

import Foundation

class Num617 {
  // DFS in recursive way
  func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    if let t1 = t1, let t2 = t2 {
      let leftMerged = mergeTrees(t1.left, t2.left)
      let rightMerged = mergeTrees(t1.right, t2.right)
      let root = TreeNode(t1.val + t2.val)
      root.left = leftMerged
      root.right = rightMerged
      return root
    }
    else if let t1 = t1 {
      return t1
    }
    else if let t2 = t2 {
      return t2
    }
    else {
      return nil
    }
  }
}
