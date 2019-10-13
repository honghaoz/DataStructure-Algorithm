// 437_Path Sum III
// https://leetcode.com/problems/path-sum-iii
//
// Created by Honghao Zhang on 9/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You are given a binary tree in which each node contains an integer value.
//
//Find the number of paths that sum to a given value.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (traveling only from parent nodes to child nodes).
//
//The tree has no more than 1,000 nodes and the values are in the range -1,000,000 to 1,000,000.
//
//Example:
//
//root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8
//
//      10
//     /  \
//    5   -3
//   / \    \
//  3   2   11
// / \   \
//3  -2   1
//
//Return 3. The paths that sum to 8 are:
//
//1.  5 -> 3
//2.  5 -> 2 -> 1
//3. -3 -> 11
//

import Foundation

class Num437 {
  /// Divide and conquer
  func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
      // base case
      if root == nil {
        return 0
      }
      if root!.left == nil, root!.right == nil {
        return (sum == root!.val) ? 1 : 0
      }

      // divide
      // case1, only in the left branch
      let leftCount = pathSum(root?.left, sum)
      // case2, only in the right branch
      let rightCount = pathSum(root?.right, sum)
      // case3, path contains root
      let leftCountWithoutRoot = pathSumFromRoot(root?.left, sum - root!.val)
      let rightCountWithoutRoot = pathSumFromRoot(root?.right, sum - root!.val)
      // case4, end at root

      // merge
      return leftCount + rightCount + leftCountWithoutRoot + rightCountWithoutRoot + ((sum == root!.val) ? 1 : 0)
    }

  /// Find paths count that starts with root
  private func pathSumFromRoot(_ root: TreeNode?, _ sum: Int) -> Int {
    if root == nil {
      return 0
    }
    if root!.left == nil, root!.right == nil {
      return (root!.val == sum) ? 1 : 0
    }

    let left = pathSumFromRoot(root!.left, sum - root!.val)
    let right = pathSumFromRoot(root!.right, sum - root!.val)
    return left + right + ((root!.val == sum) ? 1 : 0)
  }

  // https://leetcode.com/problems/path-sum-iii/discuss/91889/Simple-Java-DFS/284664
//  写递归的技巧是：明白一个函数的作用并相信它能完成这个任务，千万不要跳进这个函数里面企图探究更多细节，否则就会陷入无穷的细节无法自拔。你就算浑身是铁，能压几个栈？
//
//  按照前面说的技巧，先来定义清楚每个递归函数应该做的事：
//  pathSum 函数：给他一个节点和一个目标值，他返回以这个节点为根的树中，和为目标值的路径总数。
//  count 函数：给他一个节点和一个目标值，他返回以这个节点为根的树中，能凑出几个以该节点为路径开头，和为目标值的路径总数。
//
//  /* 有了以上铺垫，详细注释一下代码 */
//  int pathSum(TreeNode root, int sum) {
//      if (root == null) return 0;
//      int pathImLeading = count(root, sum); // 自己为开头的路径数
//      int leftPathSum = pathSum(root.left, sum); // 左边路径总数（相信他能算出来）
//      int rightPathSum = pathSum(root.right, sum); // 右边路径总数（相信他能算出来）
//      return leftPathSum + rightPathSum + pathImLeading;
//  }
//  int count(TreeNode node, int sum) {
//      if (node == null) return 0;
//      // 我自己能不能独当一面，作为一条单独的路径呢？
//      int isMe = (node.val == sum) ? 1 : 0;
//      // 左边的小老弟，你那边能凑几个 sum - node.val 呀？
//      int leftBrother = count(node.left, sum - node.val);
//      // 右边的小老弟，你那边能凑几个 sum - node.val 呀？
//      int rightBrother = count(node.right, sum - node.val);
//      return  isMe + leftBrother + rightBrother; // 我这能凑这么多个
//  }
//  还是那句话，明白每个函数能做的事，并相信他们能够完成。
//  我的公众号有篇长文讲如何写递归算法，希望能帮到大家。文章链接(https://mp.weixin.qq.com/s?__biz=MzU0MDg5OTYyOQ==&mid=100000105&idx=1&sn=83337f6a4486d4433378491a2ae395dc&chksm=7b33612b4c44e83d7afe591454829ff3e26253bdebd8304e5eb87d4083668cb0712a2c0b8096#rd)
}
