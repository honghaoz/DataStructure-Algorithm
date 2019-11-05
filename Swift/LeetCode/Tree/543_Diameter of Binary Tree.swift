// 543_Diameter of Binary Tree
// https://leetcode.com/problems/diameter-of-binary-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.
//
//Example:
//Given a binary tree
//
//          1
//         / \
//        2   3
//       / \
//      4   5
//Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].
//
//Note: The length of path between two nodes is represented by the number of edges between them.
//

// 计算一个tree的周长，就是这个tree中最长的路径

import Foundation

class Num543 {
  // Compute the max depth of left and right, the diameter is the left max + right max
  // Then check the max among root, left and right
  func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    // diameter of root is left depth + 1 + right depth + 1
    if root == nil {
      return 0
    }
    
    let leftMaxDepth: Int
    if let left = root!.left {
      leftMaxDepth = maxDepth(left) + 1
    }
    else {
      leftMaxDepth = 0
    }
    
    let rightMaxDepth: Int
    if let right = root!.right {
      rightMaxDepth = maxDepth(right) + 1
    }
    else {
      rightMaxDepth = 0
    }
    
    let d = leftMaxDepth + rightMaxDepth
    let dLeft = diameterOfBinaryTree(root!.left)
    let dRight = diameterOfBinaryTree(root!.right)
    return max(d, dLeft, dRight)
  }
  
  private func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil {
      return 0
    }
    if root!.left == nil, root!.right == nil {
      return 0
    }
    return max(maxDepth(root!.left), maxDepth(root!.right)) + 1
  }
}
