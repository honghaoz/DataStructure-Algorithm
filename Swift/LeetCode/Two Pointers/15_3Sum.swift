//
//  15. 3Sum.swift
//  https://leetcode.com/problems/3sum/
//
//  Created by Honghao Zhang on 2016-10-24.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note: The solution set must not contain duplicate triplets.
//
//For example, given array S = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//[-1, 0, 1],
//[-1, -1, 2]
//]

// 给出一个数组，求三个数字之和等于0，找出所有的结果

import Foundation

class Num15_ThreeSum: Solution {
  // MARK: - 固定一个左边数字，然后剩下的求2sum（双指针）
  // https://leetcode.com/problems/3sum/discuss/7498/Python-solution-with-detailed-explanation
  func threeSum2(_ nums: [Int]) -> [[Int]] {
    // 必须至少有3个数字，否则没有结果
    guard nums.count >= 3 else { return [] }

    // 必须排序，不然无法做到跳过重复的数字，也不知道双指针移动的方向
    let nums = nums.sorted()
    var res: [[Int]] = []

    var i = 0 // 左边的固定数字
    while i < nums.count - 2 { // 给j, k留位置
      let target = 0 - nums[i] // 2sum需要求的target
      // j, k 左右夹逼
      var j = i + 1
      var k = nums.count - 1
      while j < k {
        if nums[j] + nums[k] == target {
          // 找到目标
          res.append([nums[i], nums[j], nums[k]])
          j += 1 // 右移，跳过重复
          while j < k && nums[j] == nums[j - 1] {
            j += 1
          }
          k -= 1 // 左移，跳过重复
          while j < k && nums[k] == nums[k + 1] {
            k -= 1
          }
        }
        else if nums[j] + nums[k] < target {
          // 小于目标值，左移j
          j += 1
          while j < k && nums[j] == nums[j - 1] {
            j += 1
          }
        }
        else {
          // 大于目标值，右移k
          k -= 1
          while j < k && nums[k] == nums[k + 1] {
            k -= 1
          }
        }
      }

      // 移动固定点，跳过重复
      i += 1
      while i < nums.count - 2 && nums[i] == nums[i - 1] {
        i += 1
      }
    }
    return res
  }

  func threeSum(_ nums: [Int]) -> [[Int]] {
    var results: [[Int]] = []
    // 必须至少有3个数字，否则没有结果
    guard nums.count >= 3 else { return results }

    // 必须排序，不然无法做到跳过重复的数字
    let nums = nums.sorted()

    let target = 0
    for i in 0..<(nums.count - 2) {
      // Try first element, but skip duplicated nums
      if i > 0 && nums[i] == nums[i - 1] {
        continue
      }

      var j = i + 1
      var k = nums.count - 1
      while j < k {
        if nums[i] + nums[j] + nums[k] == target {
          results.append([nums[i], nums[j], nums[k]])
          j += 1
          while nums[j] == nums[j - 1] && j < k {
            j += 1
          }

          k -= 1
          while nums[k] == nums[k + 1] && j < k {
            k -= 1
          }
        }
        else if nums[i] + nums[j] + nums[k] < target {
          j += 1
          while nums[j] == nums[j - 1] && j < k {
            j += 1
          }
        }
        else {
          k -= 1
          while nums[k] == nums[k + 1] && j < k {
            k -= 1
          }
        }
      }
    }

    return results
  }

  func test() {
    var nums = [-1, 0, 1, 2, -1, -4]
    var results = threeSum(nums)
    assert(results[0] == [-1, -1, 2])
    assert(results[1] == [-1, 0, 1])

    nums = [0, 0, 0]
    results = threeSum(nums)
    assert(results[0] == [0, 0, 0])
  }
}
