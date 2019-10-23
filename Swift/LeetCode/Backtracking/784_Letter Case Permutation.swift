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

// 给一个字符串，将其中的letter换成大小case，然后生成全部可能的string

import Foundation

class Num784 {
  // MARK: - Recrusive
  // 对于每个char，取出可能的大小case，然后和剩下的substring[1...]组合成最终的结果
  func letterCasePermutation(_ s: String) -> [String] {
    if s.count == 0 {
      return [""]
    }

    // possibleCases stores the permutation of the first char
    var firstCharPermutation: [String] = []

    let first = s[0]
    if Character(first).isLetter {
      firstCharPermutation = [first.uppercased(), first.lowercased()]
    }
    else {
      firstCharPermutation = [first]
    }

    let rest = letterCasePermutation(s.count == 1 ? "" : s[1..<s.count])

    // needs to add the first char's possible cases to the rest permutations
    return rest.flatMap { string -> [String] in
      var array: [String] = []
      for perm in firstCharPermutation {
        array.append(perm + string)
      }
      return array
    }
  }
}
