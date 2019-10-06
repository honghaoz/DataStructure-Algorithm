// 66_Plus One
// https://leetcode.com/problems/plus-one/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
//
//The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
//
//You may assume the integer does not contain any leading zero, except the number 0 itself.
//
//Example 1:
//
//Input: [1,2,3]
//Output: [1,2,4]
//Explanation: The array represents the integer 123.
//Example 2:
//
//Input: [4,3,2,1]
//Output: [4,3,2,2]
//Explanation: The array represents the integer 4321.
//

// 简单题，不需要记忆

import Foundation

class Num66 {
  // 用一个carry来保存进位，一开始设置为1，这样就代表 + 1
  func plusOne(_ digits: [Int]) -> [Int] {
    guard digits.count > 0 else {
      return []
    }

    var digits = digits
    var carry = 1

    var i = digits.count - 1
    while i >= 0 {
      let newValue = digits[i] + carry
      digits[i] = newValue % 10
      carry = newValue / 10

      i -= 1
    }
    if carry == 1 {
      digits.insert(1, at: 0)
    }

    return digits
  }
}
