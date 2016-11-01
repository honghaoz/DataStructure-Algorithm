//
//  26. Remove Duplicates from Sorted Array.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-20.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

//Given a sorted array, remove the duplicates in place such that each element appear only once and return the new length.
//
//Do not allocate extra space for another array, you must do this in place with constant memory.
//
//For example,
//Given input array nums = [1,1,2],
//
//Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively. It doesn't matter what you leave beyond the new length.

class Num26_RemoveDuplicatesFromSortedArray: Solution {
	func removeDuplicates(_ nums: inout [Int]) -> Int {
		guard nums.count > 0 else {
			return 0
		}
		
		var lastIndex: Int = 0
		for num in nums {
			if nums[lastIndex] != num {
				lastIndex += 1
				nums[lastIndex] = num
			}
		}
		
		return lastIndex + 1
	}
	
	func test() {
		var nums: [Int] = []
		assert(removeDuplicates(&nums) == 0)
		assert(nums == [])
		
		nums = [1]
		assert(removeDuplicates(&nums) == 1)
		assert(nums == [1])
		
		nums = [1, 1]
		assert(removeDuplicates(&nums) == 1)
		assert(nums == [1, 1])
		
		nums = [1, 1, 1]
		assert(removeDuplicates(&nums) == 1 )
		assert(nums == [1, 1, 1])
		
		nums = [1, 1, 2]
		assert(removeDuplicates(&nums) == 2)
		assert(nums == [1, 2, 2])
		
		nums = [1, 1, 2, 2]
		assert(removeDuplicates(&nums) == 2)
		assert(nums == [1, 2, 2, 2])
		
		nums = [2, 2, 1, 1]
		assert(removeDuplicates(&nums) == 2)
		assert(nums == [2, 1, 1, 1])
	}
}
