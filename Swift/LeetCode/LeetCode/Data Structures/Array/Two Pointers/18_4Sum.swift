//
//  18. 4Sum.swift
//  https://leetcode.com/problems/4sum/
//
//  Created by Honghao Zhang on 2016-10-25.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note: The solution set must not contain duplicate quadruplets.
//
//For example, given array S = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
//[-1,  0, 0, 1],
//[-2, -1, 1, 2],
//[-2,  0, 0, 2]
//]

import Foundation

class Num18_FourSum: Solution {
  /// standard while loops.
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count > 3 else {
      return []
    }
    let nums = nums.sorted()
    var results: [[Int]] = []
    var i = 0
    while i < nums.count - 3 {
      var j = i + 1
      while j < nums.count - 2 {
        // move two sides
        var a = j + 1
        var b = nums.count - 1
        while a < b {
          let newSum = nums[i] + nums[j] + nums[a] + nums[b]
          if newSum < target {
            // increase a
            a += 1
            // skip if equal
            while nums[a] == nums[a - 1], a < b {
              a += 1
            }
          }
          else if newSum > target {
            // decrease b
            b -= 1
            // skip if equal
            while nums[b] == nums[b + 1], a < b {
              b -= 1
            }
          }
          else {
            // found
            results.append([nums[i], nums[j], nums[a], nums[b]])
            a += 1
            b -= 1
            while nums[a] == nums[a - 1], a < b {
              a += 1
            }
            while nums[b] == nums[b + 1], a < b {
              b -= 1
            }
          }
        }
        j += 1
        while nums[j] == nums[j - 1], j < nums.count - 2 {
          j += 1
        }
      }
      i += 1
      while nums[i] == nums[i - 1], i < nums.count - 3 {
        i += 1
      }
    }
    return results
  }

  // The difference is this is for loop and skips at the beginning of a loop
	func fourSum2(_ nums: [Int], _ target: Int) -> [[Int]] {
		var results: [[Int]] = []
		guard nums.count > 3 else { return results }
		
		let nums = nums.sorted()
		for i in 0..<(nums.count - 3) {
			if i > 0 && nums[i] == nums[i - 1] { continue }
			for j in (i + 1)..<(nums.count - 2) {
				if j > (i + 1) && nums[j] == nums[j - 1] { continue }
				var a = j + 1
				var b = nums.count - 1
				while a < b {
					let newSum = nums[i] + nums[j] + nums[a] + nums[b]
					if newSum < target {
						a += 1
						while nums[a] == nums[a - 1] && a < b {
							a += 1
						}
					}
					else if newSum > target {
						b -= 1
						while nums[b] == nums[b + 1] && a < b {
							b -= 1
						}
					}
					else {
						results.append([nums[i], nums[j], nums[a], nums[b]])
						a += 1
						b -= 1
						while nums[a] == nums[a - 1] && a < b {
							a += 1
						}
						while nums[b] == nums[b + 1] && a < b {
							b -= 1
						}
					}
				}
			}
		}
		
		return results
	}
	
	func test() {
		
	}
}
