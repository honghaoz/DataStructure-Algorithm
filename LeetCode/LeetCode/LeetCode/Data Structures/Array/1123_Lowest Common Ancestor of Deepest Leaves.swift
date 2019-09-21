// 1123_Lowest Common Ancestor of Deepest Leaves
// https://leetcode.com/problems/lowest-common-ancestor-of-deepest-leaves/
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a rooted binary tree, return the lowest common ancestor of its deepest leaves.
//
//Recall that:
//
//The node of a binary tree is a leaf if and only if it has no children
//The depth of the root of the tree is 0, and if the depth of a node is d, the depth of each of its children is d+1.
//The lowest common ancestor of a set S of nodes is the node A with the largest depth such that every node in S is in the subtree with root A.
//
//
//Example 1:
//
//Input: root = [1,2,3]
//Output: [1,2,3]
//Explanation:
//The deepest leaves are the nodes with values 2 and 3.
//The lowest common ancestor of these leaves is the node with value 1.
//The answer returned is a TreeNode object (not an array) with serialization "[1,2,3]".
//Example 2:
//
//Input: root = [1,2,3,4]
//Output: [4]
//Example 3:
//
//Input: root = [1,2,3,4,5]
//Output: [2,4,5]
//
//
//Constraints:
//
//The given tree will have between 1 and 1000 nodes.
//Each node of the tree will have a distinct value between 1 and 1000.
//

import Foundation

extension TreeNode: Equatable {
  public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
    return lhs.val == rhs.val
  }
}

extension TreeNode: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.val)
  }
}

class Num1123 {
  func lcaDeepestLeaves(_ root: TreeNode?) -> TreeNode? {
    let leaves = Array(deepestLeaves(root).0)
    // There's only one leaf, just return it
    if leaves.count == 1 {
      return leaves[0]
    }
    // for >2 leaves, find the lca
    return lca(root, leaves)
  }
  
  /// Find LCA in the tree with root node for nodes.
  private func lca(_ root: TreeNode?, _ nodes: [TreeNode]) -> TreeNode? {
    if root == nil {
      return nil
    }
    
    if nodes.contains(root!) {
      return root!
    }
    let left = lca(root?.left, nodes)
    let right = lca(root?.right, nodes)
    if let _ = left, let _ = right {
      return root
    }
    else if let left = left {
      return left
    }
    else if let right = right {
      return right
    }
    else {
      // Mind this step
      // If both branch returns nil, this means nodes are not children of root node
      // should return nil
      return nil
    }
  }
  
  /// Find the deepest leaves with their depth
  private func deepestLeaves(_ root: TreeNode?) -> (Set<TreeNode>, Int) {
    if root == nil {
      return (Set(), 0)
    }
    
    let leftDeepest = deepestLeaves(root?.left)
    let rightDeepest = deepestLeaves(root?.right)
    if leftDeepest.0.count > 0, rightDeepest.0.count > 0 {
      let leftDepth = leftDeepest.1
      let rightDepth = rightDeepest.1
      if leftDepth > rightDepth {
        return (leftDeepest.0, leftDepth + 1)
      }
      else if leftDepth < rightDepth {
        return (rightDeepest.0, rightDepth + 1)
      }
      else {
        var merged = Set<TreeNode>()
        for n in leftDeepest.0 {
          merged.insert(n)
        }
        for n in rightDeepest.0 {
          merged.insert(n)
        }
        return (merged, leftDepth + 1)
      }
    }
    else if leftDeepest.0.count > 0, rightDeepest.0.count == 0 {
      return (leftDeepest.0, leftDeepest.1 + 1)
    }
    else if leftDeepest.0.count == 0, rightDeepest.0.count > 0 {
      return (rightDeepest.0, rightDeepest.1 + 1)
    }
    else {
      // there's only one node
      return (Set<TreeNode>([root!]), 1)
    }
  }
}
