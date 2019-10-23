//
//  16. 3Sum Closest.swift
//  https://leetcode.com/problems/3sum-closest/
//
//  Created by Honghao Zhang on 2016-10-25.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//For example, given array S = {-1 2 1 -4}, and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

// 类似3Sum，但是是找到最接近target的sum

import Foundation

class Num16_ThreeSumClosest: Solution {
  // MARK: - Use Two Pointers
  func threeSumClosest2(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count >= 3 else { return 0 }

    var currentSum: Int! = nil

    let nums = nums.sorted()
    var i = 0
    while i < nums.count - 2 { // 给j, k留位置
      var j = i + 1
      var k = nums.count - 1

      // setup baseline
      if currentSum == nil {
        currentSum = nums[i] + nums[j] + nums[k]
      }

      while j < k {
        let newSum = nums[i] + nums[j] + nums[k]
        // found a closer one.
        if abs(newSum - target) < abs(currentSum - target) {
          currentSum = newSum
        }

        if newSum == target {
          // 直接是target了，不能再近了，返回结果
          return currentSum
        }
        else if newSum < target {
          // sum还小，右移j来更靠近target
          j += 1
          while j < k, nums[j - 1] == nums[j] {
            j += 1
          }
        }
        else {
          // sum还大，左移k来更靠近target
          k -= 1
          while j < k, nums[k] == nums[k + 1] {
            k -= 1
          }
        }
      }
      
      // Skip same num
      i += 1
      while i < nums.count - 2, nums[i] == nums[i - 1] {
        i += 1
      }
    }
    return currentSum
  }

  // Like 3 sum, but keep recording the closest value.
  func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    var result: Int = 0
    guard nums.count >= 3 else { return result }

    let nums = nums.sorted()

    for i in 0..<(nums.count - 2) {
      if i > 0 && nums[i] == nums[i - 1] { continue }

      var j = i + 1
      var k = nums.count - 1

      // set initial value
      if i == 0 {
        result = nums[i] + nums[j] + nums[k]
        if result == target {
          return result
        }
      }

      while j < k {
        let newSum = nums[i] + nums[j] + nums[k]
        if abs(newSum - target) < abs(result - target) {
          result = newSum
        }

        if newSum < target {
          j += 1
          while nums[j] == nums[j - 1] && j < k {
            j += 1
          }
        }
        else if newSum > target {
          k -= 1
          while nums[k] == nums[k + 1] && j < k {
            k -= 1
          }
        }
        else {
          result = target
          break
        }
      }
    }

    return result
  }

  func test() {
    assert(threeSumClosest([0, 1, 2], 3) == 3)
  }
}
