//
//  20. Valid Parentheses.swift
//  https://leetcode.com/problems/valid-parentheses/
//
//  Created by Honghao Zhang on 2016-11-06.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

import Foundation

class Num20_ValidParentheses: Solution {
  func isValid(_ s: String) -> Bool {
    let s = [Character](s)
    guard s.count > 0 else { return true }

    var stack = [Character]()
    for char in s {
      switch char {
      case "(", "{", "[":
        stack.append(char)
      case ")":
        if stack.popLast() != "(" {
          return false
        }
      case "}":
        if stack.popLast() != "{" {
          return false
        }
      case "]":
        if stack.popLast() != "[" {
          return false
        }
      default: continue
      }
    }
    return stack.count == 0
  }

  func test() {
  }
}
