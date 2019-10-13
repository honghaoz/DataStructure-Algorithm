// 113_Path Sum II
// https://leetcode.com/problems/path-sum-ii/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
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
// /  \    / \
//7    2  5   1
//Return:
//
//[
//   [5,4,11,2],
//   [5,8,4,5]
//]
//

import Foundation

class Num113 {
  // TODO: how to make it iterative?
//  func pathSum_iterative(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
//    if root == nil {
//      return []
//    }
//
//    var stack: [(TreeNode, Int)] = [(root!, sum)]
//    var results: [[Int]] = []
//    while !stack.isEmpty {
//      let (lastNode, lastSum) = stack.popLast()!
//      if lastNode.left == nil, lastNode.right == nil {
//        if lastNode.val == lastSum {
//          results.append([lastNode.val])
//        }
//      }
//      if let left = lastNode.left {
//        stack.append((left, lastSum - lastNode.val))
//      }
//      if let right = lastNode.right {
//        stack.append((right, lastSum - rightNode.val))
//      }
//    }
//  }

  func pathSum_recursive(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    guard let root = root else {
      return []
    }

    return pathSumHelper(root, sum)
  }

  /// A helper that only returns reuslts for a non-nil node.
  private func pathSumHelper(_ root: TreeNode, _ sum: Int) -> [[Int]] {
    if root.left == nil, root.right == nil {
      if sum == root.val {
        return [[root.val]]
      }
      else {
        return []
      }
    }

    var result: [[Int]] = []
    if let left = root.left {
      let leftPaths = pathSumHelper(left, sum - root.val)
      if leftPaths.count > 0 {
        result += leftPaths.map { [root.val] + $0 }
      }
    }
    if let right = root.right {
      let rightPaths = pathSumHelper(right, sum - root.val)
      if rightPaths.count > 0 {
        result += rightPaths.map { [root.val] + $0 }
      }
    }
    return result
  }
}
