// 270_Closest Binary Search Tree Value
// https://leetcode.com/problems/closest-binary-search-tree-value/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty binary search tree and a target value, find the value in the BST that is closest to the target.
//
//Note:
//
//Given target value is a floating point.
//You are guaranteed to have only one unique value in the BST that is closest to the target.
//Example:
//
//Input: root = [4,2,5,1,3], target = 3.714286
//
//    4
//   / \
//  2   5
// / \
//1   3
//
//Output: 4
//

import Foundation

// 在一个BST中寻找里target值最近的node的值

class Num270 {
  /// TODO: BST solutions
  // https://leetcode.com/problems/closest-binary-search-tree-value/solution/

  /// Binary search
  func closestValue_binarySearch(_ root: TreeNode?, _ target: Double) -> Int {
    guard root != nil else {
      return -1
    }

    var closest: Int?
    var p = root
    while p != nil {
      // 1) update result
      if closest == nil {
        closest = p!.val
      } else {
        // find a new closer value
        if abs(Double(p!.val) - target) < abs(Double(closest!) - target) {
          closest = p!.val
        }
      }

      // 2) traverse
      if Double(p!.val) < target {
        // go right
        p = p!.right
      }
      else if Double(p!.val) > target {
        // go left
        p = p!.left
      }
      else {
        // 0, is the most closest value
        return p!.val
      }
    }
    return closest!
  }
}
