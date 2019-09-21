// 167_Two Sum II - Input array is sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
//
// Created by Honghao Zhang on 9/15/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
//
//The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
//
//Note:
//
//Your returned answers (both index1 and index2) are not zero-based.
//You may assume that each input would have exactly one solution and you may not use the same element twice.
//Example:
//
//Input: numbers = [2,7,11,15], target = 9
//Output: [1,2]
//Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
//

import Foundation

class Num167 {
  func twoPointers(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else {
      return []
    }
    var left = 0
    var right = numbers.count - 1
    while left < right {
      let sum = numbers[left] + numbers[right]
      if sum > target {
        right -= 1
      }
      else if sum < target {
        left += 1
      }
      else {
        return [left + 1, right + 1]
      }
    }
    return []
  }

  // use start + 1 < end.
  func twoPointers2(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else {
      return []
    }
    var left = 0
    var right = numbers.count - 1
    while left + 1 < right {
      let sum = numbers[left] + numbers[right]
      if sum > target {
        right -= 1
      }
      else if sum < target {
        left += 1
      }
      else {
        return [left + 1, right + 1]
      }
    }
    if numbers[left] + numbers[right] == target {
      return [left + 1, right + 1]
    } else {
      return []
    }
  }

  // Binary search
  // nlogn
  func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    guard numbers.count > 1 else {
      return []
    }
    for (i, num) in numbers.enumerated() {
      if let another = find(numbers, target - num, i + 1, numbers.count - 1) {
        return [i + 1, another + 1]
      }
    }
    return []
  }

  // [1, 2]
  // start and end indice are inclusive
  func find(_ numbers: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int? {
    guard end > start else { return start }
    var start = start
    var end = end
    while start + 1 < end {
      let mid = start + (end - start) / 2
      let midNumber = numbers[mid]
      if midNumber < target {
        start = mid
      }
      else if midNumber > target {
        end = mid
      }
      else {
        return mid
      }
    }
    if numbers[start] == target {
      return start
    }
    else if numbers[end] == target {
      return end
    }
    else {
      return nil
    }
  }
}
