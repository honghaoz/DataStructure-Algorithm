// 136_Single Number
// https://leetcode.com/problems/single-number/
//
// Created by Honghao Zhang on 10/12/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//
//Note:
//
//Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
//
//Example 1:
//
//Input: [2,2,1]
//Output: 1
//Example 2:
//
//Input: [4,1,2,1,2]
//Output: 4
//

// 找出一个数组中独立的那个数，别的数字都是成双成对的

import Foundation

class Num136 {
  // MARK: - Bit manipulation
  // Space(1)
  // Use XOR to eliminate the duplicated numbers
  // a XOR a = 0
  // a XOR 0 = a
  func singleNumber_bit_manipulation(_ nums: [Int]) -> Int {
    var num = 0
    for n in nums {
      num ^= n
    }
    return num
  }

  // MARK: - Use Set
  // Space(n)
  func singleNumber(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for n in nums {
      if set.contains(n) {
        set.remove(n)
      }
      else {
        set.insert(n)
      }
    }

    return set.first!
  }
}
