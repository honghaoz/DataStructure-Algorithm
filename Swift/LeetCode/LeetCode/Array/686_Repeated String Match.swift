// 686_Repeated String Match
// https://leetcode.com/problems/repeated-string-match/
//
// Created by Honghao Zhang on 9/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two strings A and B, find the minimum number of times A has to be repeated such that B is a substring of it. If no such solution, return -1.
//
//For example, with A = "abcd" and B = "cdabcdab".
//
//Return 3, because by repeating A three times (“abcdabcdabcd”), B is a substring of it; and B is not a substring of A repeated two times ("abcdabcd").
//
//Note:
//The length of A and B will be between 1 and 10000.
//

import Foundation

class Num686 {
  // At least this is readable
//  https://leetcode.com/problems/repeated-string-match/discuss/358857/Python-an-alternative-solution-with-details
  func repeatedStringMatch(_ A: String, _ B: String) -> Int {
    guard A.count > 0 else {
      return -1
    }
    guard B.count > 0 else {
      return 0
    }

    // A > B
    // A == B
    if A.count >= B.count {
      // either 1
      if A.contains(B) {
        return 1
      }
      else if (A + A).contains(B) {
        // or 2
        return 2
      }
      else {
        return  -1
      }
    }
    // A < B
    // 1) repeats A until the new string is >= B
    var count = 1
    var s = A
    while s.count < B.count {
      s += A
      count += 1
    }
    if s.contains(B) {
      return count
    }
    else if (s + A).contains(B) {
      return count + 1
    }
    else {
      return  -1
    }
  }
}
