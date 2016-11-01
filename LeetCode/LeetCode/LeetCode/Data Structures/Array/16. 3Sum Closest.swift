//
//  16. 3Sum Closest.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-25.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array S of n integers, find three integers in S such that the sum is closest to a given number, target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//For example, given array S = {-1 2 1 -4}, and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

import Foundation

class Num16_ThreeSumClosest: Solution {
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		var result: Int = 0
		guard nums.count > 2 else { return result } // question to ask
		let nums = nums.sorted()
		
		for i in 0..<(nums.count - 2) {
			if i > 0 && nums[i] == nums[i - 1] { continue }
			
			var j = i + 1
			var k = nums.count - 1
			
			// set initial value
			if i == 0 {
				result = nums[i] + nums[j] + nums[k]
				if result == target {
					return result
				}
			}
			
			while j < k {
				let newSum = nums[i] + nums[j] + nums[k]
				if abs(newSum - target) < abs(result - target) {
					result = newSum
				}
				
				if newSum < target {
					j += 1
					while nums[j] == nums[j - 1] && j < k {
						j += 1
					}
				}
				else if newSum > target {
					k -= 1
					while nums[k] == nums[k + 1] && j < k {
						k -= 1
					}
				}
				else {
					result = target
					break
				}
			}
		}
		
		return result
	}
	
	func test() {
		assert(threeSumClosest([0, 1, 2], 3) == 3)
	}
}
