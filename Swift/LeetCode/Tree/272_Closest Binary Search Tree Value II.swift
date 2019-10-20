// 272_Closest Binary Search Tree Value II
// https://leetcode.com/problems/closest-binary-search-tree-value-ii/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty binary search tree and a target value, find k values in the BST that are closest to the target.
//
//Note:
//
//Given target value is a floating point.
//You may assume k is always valid, that is: k ≤ total nodes.
//You are guaranteed to have only one unique set of k values in the BST that are closest to the target.
//Example:
//
//Input: root = [4,2,5,1,3], target = 3.714286, and k = 2
//
//    4
//   / \
//  2   5
// / \
//1   3
//
//Output: [4,3]
//Follow up:
//Assume that the BST is balanced, could you solve it in less than O(n) runtime (where n = total nodes)?
//

import Foundation

class Num272 {
  // https://leetcode.com/problems/closest-binary-search-tree-value-ii/discuss/408124/O(logN-%2B-k)-and-Easiest-to-understand-beats-75
  // https://leetcode.com/problems/closest-binary-search-tree-value-ii/discuss/281703/From-O(n)-to-O(logn%2Bk)-in-extreme-details

  // MARK: - Use two stacks to store the smaller values (predecessor) and larger values (successor)
  // Basic idea is to build two stacks of values when searching for the target
  // The values along the path is the closest values to the target
  // The stack can keep the closer value to be popped first
  // Then using the two stacks to append the result values fro the closer values
  // If a node is popped from a stack, we need to update the stack to make sure the next closer value is added (keep
  // the stack definition)
  // O(logN+k), logN for searching, k for building the result
  func closestKValues_twoStack(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
    guard let root = root else {
      return []
    }

    var result: [Int] = []
    var smallerStack: [TreeNode] = [] // stores the values which are just smaller than the target
    var largerStack: [TreeNode] = [] // stores the values which are just larger than the target

    // 1) Construct smaller stack and larger stack along the searching path
    var p: TreeNode? = root
    while p != nil {
      if Double(p!.val) < target {
        // go right
        smallerStack.append(p!)
        p = p!.right
      }
      else {
        // go left
        largerStack.append(p!)
        p = p!.left
      }
    }

    // Both stack shouldn't be all empty, otherwise, this is an empty tree
    guard !(smallerStack.isEmpty && largerStack.isEmpty) else {
      return []
    }

    var k: Int = k
    while k > 0 {
      if largerStack.isEmpty {
        // use smaller
        let node = smallerStack.removeLast()
        result.append(node.val)
        updateNextSmaller(node, &smallerStack) // 2) When a value is popped, needs to make sure the
        // definition of the stacks is still correct.
      }
      else if smallerStack.isEmpty {
        // use larger
        let node = largerStack.removeLast()
        result.append(node.val)
        updateNextLarger(node, &largerStack)
      }
      else {
        if target - Double(smallerStack.last!.val) > Double(largerStack.last!.val) - target {
          // use larger
          let node = largerStack.removeLast()
          result.append(node.val)
          updateNextLarger(node, &largerStack)
        }
        else {
          // user smaller
          let node = smallerStack.removeLast()
          result.append(node.val)
          updateNextSmaller(node, &smallerStack)
        }
      }

      k -= 1
    }

    return result
  }

  // For the popped larger node, update larger stack to have the next larger nodes
  // For the example above, if the 4 node is popped, the 5 node should be appended
  private func updateNextLarger(_ poppedNode: TreeNode, _ largerStack: inout [TreeNode]) {
    var p: TreeNode? = poppedNode.right
    while p != nil {
      largerStack.append(p!)
      p = p!.left
    }
  }

  private func updateNextSmaller(_ poppedNode: TreeNode, _ smallerStack: inout [TreeNode]) {
    var p: TreeNode? = poppedNode.left
    while p != nil {
      smallerStack.append(p!)
      p = p!.right
    }
  }

  // MARK: - Inorder traversal
  // Use an array to store the result, since this is a BST, the value is in ascending order
  // So use an array to store the K numbers
  // For new elements, if it's closer, pop the first and append the new one
  // O(n)
  func closestKValues(_ root: TreeNode?, _ target: Double, _ k: Int) -> [Int] {
    guard let root = root else {
      return []
    }
    var result: [Int] = []
    inorderTraverse(root, target, k, &result)
    return result
  }

  // inorder traverse and collect the first k elements
  // then for new elements, if new element is closer, popFirst and appendLast
  // until the new element is farther
  private func inorderTraverse(_ root: TreeNode, _ target: Double, _ k: Int, _ result: inout [Int]) {
    guard k > 0 else {
      return
    }

    if let left = root.left {
      inorderTraverse(left, target, k, &result)
    }

    if result.count < k {
      result.append(root.val)
    }
    else {
      if abs(Double(root.val) - target) < abs(Double(result.first!) - target) {
        result.removeFirst()
        result.append(root.val)
      }
      else {
        return
      }
    }

    if let right = root.right {
      inorderTraverse(right, target, k, &result)
    }
  }
}
