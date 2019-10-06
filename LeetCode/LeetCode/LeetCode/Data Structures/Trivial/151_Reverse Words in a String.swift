// 151_Reverse Words in a String
// https://leetcode.com/problems/reverse-words-in-a-string/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an input string, reverse the string word by word.
//
//
//
//Example 1:
//
//Input: "the sky is blue"
//Output: "blue is sky the"
//Example 2:
//
//Input: "  hello world!  "
//Output: "world! hello"
//Explanation: Your reversed string should not contain leading or trailing spaces.
//Example 3:
//
//Input: "a good   example"
//Output: "example good a"
//Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
//
//
//Note:
//
//A word is defined as a sequence of non-space characters.
//Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
//You need to reduce multiple spaces between two words to a single space in the reversed string.
//
//
//Follow up:
//
//For C programmers, try to solve it in-place in O(1) extra space.
//

import Foundation

class Num151 {
  // Functional
  func reverseWords(_ s: String) -> String {
    return Array(s.split(separator: " ").reversed()).joined(separator: " ")
  }
}
