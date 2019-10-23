// 339_Nested List Weight Sum
// https://leetcode.com/problems/nested-list-weight-sum/
//
// Created by Honghao Zhang on 10/12/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a nested list of integers, return the sum of all integers in the list weighted by their depth.
//
//Each element is either an integer, or a list -- whose elements may also be integers or other lists.
//
//Example 1:
//
//Input: [[1,1],2,[1,1]]
//Output: 10
//Explanation: Four 1's at depth 2, one 2 at depth 1.
//Example 2:
//
//Input: [1,[4,[6]]]
//Output: 27
//Explanation: One 1 at depth 1, one 4 at depth 2, and one 6 at depth 3; 1 + 4*2 + 6*3 = 27.
//

// 计算一个nest array的加权sum
// 更深的一层有更高的权重

import Foundation

class Num339 {
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

  func depthSum(_ nestedList: [NestedInteger]) -> Int {
    return depthSumHelper(nestedList, 1)
  }

  /// Compute the sum for the nestedList with depth information, the depth should begin from 1
  private func depthSumHelper(_ nestedList: [NestedInteger], _ depth: Int) -> Int {
    guard depth >= 1 else {
      return 0
    }
    var sum: Int = 0
    for item in nestedList {
      if item.isInteger() {
        // just add the integer with the depth
        sum += item.getInteger() * depth
      }
      else {
        // call this function recursivly with bigger depth (+1)
        let list = item.getList()
        sum += depthSumHelper(list, depth + 1)
      }
    }
    return sum
  }
}
