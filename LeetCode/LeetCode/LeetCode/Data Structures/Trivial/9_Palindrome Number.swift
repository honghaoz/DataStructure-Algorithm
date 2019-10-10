// 9_Palindrome Number
// https://leetcode.com/problems/palindrome-number/
//
// Created by HongHao Zhang on 10/9/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
//
//Example 1:
//
//Input: 121
//Output: true
//Example 2:
//
//Input: -121
//Output: false
//Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
//Example 3:
//
//Input: 10
//Output: false
//Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
//Follow up:
//
//Coud you solve it without converting the integer to a string?
//

import Foundation

class Num9 {
  // MARK: - Convert to string and compare
  func isPalindrome(_ x: Int) -> Bool {
    return numberToString(x) == String(numberToString(x).reversed())
  }
  
  private func numberToString(_ x: Int) -> String {
    if x == 0 {
      return "0"
    }
    
    var result: String = ""
    if x > 0 {
      var x = x
      while x > 0 {
        result += String(x % 10)
        x = x / 10
      }
    }
    else {
      var xx = -x
      while xx > 0 {
        result += String(xx % 10)
        xx = xx / 10
      }
      result += "-"
    }
    
    return String(result.reversed())
  }
}
