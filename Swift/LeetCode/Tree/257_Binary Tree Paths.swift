// 257_Binary Tree Paths
// https://leetcode.com/problems/binary-tree-paths/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, return all root-to-leaf paths.
//
//Note: A leaf is a node with no children.
//
//Example:
//
//Input:
//
//   1
// /   \
//2     3
// \
//  5
//
//Output: ["1->2->5", "1->3"]
//
//Explanation: All root-to-leaf paths are: 1->2->5, 1->3
//

import Foundation

class Num257 {
  // MARK: - Recursive
  func binaryTreePaths(_ root: TreeNode?) -> [String] {
    guard let root = root else {
      return []
    }
    return binaryTreePathsHelper(root)
  }

  private func binaryTreePathsHelper(_ root: TreeNode) -> [String] {
    if root.left == nil, root.right == nil {
      return [String(root.val)]
    }
    var paths: [String] = []
    if let left = root.left {
      let leftPaths = binaryTreePathsHelper(left)
      paths += leftPaths.map {
        "\(root.val)->\($0)"
      }
    }
    if let right = root.right {
      let rightPaths = binaryTreePathsHelper(right)
      paths += rightPaths.map {
        "\(root.val)->\($0)"
      }
    }
    return paths
  }

  // MARK: - Iterative
  func binaryTreePaths_iterative(_ root: TreeNode?) -> [String] {
    guard let root = root else {
      return []
    }

    //
    //   1
    // /   \
    //2     3
    // \
    //  5
    //
    // [(Node(1), "")]
    // [(Node(2), "1->2"), (Node(3), "1->3")]
    var nodeStack: [(TreeNode, String)] = [(root, "\(root.val)")]
    var paths: [String] = []

    while !nodeStack.isEmpty {
      let (node, path) = nodeStack.removeLast()
      // is a leaf
      if node.left == nil, node.right == nil {
        paths.append(path)
      }
      else {
        if let left = node.left {
          nodeStack.append((left, path + "->\(left.val)"))
        }
        if let right = node.right {
          nodeStack.append((right, path + "->\(right.val)"))
        }
      }
    }

    return paths
  }
}
