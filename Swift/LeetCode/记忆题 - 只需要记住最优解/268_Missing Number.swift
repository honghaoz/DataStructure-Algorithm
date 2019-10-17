// 268_Missing Number
// https://leetcode.com/problems/missing-number/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.
//
//Example 1:
//
//Input: [3,0,1]
//Output: 2
//Example 2:
//
//Input: [9,6,4,2,3,5,7,0,1]
//Output: 8
//Note:
//Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
//

import Foundation

class Num268 {
  // MARK: - Sort and find the first gap
  // MARK: - Set and iterate
  // MARK: - Bit manipulation

  // MARK: - Gauss's Formula
  func missingNumber_gauss(_ nums: [Int]) -> Int {
    // 0, 1, 2, 3
    // 可以求expect的sum和actual sum。
    // actual sum会比expect sum大，这是因为这个sum少加了缺掉的数字，但是多加了最后一个数字
    // 多加的最后一个数字一定是nums.count，那么nums.count减去这个差值就是缺掉的数字
    let expectedSum = (nums.count - 1) * nums.count / 2
    let actualSum = nums.reduce(0, +)
    return nums.count - (actualSum - expectedSum)
  }
}
