// 415_Add Strings
// https://leetcode.com/problems/add-strings/
//
// Created by Honghao Zhang on 10/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two non-negative integers num1 and num2 represented as string, return the sum of num1 and num2.
//
//Note:
//
//The length of both num1 and num2 is < 5100.
//Both num1 and num2 contains only digits 0-9.
//Both num1 and num2 does not contain any leading zero.
//You must not use any built-in BigInteger library or convert the inputs to integer directly.
//

// 两个以string形式表示的num，相加，返回string形式表示的sum

import Foundation

class Num415 {
  func addStrings(_ num1: String, _ num2: String) -> String {
    let num1 = Array(num1)
    let num2 = Array(num2)
    var resultArray : [Character] = [Character]()
    
    var carry = 0
    var index1 = num1.count - 1
    var index2 = num2.count - 1
    
    while (index1 >= 0 || index2 >= 0) {
      var val1 :Int = 0
      var val2 : Int = 0
      if index1 >= 0 {
        val1 = Int(num1[index1].asciiValue!) - "0".asciiValue!
        index1 -= 1
      }
      
      if index2 >= 0 {
        val2 = Int(num2[index2].asciiValue!) - "0".asciiValue!
        index2 -= 1
      }
      
      let sum = val1 + val2 + carry
      let temp = sum % 10
      resultArray.append(Character(String(temp)))
      carry = (sum - temp) / 10
    }
    
    if carry > 0 {
      resultArray.append(Character(String(carry)))
    }
    
    return String(resultArray.reversed())
  }
}
