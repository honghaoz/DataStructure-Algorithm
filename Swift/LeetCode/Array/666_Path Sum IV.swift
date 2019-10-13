// 666_Path Sum IV
// https://leetcode.com/problems/path-sum-iv/
//
// Created by Honghao Zhang on 9/19/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// If the depth of a tree is smaller than 5, then this tree can be represented by a list of three-digits integers.
//
//For each integer in this list:
//
//The hundreds digit represents the depth D of this node, 1 <= D <= 4.
//The tens digit represents the position P of this node in the level it belongs to, 1 <= P <= 8. The position is the same as that in a full binary tree.
//The units digit represents the value V of this node, 0 <= V <= 9.
//
//
//Given a list of ascending three-digits integers representing a binary tree with the depth smaller than 5, you need to return the sum of all paths from the root towards the leaves.
//
//Example 1:
//
//Input: [113, 215, 221]
//Output: 12
//Explanation:
//The tree that the list represents is:
//    3
//   / \
//  5   1
//
//The path sum is (3 + 5) + (3 + 1) = 12.
//
//
//Example 2:
//
//Input: [113, 221]
//Output: 4
//Explanation:
//The tree that the list represents is:
//    3
//     \
//      1
//
//The path sum is (3 + 1) = 4.
//

import Foundation

class Num666 {
  class TreeNode {
    var val: Int
    var p: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int, _ p: Int) {
      self.val = val
      self.p = p
      self.left = nil
      self.right = nil
    }
  }

  func pathSum(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }

    let root = buildTree(nums)
    return pathSum(root, 0)
  }

  /// Tail recursive?
  /// `parentPathSum` is the path sum of root.parent
  /// returns the path sum.
  private func pathSum(_ root: TreeNode, _ parentPathSum: Int) -> Int {
    if root.left == nil, root.right == nil {
      return root.val + parentPathSum
    }

    var sum = 0
    if let left = root.left {
      let leftSum = pathSum(left, parentPathSum + root.val)
      sum += leftSum
    }
    if let right = root.right {
      let rightSum = pathSum(right, parentPathSum + root.val)
      sum += rightSum
    }

    return sum
  }

  private func buildTree(_ nums: [Int]) -> TreeNode {
    precondition(nums.count > 0)

    let root: TreeNode = TreeNode(nums[0].val, 1) // the root node of the tree

    // loop invairant
    var queue: [TreeNode] = [root] // a queue stores nodes built
    var level: Int = 1 // the current level appended in the queu
    var i: Int = 1 // the index of nums
    while i < nums.count {
      // get nodes in the last level
      var nodes = [TreeNode]()
      let lastLevelSize = queue.count
      for _ in 0..<lastLevelSize {
        nodes.append(queue.removeFirst())
      }

      // get nums in the current level (level + 1)
      var nextNums = [Int]()
      while i < nums.count {
        let nextNum = nums[i]
        // if nextNum level is not in current level (level + 1)
        if nextNum.level > level + 1 {
          break
        }
        nextNums.append(nextNum)
        i += 1
      }

      // for nums in the current level, build nodes and connect them with the node in the previous level
      for n in nextNums {
        let node = TreeNode(n.val, n.p)
        // find the parent of this node
        let parentNodePosition = (n.p - 1) / 2 + 1
        let parentIndex = nodes.firstIndex {
          $0.p == parentNodePosition
        }!
        let parentNode = nodes[parentIndex]

        // connect this node with its parent node
        let isLeft = node.p % 2 == 1
        if isLeft {
          parentNode.left = node
        } else {
          parentNode.right = node
        }

        // loop invariant
        queue.append(node)
      }

      // loop invariant
      level += 1
    }

    return root
  }
}

extension Int {
  var level: Int {
    return self / 100
  }
  var p: Int {
    return (self / 10) % 10
  }
  var val: Int {
    return self % 10
  }
}
