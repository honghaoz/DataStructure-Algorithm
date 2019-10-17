// 796_Rotate String
// https://leetcode.com/problems/rotate-string/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// We are given two strings, A and B.
//
//A shift on A consists of taking string A and moving the leftmost character to the rightmost position. For example, if A = 'abcde', then it will be 'bcdea' after one shift on A. Return True if and only if A can become B after some number of shifts on A.
//
//Example 1:
//Input: A = 'abcde', B = 'cdeab'
//Output: true
//
//Example 2:
//Input: A = 'abcde', B = 'abced'
//Output: false
//Note:
//
//A and B will have length at most 100.
//

// 求一个string A通过shift char，能不能变成B

import Foundation

class Num796 {
  // A + A must contains B
  func rotateString(_ A: String, _ B: String) -> Bool {
    // "", ""
    if A.isEmpty, B.isEmpty {
      return true
    }
    return A.count == B.count && (A + A).contains(B)
  }
}
