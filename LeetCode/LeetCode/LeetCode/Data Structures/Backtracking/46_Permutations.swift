// 46_Permutations
// https://leetcode.com/problems/permutations/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a collection of distinct integers, return all possible permutations.
//
//Example:
//
//Input: [1,2,3]
//Output:
//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]
//

import Foundation

class Num46 {
  // 标准的backtracking算法

  // MARK: - 好理解
  // 下面这个permuteHelper是一个经典的搜索算法，比较好理解
  // 但是创造numbers to select会造成效率低下，时间和空间都浪费
  func permute(_ nums: [Int]) -> [[Int]] {
    return permuteHelper([], nums)
  }

  /// Return permutations with current path and numbers available
  /// - Parameter path: the selected numbers
  /// - Parameter numsToSelect: the possible path
  private func permuteHelper(_ path: [Int], _ numsToSelect: [Int]) -> [[Int]] {
    if numsToSelect.count == 0 {
      return [path]
    }

    var result: [[Int]] = []
    for i in 0..<numsToSelect.count {
      // for each number, choose and find the possible results
      result += permuteHelper(path + [numsToSelect[i]], numsToSelect.exluded(i: i))
    }
    return result
  }

  // MARK: - 优化效率
  // 参考：https://blog.csdn.net/crystal6918/article/details/51924665
  // 为了避免重复创造numbers to select这样的数组，我们进行标准的backtrack，就是向前进一步，完成任务，然后退回之前的那一步。然后选择新的路径。
  func permute2(_ nums: [Int]) -> [[Int]] {
    var nums = nums
    return permuteHelper2([], &nums, 0)
  }

  /// Return permutations with current path and numbers available
  /// - Parameter path: the selected numbers
  /// - Parameter nums: All of the numbers
  /// - Parameter position: Current position
  private func permuteHelper2(_ path: [Int], _ nums: inout [Int], _ position: Int) -> [[Int]] {
    // If there's no path to go, ends
    if position == nums.count {
      return [path]
    }

    var result: [[Int]] = []
    for i in position..<nums.count {
      // for each number (the branch point), choose and find the possible results via this path
      // to make sure the nums[i + 1...] is the numbers to select, we need to swap

      // choose
      let newPath = path + [nums[i]]
      (nums[i], nums[position]) = (nums[position], nums[i])

      // find the solution in this path
      result += permuteHelper2(newPath, &nums, position + 1)
      
      // backtrack
      (nums[i], nums[position]) = (nums[position], nums[i])
    }
    return result
  }
}

private extension Array where Element == Int {
  func exluded(i: Int) -> [Int] {
    var result: [Int] = []
    for j in 0..<self.count {
      if j != i {
        result.append(self[j])
      }
    }
    return result
  }
}
