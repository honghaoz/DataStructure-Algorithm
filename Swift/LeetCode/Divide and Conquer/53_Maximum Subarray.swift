// 53_Maximum Subarray
// https://leetcode.com/problems/maximum-subarray/
//
// Created by Honghao Zhang on 9/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//
//Example:
//
//Input: [-2,1,-3,4,-1,2,1,-5,4],
//Output: 6
//Explanation: [4,-1,2,1] has the largest sum = 6.
//Follow up:
//
//If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
//

// 找出最大sum的subarray

import Foundation

class Num53 {
  /// Divide and conquer
  func maxSubArray(_ nums: [Int]) -> Int {
    return maxSubArrayHelper(nums, 0, nums.count) // needs to compute in place.
  }
  
  private func maxSubArrayHelper(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
    guard left < right else { return 0 }
    if left + 1 == right {
      return nums[left]
    }
    
    let mid = (left + right) / 2
    let maxLeft = maxSubArrayHelper(nums, left, mid) // 如果subarray在左半边
    let maxRight = maxSubArrayHelper(nums, mid, right) // 如果subarray在右半边
    let maxMid = maxSubArrayMid(nums, left, right, mid) // 如果subarray跨越了左半边和右半边
    return max(maxLeft, maxRight, maxMid)
  }

  // 找出最大的subarray，这个subarray须要包含mid index
  // 从中间像两边扩散，分别找最大值
  private func maxSubArrayMid(_ nums: [Int], _ left: Int, _ right: Int, _ mid: Int) -> Int {
    guard left < right else {
      return 0
    }
    
    var maxLeft: Int! = nil
    var sum = 0
    for i in (left..<mid).reversed() { // compute from mid -> left
      sum += nums[i]
      if maxLeft == nil {
        maxLeft = sum
      } else {
        maxLeft = max(maxLeft, sum)
      }
    }
    var maxRight: Int! = nil
    sum = 0
    for i in mid..<right { // compute from mid -> right
      sum += nums[i]
      if maxRight == nil {
        maxRight = sum
      } else {
        maxRight = max(maxRight, sum)
      }
    }
    return maxLeft + maxRight
  }
  
  // https://leetcode.com/problems/maximum-subarray/solution/
  // TODO: Greedy
  // TODO: DP
  
  // MARK: - Prefix sum, just like stock buy and sell
  func maxSubArray_stock(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
      return 0
    }
    
    // [   -2, 1, -3, 4]  // price change
    // [0, -2, -1, -4, 0] // price
    var prefixSum: [Int] = Array(repeating: 0, count: nums.count + 1)
    for i in 1...nums.count {
      prefixSum[i] = prefixSum[i - 1] +  nums[i - 1]
    }
    
    // Use prefix sum as the stock price and find the max profit
    //    var buyIndex = 0
    var sellIndex = 0
    
    var lowestPriceIndex = 0
    var maxProfit = 0
    for i in 1..<prefixSum.count {
      let newProfit = prefixSum[i] - prefixSum[lowestPriceIndex]
      if newProfit > maxProfit {
        //        buyIndex = lowestPriceIndex
        sellIndex = i
        maxProfit = newProfit
      }
      if prefixSum[i] < prefixSum[lowestPriceIndex] {
        lowestPriceIndex = i
      }
    }
    
    // if there's no sell, this means all numbers are negative, find the largest number
    if sellIndex == 0 {
      return nums.max()!
    }
    else {
      return maxProfit
    }
  }
}
