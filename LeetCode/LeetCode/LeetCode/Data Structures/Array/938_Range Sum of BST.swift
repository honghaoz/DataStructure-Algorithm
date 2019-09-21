// 938_Range Sum of BST
// https://leetcode.com/problems/range-sum-of-bst/
//
// Created by Honghao Zhang on 9/19/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
//
//The binary search tree is guaranteed to have unique values.
//
//
//
//Example 1:
//
//Input: root = [10,5,15,3,7,null,18], L = 7, R = 15
//Output: 32
//Example 2:
//
//Input: root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
//Output: 23
//
//
//Note:
//
//The number of nodes in the tree is at most 10000.
//The final answer is guaranteed to be less than 2^31.
//

import Foundation

class Num938 {
  // Recursive DFS
  func rangeSumBST_recursive(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    if root == nil {
      return 0
    }
    var sum = 0
    if root!.val >= L, root!.val <= R {
      sum += root!.val
    }

    if root!.val >= L {
      sum += rangeSumBST_recursive(root!.left, L, R)
    }
    if root!.val <= R {
      sum += rangeSumBST_recursive(root!.right, L, R)
    }
    return sum
  }

  // Iterative
  func rangeSumBST_iterative(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    if root == nil {
      return 0
    }
    var sum = 0

    var stack: [TreeNode] = [root!]

    while !stack.isEmpty {
      let last = stack.popLast()!
      if last.val >= L, last.val <= R {
        sum += last.val
      }
      // If left vals has some overlap
      if let left = last.left, last.val > L {
        stack.append(left)
      }
      if let right = last.right, last.val < R {
        stack.append(right)
      }
    }

    return sum
  }
}
