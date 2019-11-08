// 224_Basic Calculator
// https://leetcode.com/problems/basic-calculator/
//
// Created by Honghao Zhang on 11/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Implement a basic calculator to evaluate a simple expression string.
//
//The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
//
//Example 1:
//
//Input: "1 + 1"
//Output: 2
//Example 2:
//
//Input: " 2-1 + 2 "
//Output: 3
//Example 3:
//
//Input: "(1+(4+5+2)-3)+(6+8)"
//Output: 23
//Note:
//You may assume that the given expression is always valid.
//Do not use the eval built-in library function.
//

// 实现一个有括号，只包含正负号的expression的计算器

import Foundation

class Num224 {
  // MARK: - 用stack来处理sub expression
  // FIXME: 用stack来实现这个问题
  func calculate(_ s: String) -> Int {
    return calculate(Array(s))
  }

  private func calculate(_ chars: [Character]) -> Int {
    let s = chars.filter { $0 != " " } // clean up spaces
    var answer = 0
    var i = 0
    while i < s.count {
      if s[i] == "(" {
        // collect the sub expression and call evaluate by calling self
        var j = i + 1 // the end index (exclusive) is the sub expression
        while j < s.count, s[j] != ")" {
          j += 1
        }
        answer += calculate(Array(chars[i + 1..<j]))
        i = j + 1
      }
      else {
        let symbol: Int
        // update answer
        if s[i] == "-" {
          i += 1
          symbol = -1
        }
        else {
          symbol = 1
          if s[i] == "+" {
            i += 1
          }
        }
        let (num, offset) = readNextNumber(s, i)
        i += offset
        answer += symbol * num
      }
    }
    return answer
  }

  // return next number and the index offset to move
  private func readNextNumber(_ chars: [Character], _ beginIndex: Int) -> (Int, Int) {
    print(chars, beginIndex)
    precondition(chars[beginIndex].isNumber)
    var numberChars: [Character] = []
    var offset = 0
    while beginIndex + offset < chars.count {
      let current = chars[beginIndex + offset]
      if current.isNumber {
        numberChars.append(current)
        offset += 1
      }
      else {
        break
      }
    }
    return (Int(String(numberChars))!, offset)
  }
}

extension Character {
  private var isNumber: Bool {
    return Character("0").asciiValue! <= asciiValue! && asciiValue! <= Character("9").asciiValue!
  }
}
