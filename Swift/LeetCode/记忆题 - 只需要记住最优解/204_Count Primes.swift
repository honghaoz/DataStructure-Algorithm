// 204_Count Primes
// https://leetcode.com/problems/count-primes/
//
// Created by Honghao Zhang on 10/17/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Count the number of prime numbers less than a non-negative number, n.
//
//Example:
//
//Input: 10
//Output: 4
//Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
//

// 找到比n小的所有prime number

import Foundation

class Num204 {
  // MARK: - The Sieve of Eratosthenes is one of the most efficient ways to find all prime numbers up to n
  func countPrimes(_ n: Int) -> Int {
    if n == 0 || n == 1 {
      return 0
    }
    
    // create a table that assumes all numbers are prime
    var isPrime: [Bool] = Array(repeating: true, count: n)
    // mark the 0 and 1 are not prime
    isPrime[0] = false
    isPrime[1] = false
    // from 2 and it's multiplier, mark them as not prime
    for i in 2..<n { // 终止条件可以是i * i < n
      if !isPrime[i] {
        continue
      }
      // In fact, we can mark off multiples of 5 starting at 5 × 5 = 25,
      // because 5 × 2 = 10 was already marked off by multiple of 2,
      // similarly 5 × 3 = 15 was already marked off by multiple of 3.
      // Therefore, if the current number is p, we can always mark off multiples
      // of p starting at p2, then in increments of p: p2 + p, p2 + 2p, ...
      for j in stride(from: i * i, through: n - 1, by: i) {
        isPrime[j] = false
      }
    }
    
    // coun the number of prime numbers
    var count = 0
    for i in 0..<n {
      if isPrime[i] {
        count += 1
      }
    }
    return count
  }
}
