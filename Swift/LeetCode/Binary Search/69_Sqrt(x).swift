// 69_Sqrt(x)
// https://leetcode.com/problems/sqrtx/submissions/
//
// Created by Honghao Zhang on 9/15/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Implement int sqrt(int x).
//
//Compute and return the square root of x, where x is guaranteed to be a non-negative integer.
//
//Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.
//
//Example 1:
//
//Input: 4
//Output: 2
//Example 2:
//
//Input: 8
//Output: 2
//Explanation: The square root of 8 is 2.82842..., and since
//             the decimal part is truncated, 2 is returned.
//
// Tag: Binary search

import Foundation

class Num69 {
  // Use binary search to find the result in the range 1...x - 1
  func mySqrt(_ x: Int) -> Int {
    guard x > 1 else {
      return x
    }
    var start = 1
    var end = x - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if mid * mid < x {
        start = mid
      }
      else if mid * mid > x {
        end = mid
      }
      else {
        return mid
      }
    }
    return start
  }
}
