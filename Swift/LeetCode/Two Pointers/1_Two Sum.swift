// 1. Two Sum.swift
// https://leetcode.com/problems/two-sum/

//Given an array of integers, return indices of the two numbers such that they add up to a specific target.
//
//You may assume that each input would have exactly one solution.
//
//Example:
//Given nums = [2, 7, 11, 15], target = 9,
//
//Because nums[0] + nums[1] = 2 + 7 = 9,
//return [0, 1].
//UPDATE (2016/2/13):
//The return format had been changed to zero-based indices. Please read the above updated description carefully.

// 给出一个数组，找出两个数字，使其和等于target

import Foundation

class Num1_TwoSum: Solution {
  // MARK: - Hash
  func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    // 存着已知的num到index的mapping
    var numToIndex: [Int: Int] = [:]
    for i in 0..<nums.count {
      let numToFind = target - nums[i]
      if let indexToFind = numToIndex[numToFind] {
        // 找到返回结果
        return [indexToFind, i]
      } else {
        // 没有找到，更新数组
        numToIndex[nums[i]] = i
      }
    }
    return []
  }

  // MARK: - Brute force
  // O(n^2)
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
      let numToFind = target - nums[i]
      for j in 0..<nums.count {
        if j == i { continue }
        if numToFind == nums[j] {
          return [i, j]
        }
      }
    }

    return []
  }

  func test() {
  }
}
