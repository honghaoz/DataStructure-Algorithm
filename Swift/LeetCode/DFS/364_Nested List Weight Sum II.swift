// 364_Nested List Weight Sum II
// https://leetcode.com/problems/nested-list-weight-sum-ii/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
//
//Each element is either an integer, or a list -- whose elements may also be integers or other lists.
//
//Different from the previous question where weight is increasing from root to leaf, now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.
//
//Example 1:
//
//Input: [[1,1],2,[1,1]]
//Output: 8
//Explanation: Four 1's at depth 1, one 2 at depth 2.
//Example 2:
//
//Input: [1,[4,[6]]]
//Output: 17
//Explanation: One 1 at depth 3, one 4 at depth 2, and one 6 at depth 1; 1*3 + 4*2 + 6*1 = 17.
//

// 还是nested int array，但是这次是deepest leaf是weight 0，root的weight是height

import Foundation

class Num364 {
  // MARK: - BFS: 每一层的sum和之前一层的sum加一遍，重复加
  /**
   * // This is the interface that allows for creating nested lists.
   * // You should not implement it, or speculate about its implementation
   * class NestedInteger {
   *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
   *     public func isInteger() -> Bool
   *
   *     // Return the single integer that this NestedInteger holds, if it holds a single integer
   *     // The result is undefined if this NestedInteger holds a nested list
   *     public func getInteger() -> Int
   *
   *     // Set this NestedInteger to hold a single integer.
   *     public func setInteger(value: Int)
   *
   *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
   *     public func add(elem: NestedInteger)
   *
   *     // Return the nested list that this NestedInteger holds, if it holds a nested list
   *     // The result is undefined if this NestedInteger holds a single integer
   *     public func getList() -> [NestedInteger]
   * }
   */

//  func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
//    var queue: [NestedInteger] = nestedList
//    var prevSum = 0
//    var sum = 0
//
//    // 层层剥离
//    while !queue.isEmpty {
//      let list = queue
//      queue = []
//      var levelSum = 0 // the sum for this level
//      for e in list {
//        if e.isInteger() {
//          levelSum += e.getInteger()
//        }
//        else {
//          queue += e.getList()
//        }
//      }
//
//      prevSum = levelSum + prevSum
//      sum += prevSum
//    }
//
//    return sum
//  }

  // 那么root层的sum就会被重复加height次
  // MARK: - DFS: find the height and use the height to compute the sum
}
