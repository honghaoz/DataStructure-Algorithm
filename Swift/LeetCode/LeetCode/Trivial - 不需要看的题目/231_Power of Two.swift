// 231_Power of Two
// https://leetcode.com/problems/power-of-two/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer, write a function to determine if it is a power of two.
//
//Example 1:
//
//Input: 1
//Output: true
//Explanation: 20 = 1
//Example 2:
//
//Input: 16
//Output: true
//Explanation: 24 = 16
//Example 3:
//
//Input: 218
//Output: false
//

import Foundation

class Num231 {
  func isPowerOfTwo(_ n: Int) -> Bool {
    var n = n
    while n > 0 && n % 2 == 0 {
      n = n / 2
    }
    return n == 1
  }
}
