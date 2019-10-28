// 219. Contains Duplicate II.swift
// https://leetcode.com/problems/contains-duplicate-ii/
//
// Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
// Example 1:
//
// Input: nums = [1,2,3,1], k = 3
// Output: true
// Example 2:
//
// Input: nums = [1,0,1,1], k = 1
// Output: true
// Example 3:
//
// Input: nums = [1,2,3,1,2,3], k = 2
// Output: false

import Foundation

class Num219_ContainsDuplicate: Solution {
  // MARK: - Just store the max index of the number.
  // Then iterate and check if the distance is less than k
  func numberToIndex(_ nums: [Int], _ k: Int) -> Bool {
    var numberToMaxIndex: [Int: Int] = [:]
    for (i, n) in nums.enumerated() {
      if let existingIndex = numberToMaxIndex[n] {
        if i - existingIndex <= k {
          return true
        }
        numberToMaxIndex[n] = i
      } else {
        numberToMaxIndex[n] = i
      }
    }
    return false
  }

  // MARK: - ???
  func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    // The gap is <= k, thus the max count is k+1
    if nums.count <= k + 1 {
      // Same as checking the duplicates
      return nums.count > Set(nums).count
    }

    // Store number -> Indices
    // If found same number, check if the distance is <= k
    var hash: [Int : [Int]] = [:]
    for (index, number) in nums.enumerated() {
      if var existedIndices = hash[number] {
        for existedIndex in existedIndices {
          if index - existedIndex <= k {
            return true
          }
        }
        existedIndices.append(index)
        hash[number] = existedIndices
      } else {
        hash[number] = [index]
      }
    }
    return false
  }

  func test() {
    assert(containsNearbyDuplicate([1,2,1], 1) == false)
    assert(containsNearbyDuplicate([1,2,1], 2) == true)
    assert(containsNearbyDuplicate([1,0,1,1], 1) == true)
  }
}
