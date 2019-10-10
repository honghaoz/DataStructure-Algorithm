// 7_Reverse Integer
// https://leetcode.com/problems/reverse-integer/
//
// Created by HongHao Zhang on 10/9/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a 32-bit signed integer, reverse digits of an integer.
//
//Example 1:
//
//Input: 123
//Output: 321
//Example 2:
//
//Input: -123
//Output: -321
//Example 3:
//
//Input: 120
//Output: 21
//Note:
//Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
//

import Foundation

class Num7 {
  // MARK: - 求余，除10，反向过来
  func reverse(_ x: Int) -> Int {
    if x >= 0 {
      return Int(Int32(String(String(x).reversed())) ?? 0)
    }
    else {
      return -Int(Int32(String(String(-x).reversed())) ?? 0)
    }
  }
}
