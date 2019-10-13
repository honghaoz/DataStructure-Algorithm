// 78_Subsets
// https://leetcode.com/problems/subsets/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a set of distinct integers, nums, return all possible subsets (the power set).
//
//Note: The solution set must not contain duplicate subsets.
//
//Example:
//
//Input: nums = [1,2,3]
//Output:
//[
//  [3],
//  [1],
//  [2],
//  [1,2,3],
//  [1,3],
//  [2,3],
//  [1,2],
//  []
//]
//

import Foundation

class Num78 {
  // MARK: Backtrack
  func subsets_backtrack(_ nums: [Int]) -> [[Int]] {
    var results: [[Int]] = []
    subsets_backtrackHelper([], nums, &results)
    return results
  }

  func subsets_backtrackHelper(_ path: [Int], _ numsToSelect: [Int], _ result: inout [[Int]]) {
    result.append(path)
    if numsToSelect.count == 0 {
      return
    }

    for i in 0..<numsToSelect.count {
      subsets_backtrackHelper(path + [numsToSelect[i]], numsToSelect.exludedBefore(i: i + 1), &result)
    }
  }

  // MARK: - 另一种recursive
  func subsets(_ nums: [Int]) -> [[Int]] {
    return subsetsHelper(nums)
  }

  private func subsetsHelper(_ nums: [Int]) -> [[Int]] {
    if nums.count == 0 {
      return [[]]
    }
    let first = nums[0]
    let subsetOfRest = subsetsHelper([Int](nums[1...]))
    return subsetOfRest + subsetOfRest.map { $0 + [first] }
  }

  // MARK: - 优化的另一种recursive
  func subsets2(_ nums: [Int]) -> [[Int]] {
    return subsetsHelper2(nums, 0)
  }

  private func subsetsHelper2(_ nums: [Int], _ position: Int) -> [[Int]] {
    if position == nums.count {
      return [[]]
    }
    let first = nums[position]
    let subsetOfRest = subsetsHelper2(nums, position + 1)
    return subsetOfRest + subsetOfRest.map { $0 + [first] }
  }


}

private extension Array where Element == Int {
  func exludedBefore(i: Int) -> [Int] {
    var result: [Int] = []
    for j in 0..<self.count {
      if j >= i {
        result.append(self[j])
      }
    }
    return result
  }
}
