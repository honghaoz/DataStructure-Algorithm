// 1031_Maximum Sum of Two Non-Overlapping Subarrays
// https://leetcode.com/problems/maximum-sum-of-two-non-overlapping-subarrays/
//
// Created by Honghao Zhang on 10/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array A of non-negative integers, return the maximum sum of elements in two non-overlapping (contiguous) subarrays, which have lengths L and M.  (For clarification, the L-length subarray could occur before or after the M-length subarray.)
//
//Formally, return the largest V for which V = (A[i] + A[i+1] + ... + A[i+L-1]) + (A[j] + A[j+1] + ... + A[j+M-1]) and either:
//
//0 <= i < i + L - 1 < j < j + M - 1 < A.length, or
//0 <= j < j + M - 1 < i < i + L - 1 < A.length.
//
//
//Example 1:
//
//Input: A = [0,6,5,2,2,5,1,9,4], L = 1, M = 2
//Output: 20
//Explanation: One choice of subarrays is [9] with length 1, and [6,5] with length 2.
//Example 2:
//
//Input: A = [3,8,1,3,2,1,8,9,0], L = 3, M = 2
//Output: 29
//Explanation: One choice of subarrays is [3,8,1] with length 3, and [8,9] with length 2.
//Example 3:
//
//Input: A = [2,1,5,6,0,9,5,0,3,8], L = 4, M = 3
//Output: 31
//Explanation: One choice of subarrays is [5,6,0,9] with length 4, and [3,8] with length 3.
//
//
//Note:
//
//L >= 1
//M >= 1
//L + M <= A.length <= 1000
//0 <= A[i] <= 1000
//

import Foundation

class Num1031 {
  // for each dividing point, find the left side sum and right side sum

  /// To find the max of either Left subarray has the length of L and right subarray has the length of R
  /// or
  /// The left subarray has the length of R and right subarray has the length of L
  func maxSumTwoNoOverlap(_ A: [Int], _ L: Int, _ M: Int) -> Int {
    return max(maxSumTwoNoOverlapHelper(A, L, M), maxSumTwoNoOverlapHelper(A, M, L))
  }

  /// Left side has L length, right side has M length
  private func maxSumTwoNoOverlapHelper(_ A: [Int], _ L: Int, _ M: Int) -> Int {
    // leftSum[i] represents the prefix sum for A[0..<i] with max length L
    var leftSum: [Int] = Array(repeating: 0, count: A.count + 1)
    // similarly for the right,  rightSum[i] == sum of A[i...] with max length M
    var rightSum: [Int] = Array(repeating: 0, count: A.count + 1)

    // compute the left prefix sum with max L
    for i in 1...A.count {
      leftSum[i] = leftSum[i - 1] - A.value(i - L - 1) + A[i - 1]
    }

    // compute the right postfix sum with max M
    for i in (0..<A.count).reversed() {
      rightSum[i] = rightSum[i + 1] - A.value(i + M) + A[i]
    }

    var leftMaxSum: [Int] = Array(repeating: Int.min, count: A.count + 1)
    var rightMaxSum: [Int] = Array(repeating: Int.min, count: A.count + 1)
    for i in L..<A.count {
      leftMaxSum[i] = max(leftMaxSum[i - 1], leftSum[i])
    }
    for i in (0...A.count - M).reversed() {
      rightMaxSum[i] = max(rightMaxSum[i + 1], rightSum[i])
    }

    // find the max
    var result: Int = Int.min
    print(L, A.count - M)
    for i in L...(A.count - M) {
      result = max(result, leftMaxSum[i] + rightMaxSum[i])
    }
    return result
  }
}

private extension Array where Element == Int {
  /// get the value in the array of 0.
  func value(_ i: Int) -> Int {
    guard 0 <= i, i < self.count else {
      return 0
    }
    return self[i]
  }
}
