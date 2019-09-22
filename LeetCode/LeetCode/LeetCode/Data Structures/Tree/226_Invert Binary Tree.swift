// 226_Invert Binary Tree
// https://leetcode.com/problems/invert-binary-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Invert a binary tree.
//
//Example:
//
//Input:
//
//     4
//   /   \
//  2     7
// / \   / \
//1   3 6   9
//Output:
//
//     4
//   /   \
//  7     2
// / \   / \
//9   6 3   1
//Trivia:
//This problem was inspired by this original tweet by Max Howell:
//
//Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
//

import Foundation

class Num226 {
  /// Recursive
  func invertTree_recursive(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
      return nil
    }
    let leftInverted = invertTree_recursive(root!.left)
    let rightInverted = invertTree_recursive(root!.right)
    root!.left = rightInverted
    root!.right = leftInverted
    return root
  }

  /// BFS with queue
  func invertTree_iterative(_ root: TreeNode?) -> TreeNode? {
    if root == nil {
      return nil
    }
    var queue: [TreeNode] = [root!]
    while !queue.isEmpty {
      let node = queue.removeFirst()
      // swap the node's children
      (node.left, node.right) = (node.right, node.left)
      if let left = node.left {
        queue.append(left)
      }
      if let right = node.right {
        queue.append(right)
      }
    }
    return root
  }
}
