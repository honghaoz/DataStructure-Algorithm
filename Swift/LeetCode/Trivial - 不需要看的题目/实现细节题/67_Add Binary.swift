// 67_Add Binary
// https://leetcode.com/problems/add-binary/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two binary strings, return their sum (also a binary string).
//
//The input strings are both non-empty and contains only characters 1 or 0.
//
//Example 1:
//
//Input: a = "11", b = "1"
//Output: "100"
//Example 2:
//
//Input: a = "1010", b = "1011"
//Output: "10101"
//

// 二进制数相加，用string表示

import Foundation

class Num67 {
  func addBinary(_ a: String, _ b: String) -> String {
    let a = Array(a)
    let b = Array(b)
    var result: String = "" // in reversed order
    
    var pa = a.count - 1
    var pb = b.count - 1
    var carry = 0
    while pa >= 0 || pb >= 0 {
      let vala: Int = (pa < 0) ? 0 : a[pa].value
      let valb: Int = (pb < 0) ? 0 : b[pb].value
      let sum = vala + valb + carry
      result += String(sum % 2)
      carry = sum / 2
      
      pa -= 1
      pb -= 1
    }
    
    if carry > 0 {
      result += String(carry)
    }
    
    return String(result.reversed())
  }
}

private extension Character {
  var value: Int {
    if self == Character("0") {
      return 0
    }
    else {
      return 1
    }
  }
}
