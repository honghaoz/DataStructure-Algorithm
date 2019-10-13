// 101_Symmetric Tree
// https://leetcode.com/problems/symmetric-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
//
//For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
//
//    1
//   / \
//  2   2
// / \ / \
//3  4 4  3
//
//
//But the following [1,2,2,null,3,null,3] is not:
//
//    1
//   / \
//  2   2
//   \   \
//   3    3
//
//
//Note:
//Bonus points if you could solve it both recursively and iteratively.
//

import Foundation

class Num101 {
  /// Recursive way, to check if the root.left and root.right is mirror
  func isSymmetric_recursive(_ root: TreeNode?) -> Bool {
    return isMirror(root?.left, root?.right)
  }

  private func isMirror(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    if root1 == nil, root2 == nil {
      return true
    }
    if root1 == nil, root2 != nil {
      return false
    }
    if root1 != nil, root2 == nil {
      return false
    }
    return root1!.val == root2!.val &&
      isMirror(root1!.left, root2!.right) &&
      isMirror(root1!.right, root2!.left)
  }

  /// Iterative, BFS with queue
  func isSymmetric_iterative(_ root: TreeNode?) -> Bool {
    if root == nil {
      return true
    }
    var queue: [TreeNode] = [root!, root!]
    while !queue.isEmpty {
      let node1 = queue.removeFirst()
      let node2 = queue.removeFirst()
      // node1 and node2 should be same
      guard node1.val == node2.val else {
        return false
      }
      // and node1.left should be equal to node2.right
      if let node1Left = node1.left, let node2Right = node2.right {
        queue.append(node1Left)
        queue.append(node2Right)
      }
      else if let _ = node1.left {
        return false
      }
      else if let _ = node2.right {
        return false
      }
      // and node1.right should be equal to node2.left
      if let node1Right = node1.right, let node2Left = node2.left {
        queue.append(node1Right)
        queue.append(node2Left)
      }
      else if let _ = node1.right {
        return false
      }
      else if let _ = node2.left {
        return false
      }
    }
    return queue.isEmpty
  }

}
