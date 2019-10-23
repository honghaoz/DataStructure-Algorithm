// 94_Binary Tree Inorder Traversal
// https://leetcode.com/problems/binary-tree-inorder-traversal/
//
// Created by Honghao Zhang on 9/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, return the inorder traversal of its nodes' values.
//
//Example:
//
//Input: [1,null,2,3]
//   1
//    \
//     2
//    /
//   3
//
//Output: [1,3,2]
//Follow up: Recursive solution is trivial, could you do it iteratively?
//

// Related question: 1038_Binary Search Tree to Greater Sum Tree

import Foundation

class Num94 {
  // Recursive way is easier to understand, needs to write down the recruisve solution
  func inorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }
    let leftInorder = inorderTraversal_recursive(root?.left)
    let rightInorder = inorderTraversal_recursive(root?.right)
    return leftInorder + [root!.val] + rightInorder
  }

  // For iterative way, basically we need to use the stack to simulate the process of the operating system (call stack)
  // [记忆] 斜着逐行扫描
  func inorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
    if root == nil {
      return []
    }

    var stack: [TreeNode] = []
    var result: [Int] = []
    var current = root

    // compare the execution order with the recruisive one
    // since the first call is called with root, root is pushed into the stack
    stack.append(root!)

    // If the call stack is not empty, should continue
    while !stack.isEmpty {
      // needs to call left branch until there's no node to push
      // this is because in the recursive way, the left is always get called firstly
      while let left = current?.left {
        stack.append(left)
        current = left
      }
      // all left branch nodes are pushed
      // pop the last one and add it to the result
      let last = stack.popLast()
      result.append(last!.val) // this is the + [root!.val] in the recursive way above

      // needs to call right node with the same process above
      current = last?.right
      if let current = current {
        stack.append(current)
      }
    }
    return result
  }
}
