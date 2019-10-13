// 872_Leaf-Similar Trees
// https://leetcode.com/problems/leaf-similar-trees/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
//
// 叶子节点的值从左到右形成的array是一样的
//
// Consider all the leaves of a binary tree.  From left to right order, the values of those leaves form a leaf value sequence.
//
//
//
//For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).
//
//Two binary trees are considered leaf-similar if their leaf value sequence is the same.
//
//Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
//
//
//
//Note:
//
//Both of the given trees will have between 1 and 100 nodes.
//

import Foundation

class Num872 {
  func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    return leafValues_recursive(root1) == leafValues_recursive(root2)
  }

  /// DFS recursive
  private func leafValues_recursive(_ root: TreeNode?) -> [Int] {
    guard root != nil else {
      return []
    }
    if root!.left == nil, root!.right == nil {
      return [root!.val]
    }
    let leftValues = leafValues_recursive(root!.left)
    let rightValues = leafValues_recursive(root!.right)
    return leftValues + rightValues
  }

  /// DFS iterative with stack
  private func leafValues_iterative(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }

    var values: [Int] = []
    var stack: [TreeNode] = [root!]
    while !stack.isEmpty {
      let node = stack.popLast()!
      if node.left == nil, node.right == nil {
        values.append(node.val)
      }
      else {
        if let left = node.left {
          stack.append(left)
        }
        if let right = node.right {
          stack.append(right)
        }
      }
    }
    return values
  }
}
