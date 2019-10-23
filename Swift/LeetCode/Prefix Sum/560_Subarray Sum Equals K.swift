// 560_Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
//
//Example 1:
//
//Input:nums = [1,1,1], k = 2
//Output: 2
//Note:
//
//The length of the array is in range [1, 20,000].
//The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
//

// 给出一个数组和一个目标K
// 找出所有的subarray，这些subarray的和是K

import Foundation

class Num560 {
  // 用一个dict来保存之前prefix sum出现的次数，这样在从左到右循环计算subarray sum的时候
  // 我们就知道要寻找的之前的prefix sum到底有几个，那么就有几种subarray是我们想要的
  func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    // numberOfPrefixSum[2] means the occurrence of prefix sum that is 2
    // this indicates how many subarrays (starts from 0) that sum is 2
    var numberOfPrefixSum: [Int: Int] = [:]
    // initialize with [0: 1], because for an empty subarray, the sum is 0, 出现了一次
    numberOfPrefixSum[0] = 1

    // scan from left to right
    // since we are finding sum is K, for current prefix sum, we want to
    // check if there's  (k - prefixSum) that has occurred before.
    // If so, we know there're subarrays that sum is K, the occurrence
    // indicates how many subarrays can form

    // for example:
    //  0  1   2  3   4  5
    // [3, 4, -2, 3, -1, 5]
    //  3  7   5  8   7  12
    //
    // k is 5.
    // at index 5, we want to find prefixSum that is 12 - 5 = 7
    // if we look back, we know there're 2 prefix sum that are equal to 7,
    // thus we know subarrays that ends at index 5, we have two.
    // one is (1 - 5], which is [-2, 3, -1, 5]
    // another one is (4, 5], which is [5]

    // the number of subarrays meets the requirement
    var result: Int = 0

    // the prefix sum before i
    var previousSum = 0
    for i in 0..<nums.count {
      let newSum = previousSum + nums[i]

      // we want to find newSum - counterPart = k
      let counterPart = newSum - k
      if let occurrence = numberOfPrefixSum[counterPart] {
        result += occurrence
      }

      // keep the loop invariants
      // update the dictionary
      numberOfPrefixSum[newSum] = (numberOfPrefixSum[newSum] ?? 0) + 1
      previousSum = newSum
    }

    return result
  }
}
