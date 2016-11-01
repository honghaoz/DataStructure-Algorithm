//
//  219. Contains Duplicate II.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-18.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

//Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the difference between i and j is at most k.

class Num219_ContainsDuplicate: Solution {
	func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
		if nums.count <= k + 1 {
			return nums.count > Set(nums).count
		}
		
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
