// 965_Univalued Binary Tree
// https://leetcode.com/problems/univalued-binary-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
//
//
// A binary tree is univalued if every node in the tree has the same value.
//
//Return true if and only if the given tree is univalued.
//
//
//
//Example 1:
//
//
//Input: [1,1,1,1,1,null,1]
//Output: true
//Example 2:
//
//
//Input: [2,2,2,5,2]
//Output: false
//
//
//Note:
//
//The number of nodes in the given tree will be in the range [1, 100].
//Each node's value will be an integer in the range [0, 99].
//

// 判断一个tree是否所有的点都是同样的值

import Foundation

class Num965 {
  // Iterative way with stack, DFS
  func isUnivalTree(_ root: TreeNode?) -> Bool {
      guard root != nil else {
        return false
      }
    var stack: [TreeNode] = [root!]
    let theValue = root!.val
    while !stack.isEmpty {
      let node = stack.popLast()!
      if let left = node.left {
        if left.val != theValue {
          return false
        }
        else {
          stack.append(left)
        }
      }
      if let right = node.right {
        if right.val != theValue {
          return false
        }
        else {
          stack.append(right)
        }
      }
    }
    return true
  }
}
