// 572_Subtree of Another Tree
// https://leetcode.com/problems/subtree-of-another-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.
//
//Example 1:
//Given tree s:
//
//     3
//    / \
//   4   5
//  / \
// 1   2
//Given tree t:
//   4
//  / \
// 1   2
//Return true, because t has the same structure and node values with a subtree of s.
//Example 2:
//Given tree s:
//
//     3
//    / \
//   4   5
//  / \
// 1   2
//    /
//   0
//Given tree t:
//   4
//  / \
// 1   2
//Return false.
//

import Foundation

class Num572 {
  // Check t again s's every node to see if any node in t is equal to s
  func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    guard s != nil else {
      return false
    }

    return isEqual(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
  }

  // p and q is same root and p contains q
  func isEqual(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
      return true
    }
    else if p == nil, q != nil {
      return false
    }
    else if p != nil, q == nil {
      return false
    }
    else {
      return p!.val == q!.val && isEqual(p!.left, q!.left) && isEqual(p!.right, q!.right)
    }
  }
}
