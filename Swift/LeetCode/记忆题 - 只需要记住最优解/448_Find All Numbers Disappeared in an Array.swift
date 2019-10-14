// 448_Find All Numbers Disappeared in an Array
// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
//
//Find all the elements of [1, n] inclusive that do not appear in this array.
//
//Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
//
//Example:
//
//Input:
//[4,3,2,7,8,2,3,1]
//
//Output:
//[5,6]
//

// 比如一个10个数字的array，里面有重复的数字，找到missing的数字

import Foundation

class Num448 {
  // MARK: - 更改这个array本身，利用负数来标记visited
  func findDisappearedNumbers_O1(_ nums: [Int]) -> [Int] {
    var nums = nums
    for n in nums {
      let index = abs(n) - 1
      if nums[index] > 0 {
        // if this is positive, this is not marked.
        // mark it as negative
        nums[index] = -nums[index]
      }
    }

    var result: [Int] = []
    for i in 0..<nums.count {
      if nums[i] > 0 {
        // this number is not visited
        result.append(i + 1)
      }
    }
    return result
  }

  // MARK: - 用固定大小的dictionary来寻找
  // O(n)
  // O(n)
  func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
      return []
    }

    // stores the num to count
    var dict: [Int: Int] = [:]
    for i in 1...nums.count {
      dict[i] = 0
    }

    for num in nums {
      dict[num] = dict[num]! + 1
    }

    var results: [Int] = []
    for num in 1...nums.count {
      if dict[num]! == 0 {
        results.append(num)
      }
    }

    return results
  }
}
