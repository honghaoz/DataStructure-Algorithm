// 509_Fibonacci Number
// https://leetcode.com/problems/fibonacci-number/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
//
//F(0) = 0,   F(1) = 1
//F(N) = F(N - 1) + F(N - 2), for N > 1.
//Given N, calculate F(N).
//
//
//
//Example 1:
//
//Input: 2
//Output: 1
//Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
//Example 2:
//
//Input: 3
//Output: 2
//Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
//Example 3:
//
//Input: 4
//Output: 3
//Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
//
//
//Note:
//
//0 ≤ N ≤ 30.
//

import Foundation

class Num509 {
  // Iterative, keep last two numbers
  func fib(_ N: Int) -> Int {
    if N == 0 {
      return 0
    }
    if N == 1 {
      return 1
    }

    var last1 = 1
    var last2 = 0
    var n = 2
    while n < N {
      let last = last1 + last2
      last2 = last1
      last1 = last
      n += 1
    }

    return last1 + last2
  }

  // MARK: - Recursive Top Down
  var cache: [Int: Int] = [:]
  func fib_recursive(_ N: Int) -> Int {
    if let result = cache[N] {
      return result
    }

    if N <= 1 {
      cache[N] = N
      return N
    }

    let num = fib(N - 1) + fib(N - 2)
    cache[N] = num
    return num
  }
}
