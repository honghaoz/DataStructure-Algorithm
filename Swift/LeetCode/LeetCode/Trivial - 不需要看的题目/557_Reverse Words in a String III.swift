// 557_Reverse Words in a String III
// https://leetcode.com/problems/reverse-words-in-a-string-iii
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string, you need to reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
//
//Example 1:
//
//Input: "Let's take LeetCode contest"
//Output: "s'teL ekat edoCteeL tsetnoc"
//Note: In the string, each word is separated by single space and there will not be any extra space in the string.
//

import Foundation

class Num557 {
  // Caveat:
  //   1) use split(separator: " ") and joined(separator: " ") to split and join
  //   2) .reversed() needs to cast to String type
  func reverseWords(_ s: String) -> String {
    let words = s.split(separator: " ")
    let processedWords = words.map {
      String($0.reversed())
    }
    return processedWords.joined(separator: " ")

    // Or
//    return s.split(separator: " ")
//      .map({ String($0.reversed()) })
//      .joined(separator: " ")
  }
}
