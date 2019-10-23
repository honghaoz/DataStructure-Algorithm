// 1038_Binary Search Tree to Greater Sum Tree
// https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
//
// Created by Honghao Zhang on 10/20/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given the root of a binary search tree with distinct values, modify it so that every node has a new value equal to the sum of the values of the original tree that are greater than or equal to node.val.
//
//As a reminder, a binary search tree is a tree that satisfies these constraints:
//
//The left subtree of a node contains only nodes with keys less than the node's key.
//The right subtree of a node contains only nodes with keys greater than the node's key.
//Both the left and right subtrees must also be binary search trees.
//
//
//Example 1:
//
//
//
//Input: [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
//Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
//
//
//Note:
//
//The number of nodes in the tree is between 1 and 100.
//Each node will have value between 0 and 100.
//The given tree is a binary search tree.
//

// 把一个BST更改为一个GST，GST是指每个node的值是比这个node >= 的node值的和。

import Foundation

class Num1038 {
  // https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/discuss/286906/Java-3-iterative-and-recursive-codes-w-comments-and-explanation.
  // MARK: - Recursive
  // 用一个recursion来更新tree，为了方便更新root node的值，这个recursive func
  // 同时返回left most node's value
  func bstToGst(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
      return nil
    }
    _ = bstToGstHelper(root, 0)
    return root
  }

  /// update the tree to be a gst tree, the sum is the
  /// beginning sum (the val of the parent on the right side in the gst)
  /// For example:
  ///      6
  ///    /   \
  ///  (5)    7
  /// For node 5, the base val is 13
  ///
  /// returns the max node of this tree (the left most node)
  func bstToGstHelper(_ root: TreeNode, _ sum: Int) -> Int {
    // single node, just update the value and return it
    if root.left == nil, root.right == nil {
      root.val += sum
      return root.val
    }

    // for the right node,
    if let right = root.right {
      root.val += bstToGstHelper(right, sum) // 重点！这个func本身还顺便返回了最大node的值
    }
    else {
      // if there's no right node, needs to update the root
      root.val += sum
    }

    // if there's left node, sum needs to be root.val
    if let left = root.left {
      return bstToGstHelper(left, root.val)
    }
    return root.val
  }

  // MARK: - Iterative
  // Reversed inorder traversal
  func bstToGst_iterative(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else {
      return nil
    }

    var stack: [TreeNode] = [root]
    var sum = 0
    var current: TreeNode? = root
    while !stack.isEmpty {
      // push all right branch nodes
      while let right = current?.right {
        stack.append(right)
        current = right
      }

      // at this moment, all right nodes are pushed
      let node = stack.removeLast()
      sum += node.val // update the sum to have the new node value
      node.val = sum // since this is the right most node, could update to the sum

      current = node.left
      if let current = current {
        stack.append(current)
      }
    }

    return root
  }
}
