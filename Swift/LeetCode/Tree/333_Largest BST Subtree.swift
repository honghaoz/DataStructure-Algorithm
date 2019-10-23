// 333_Largest BST Subtree
// https://leetcode.com/problems/largest-bst-subtree/
//
// Created by Honghao Zhang on 10/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a binary tree, find the largest subtree which is a Binary Search Tree (BST), where largest means subtree with largest number of nodes in it.
//
//Note:
//A subtree must include all of its descendants.
//
//Example:
//
//Input: [10,5,15,1,8,null,7]
//
//   10
//   / \
//  5  15
// / \   \
//1   8   7
//
//Output: 3
//Explanation: The Largest BST Subtree in this case is the highlighted one.
//             The return value is the subtree's size, which is 3.
//Follow up:
//Can you figure out ways to solve it with O(n) time complexity?
//

// 找出最大的BST的大小

import Foundation

class Num333 {
  // MARK: - DFS recursive
  // https://leetcode.com/problems/largest-bst-subtree/discuss/296136/Swift-O(n)-solution-with-extremely-detailed-explanations
  func largestBSTSubtree(_ root: TreeNode?) -> Int {
    return isBST(root).1
  }

  /// Returns if this root is a BST and the nodes count in the tree
  /// and the min value, max value in the tree
  private func isBST(_ root: TreeNode?) -> (Bool, Int, Int, Int) {
    if root == nil {
      return (true, 0, Int.max, Int.min) // returns Int.max, Int.min，来配合底下的
      // min(lMin, root!.val), max(root!.val, rMax)
    }

    let (isLeftBST, leftCount, lMin, lMax) = isBST(root!.left)
    let (isRightBST, rightCount, rMin, rMax) = isBST(root!.right)

    if isLeftBST, lMax < root!.val, isRightBST, root!.val < rMin {
      return (true, leftCount + 1 + rightCount, min(lMin, root!.val), max(root!.val, rMax))
    }
    else {
      return (false, max(leftCount, rightCount), -1, -1)
    }
  }
}
