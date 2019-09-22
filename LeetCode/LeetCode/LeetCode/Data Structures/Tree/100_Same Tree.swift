// 100_Same Tree
// https://leetcode.com/problems/same-tree/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two binary trees, write a function to check if they are the same or not.
//
//Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
//
//Example 1:
//
//Input:     1         1
//          / \       / \
//         2   3     2   3
//
//        [1,2,3],   [1,2,3]
//
//Output: true
//Example 2:
//
//Input:     1         1
//          /           \
//         2             2
//
//        [1,2],     [1,null,2]
//
//Output: false
//Example 3:
//
//Input:     1         1
//          / \       / \
//         2   1     1   2
//
//        [1,2,1],   [1,1,2]
//
//Output: false
//

import Foundation

class Num100 {
  func isSameTree_recursive(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
      return true
    }
    if p == nil, q != nil {
      return false
    }
    if p != nil, q == nil {
      return false
    }
    return p!.val == q!.val &&
      isSameTree_recursive(p!.left, q!.left) &&
      isSameTree_recursive(p!.right, q!.right)
  }
  
  func isSameTree_iterative(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil {
      return true
    }
    if p == nil, q != nil {
      return false
    }
    if p != nil, q == nil {
      return false
    }
    
    var stack1: [TreeNode] = [p!]
    var stack2: [TreeNode] = [q!]
    while !stack1.isEmpty, !stack2.isEmpty {
      let node1 = stack1.popLast()!
      let node2 = stack2.popLast()!
      guard node1.val == node2.val,
        node1.left?.val == node2.left?.val,
        node1.right?.val == node2.right?.val else {
          return false
      }
      if let node1Left = node1.left {
        stack1.append(node1Left)
      }
      if let node1Right = node1.right {
        stack1.append(node1Right)
      }
      if let node2Left = node2.left {
        stack2.append(node2Left)
      }
      if let node2Right = node2.right {
        stack2.append(node2Right)
      }
    }
    return stack1.count == stack2.count
  }
}
