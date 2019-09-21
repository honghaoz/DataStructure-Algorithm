// 236_Lowest Common Ancestor of a Binary Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
//
//According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
//
//Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]
//
//
//
//
//Example 1:
//
//Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
//Output: 3
//Explanation: The LCA of nodes 5 and 1 is 3.
//Example 2:
//
//Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
//Output: 5
//Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
//
//
//Note:
//
//All of the nodes' values will be unique.
//p and q are different and both values will exist in the binary tree.
//

import Foundation

class Num236 {
  //
//  # Definition for a binary tree node.
//  # class TreeNode(object):
//  #     def __init__(self, x):
//  #         self.val = x
//  #         self.left = None
//  #         self.right = None
//
//  class Solution(object):
//  # Iterative with building parent pointers
//  def lowestCommonAncestor_iterative(self, root, p, q):
//      """
//      :type root: TreeNode
//      :type p: TreeNode
//      :type q: TreeNode
//      :rtype: TreeNode
//      """
//      # a stack for DFS
//      stack = [root]
//      # stores the parent node of a node
//      parent = {root: None}
//
//      while p not in parent or q not in parent:
//        node = stack.pop()
//        if node.left:
//          parent[node.left] = node
//          stack.append(node.left)
//        if node.right:
//          parent[node.right] = node
//          stack.append(node.right)
//
//      # now, we have the p and q's parents
//
//      # the ancestors of p
//      ancestors = set()
//      current = p
//      while current:
//        ancestors.add(current)
//        current = parent[current]
//
//      current = q
//      while current:
//        if current in ancestors:
//          return current
//        current = parent[current]
//
//      return None
//
//  def lowestCommonAncestor_recursive(self, root, p, q):
//      """
//      :type root: TreeNode
//      :type p: TreeNode
//      :type q: TreeNode
//      :rtype: TreeNode
//      """
//      if root is None:
//          return None
//      if root == p:
//          return p
//      if root == q:
//          return q
//
//      l = self.lowestCommonAncestor(root.left, p, q)
//      r = self.lowestCommonAncestor(root.right, p, q)
//      if l != None and r != None:
//          return root
//      if l is None and r != None:
//          return r
//      if r is None and l != None:
//          return l
//      return None
}
