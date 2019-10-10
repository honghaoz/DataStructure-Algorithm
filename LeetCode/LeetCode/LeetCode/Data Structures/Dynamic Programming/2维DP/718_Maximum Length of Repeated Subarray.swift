// 718_Maximum Length of Repeated Subarray
// https://leetcode.com/problems/maximum-length-of-repeated-subarray/
//
// Created by Honghao Zhang on 10/10/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given two integer arrays A and B, return the maximum length of an subarray that appears in both arrays.
//
//Example 1:
//
//Input:
//A: [1,2,3,2,1]
//B: [3,2,1,4,7]
//Output: 3
//Explanation:
//The repeated subarray with maximum length is [3, 2, 1].
//
//
//Note:
//
//1 <= len(A), len(B) <= 1000
//0 <= A[i], B[i] < 100
//
//

// 找出两个[Int]中的最长的重复的subarray

import Foundation

class Num718 {
  // MARK: 2维DP
  func findLength(_ A: [Int], _ B: [Int]) -> Int {
    // precondition
    if A.count == 0 || B.count == 0 {
      return 0
    }

    // state
    // s[i][j] indicates the longest repeated subarray length ends at A[i] and B[j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: B.count), count: A.count)

    // initialize
    for i in 0..<A.count {
      s[i][0] = (A[i] == B[0]) ? 1 : 0
    }
    for j in 0..<B.count {
      s[0][j] = (A[0] == B[j]) ? 1 : 0
    }

    // transition function
    for i in 1..<A.count {
      for j in 1..<B.count {
        if A[i] == B[j] {
          s[i][j] = s[i - 1][j - 1] + 1
        }
        // this is not necessary
        // else {
        //   s[i][j] = 0
        // }
      }
    }

    // answer
    var maxLength = 0
    for i in 1..<A.count {
      for j in 1..<B.count {
        maxLength = max(maxLength, s[i][j])
      }
    }

    return maxLength
  }
}
