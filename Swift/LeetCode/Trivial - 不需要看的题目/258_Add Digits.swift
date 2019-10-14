// 258_Add Digits
// https://leetcode.com/problems/add-digits/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.
//
//Example:
//
//Input: 38
//Output: 2
//Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2.
//             Since 2 has only one digit, return it.
//Follow up:
//Could you do it without any loop/recursion in O(1) runtime?
//

// 一个数字中的每个digit相加，然后重复下去，直到只有一个数字

import Foundation

class Num258 {
  func addDigits(_ num: Int) -> Int {
    guard num >= 0 else {
      return 0
    }
    if num < 10 {
      return num
    }
    var sum = 0
    var num = num
    while num != 0 {
      sum += num % 10
      num /= 10
    }
    return addDigits(sum)
  }
}
