// 678_Valid Parenthesis String
// https://leetcode.com/problems/valid-parenthesis-string/
//
// Created by HongHao Zhang on 10/8/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
//
//Any left parenthesis '(' must have a corresponding right parenthesis ')'.
//Any right parenthesis ')' must have a corresponding left parenthesis '('.
//Left parenthesis '(' must go before the corresponding right parenthesis ')'.
//'*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
//An empty string is also valid.
//Example 1:
//
//Input: "()"
//Output: True
//Example 2:
//
//Input: "(*)"
//Output: True
//Example 3:
//
//Input: "(*))"
//Output: True
//Note:
//
//The string size will be in the range [1, 100].
//

// 检查一个包含"(", ")"和"*"的字符串是否括号是valid，*可以是"(",")"或者空

import Foundation

class Num678 {
  // MARK: - Stack solution
  // 用两个stack，一个存(的index，一个存*的index
  // 从左到右scan一遍，存入 ( 和 * 的index
  // 当遇到)的时候，先去和(的stack去match，然后去和*的stack去match，如果无法match，那么说明invalid
  // 当所有的)都match完以后
  // 我们可能还留着一些(和*没有match上，那么对于每一个(，去和比这个index大的* match，如果全部(都被清空了，那么就valid
  // 参考：https://leetcode.com/problems/valid-parenthesis-string/discuss/377095/C%2B%2B-Easy-to-understand-using-2-stacks.-Beats-100-time
  func checkValidString(_ s: String) -> Bool {
    return checkValidStringWithStack(Array(s))
  }
  
  private func checkValidStringWithStack(_ s: [Character]) -> Bool {
    // indice for (
    var leftStack: [Int] = []
    // indice for *
    var asteriskStack: [Int] = []
    
    // iterate from left to right, if we found ), try to match with one of the two stacks
    
    for i in 0..<s.count {
      if s[i] == "(" {
        leftStack.append(i)
      }
      else if s[i] == "*" {
        asteriskStack.append(i)
      }
      else {
        if leftStack.isEmpty && asteriskStack.isEmpty {
          return false
        }
        else if leftStack.isEmpty, !asteriskStack.isEmpty {
          asteriskStack.removeLast()
        }
        else if !leftStack.isEmpty, asteriskStack.isEmpty {
          leftStack.removeLast()
        }
        else {
          // if two are available, should try to match the explicit one
          leftStack.removeLast()
          // *(
          // (*
        }
      }
    }
    
    // at this moment, we have some ( and * in the stacks
    // let's try to clean up the "(" with "*" whose index are greater
    while !leftStack.isEmpty {
      let lastLeftIndex = leftStack.removeLast()
      if asteriskStack.isEmpty {
        return false
      }
      else {
        let lastAsteriskIndex = asteriskStack.removeLast()
        if lastAsteriskIndex < lastLeftIndex {
          return false
        }
      }
    }
    
    return true
  }
  
  // TODO:
  // 双向DP，用s[i][j]表示[i...j]的文字是valid，那么求s[i][j]的关系
  // DP:
  // expand with length from 0...1
  // s[i] == "(", there's a ")" that can match "(" and the two intervals are valid
  // s[i] == ")", false
  // s[i] == "*", if * is empty, check f[i + 1][j]
  //              if * is "(", same logic above
  //              if * is ")", false
}
