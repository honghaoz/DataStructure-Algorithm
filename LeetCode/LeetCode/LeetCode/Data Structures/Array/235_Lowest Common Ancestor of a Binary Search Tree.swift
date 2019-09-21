// 235_Lowest Common Ancestor of a Binary Search Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
//
//According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
//
//Given binary search tree:  root = [6,2,8,0,4,7,9,null,null,3,5]
//
//
//
//
//Example 1:
//
//Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
//Output: 6
//Explanation: The LCA of nodes 2 and 8 is 6.
//Example 2:
//
//Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
//Output: 2
//Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself according to the LCA definition.
//
//
//Note:
//
//All of the nodes' values will be unique.
//p and q are different and both values will exist in the BST.
//

import Foundation

class Num235 {
  // 因为是BST，所以可以更具val的大下来判断LCA是在左边还是右边，还是已经到了
//  # Definition for a binary tree node.
//  # class TreeNode(object):
//  #     def __init__(self, x):
//  #         self.val = x
//  #         self.left = None
//  #         self.right = None
//
//  class Solution(object):
//      def lowestCommonAncestor_recursive(self, root, p, q):
//          """
//          :type root: TreeNode
//          :type p: TreeNode
//          :type q: TreeNode
//          :rtype: TreeNode
//          """
//          if root is None:
//              return None
//          if (p.val < root.val and q.val < root.val):
//              return self.lowestCommonAncestor(root.left, p, q)
//          if (p.val > root.val and q.val > root.val):
//              return self.lowestCommonAncestor(root.right, p, q)
//          return root
//
//      def lowestCommonAncestor_iterative(self, root, p, q):
//          """
//          :type root: TreeNode
//          :type p: TreeNode
//          :type q: TreeNode
//          :rtype: TreeNode
//          """
//          if root is None:
//              return None
//          current = root
//          while (p.val < current.val and q.val < current.val) or (p.val > current.val and q.val > current.val):
//              if (p.val < current.val and q.val < current.val):
//                  current = current.left
//              if (p.val > current.val and q.val > current.val):
//                  current = current.right
//
//          return current
}
