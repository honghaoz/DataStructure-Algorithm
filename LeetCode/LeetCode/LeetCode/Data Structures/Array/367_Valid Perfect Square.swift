// 367_Valid Perfect Square
// https://leetcode.com/problems/valid-perfect-square/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a positive integer num, write a function which returns True if num is a perfect square else False.
//
//Note: Do not use any built-in library function such as sqrt.
//
//Example 1:
//
//Input: 16
//Output: true
//Example 2:
//
//Input: 14
//Output: false
//

import Foundation

class Num367 {
  // This is essentialy a sqrt wrapper.
  // Binary search under the hood.
  func isPerfectSquare(_ num: Int) -> Bool {
    let root = Num69().mySqrt(num)
    return root * root == num
  }
}
