// 112_Path Sum
// https://leetcode.com/problems/path-sum/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Given the below binary tree and sum = 22,
//
//      5
//     / \
//    4   8
//   /   / \
//  11  13  4
// /  \      \
//7    2      1
//return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
//

import Foundation

class Num112 {

  func hasPathSum_recursive(_ root: TreeNode?, _ sum: Int) -> Bool {
    if root == nil {
      return false
    }

    if let left = root?.left, let right = root?.right {
      return hasPathSum_recursive(left, sum - root!.val) || hasPathSum_recursive(right, sum - root!.val)
    }
    else if let left = root?.left {
      return hasPathSum_recursive(left, sum - root!.val)
    }
    else if let right = root?.right {
      return hasPathSum_recursive(right, sum - root!.val)
    }
    else {
      // root is the leaf
      return root!.val == sum
    }
  }

  func hasPathSum_iterative(_ root: TreeNode?, _ sum: Int) -> Bool {
      if root == nil {
        return false
      }

    var stack: [TreeNode] = [root!]
    var sum: [Int] = [sum - root!.val] // the sum to find
    while !stack.isEmpty {
      let last = stack.popLast()!
      let lastSum = sum.popLast()!
      if last.left == nil, last.right == nil, lastSum == 0 {
        return true
      }
      if let left = last.left {
        sum.append(lastSum - left.val)
        stack.append(left)
      }
      if let right = last.right {
        sum.append(lastSum - right.val)
        stack.append(right)
      }
    }
    return false
  }
}
