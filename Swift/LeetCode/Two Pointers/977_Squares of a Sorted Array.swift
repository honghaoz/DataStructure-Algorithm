// 977_Squares of a Sorted Array
// https://leetcode.com/problems/squares-of-a-sorted-array/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.
//
//
//
//Example 1:
//
//Input: [-4,-1,0,3,10]
//Output: [0,1,9,16,100]
//Example 2:
//
//Input: [-7,-3,2,3,11]
//Output: [4,9,9,49,121]
//
//
//Note:
//
//1 <= A.length <= 10000
//-10000 <= A[i] <= 10000
//A is sorted in non-decreasing order.
//

// 给出一个非递减（递增，可能重复）的数组，可以包含负数
// 求出每个数字squars的数组，并且也是sorted

import Foundation

class Num977 {
  // MARK: - Two pointers
  // Find the dividing point and use two pointers to scan from middle to two sides, merge the numbers.
  // O(n)
  func sortedSquares_twoPointers(_ A: [Int]) -> [Int] {
    // since the original array is already in ascending order
    // we divide the array into negative part and positive part
    // use two pointers to iterative negative part from middle to left and the positive part from middle to right
    // then merge together

    // The result array stores the final numbers
    var result: [Int] = []

    // find the dividing point
    var firstPositive: Int?
    for i in 0..<A.count {
      if A[i] > 0 {
        firstPositive = i
        break
      }
    }

    let breakIndex = firstPositive ?? A.count
    var p = breakIndex     // index for positive numbers
    var q = breakIndex - 1 // index for non-positive numbers
    while p < A.count, q >= 0 {
      let pos = A[p] * A[p]
      let neg = A[q] * A[q]
      if pos < neg {
        result.append(pos)
        p += 1
      }
      else {
        result.append(neg)
        q -= 1
      }
    }

    while p < A.count {
      let pos = A[p] * A[p]
      result.append(pos)
      p += 1
    }
    while q >= 0 {
      let neg = A[q] * A[q]
      result.append(neg)
      q -= 1
    }

    return result
  }

  // MARK: - Use build in functions, O(nlogn)
  func sortedSquares(_ A: [Int]) -> [Int] {
    return A.map { $0 * $0 }.sorted()
  }
}
