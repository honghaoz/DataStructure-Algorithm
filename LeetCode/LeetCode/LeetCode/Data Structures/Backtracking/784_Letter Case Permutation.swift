// 784_Letter Case Permutation
// https://leetcode.com/problems/letter-case-permutation/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a string S, we can transform every letter individually to be lowercase or uppercase to create another string.  Return a list of all possible strings we could create.
//
//Examples:
//Input: S = "a1b2"
//Output: ["a1b2", "a1B2", "A1b2", "A1B2"]
//
//Input: S = "3z4"
//Output: ["3z4", "3Z4"]
//
//Input: S = "12345"
//Output: ["12345"]
//Note:
//
//S will be a string with length between 1 and 12.
//S will consist only of letters or digits.
//

// 简单题，很直观

import Foundation

class Num784 {
  // Recrusive
  func letterCasePermutation(_ s: String) -> [String] {
    if s.count == 0 {
      return [""]
    }

    // result stores the permutation of the first char
    var result: [String] = []

    let first = s[0]
    if first.isAlpha {
      result = [first.uppercased(), first.lowercased()]
    }
    else {
      result = [first]
    }

    let rest = letterCasePermutation(s.count == 1 ? "" : s[1..<s.count])
    // needs to add result to each item in the rest
    return rest.flatMap { string -> [String] in
      var array: [String] = []
      array.append(result[0] + string)
      if result.count > 1 {
        array.append(result[1] + string)
      }
      return array
    }
  }
}

private extension String {
  var isAlpha: Bool {
    return ("a" <= self && self <= "z") || ("A" <= self && self <= "Z")
  }
  var isLowercased: Bool {
    return ("a" <= self && self <= "z")
  }
  var isUppercased: Bool {
    return ("A" <= self && self <= "Z")
  }
}
