// 326_Power of Three
// https://leetcode.com/problems/power-of-three/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an integer, write a function to determine if it is a power of three.
//
//Example 1:
//
//Input: 27
//Output: true
//Example 2:
//
//Input: 0
//Output: false
//Example 3:
//
//Input: 9
//Output: true
//Example 4:
//
//Input: 45
//Output: false
//Follow up:
//Could you do it without using any loop / recursion?
//

import Foundation

class Num326 {
  // MARK: - Iteration
  func isPowerOfThree(_ n: Int) -> Bool {
    var n = n
    while n > 0 && n % 3 == 0 {
      n = n / 3
    }
    return n == 1
  }
}
