//
//  217. Contains Duplicate.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-18.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

import Foundation

class Num217_ContainsDuplicate: Solution {
	func containsDuplicate(_ nums: [Int]) -> Bool {
		var hash: [Int : Int] = [:]
		for num in nums {
			if hash[num] == nil {
				hash[num] = 0
			} else {
				return true
			}
		}
		
		return false
	}
	
	func containsDuplicate2(_ nums: [Int]) -> Bool {
		return nums.count > Set(nums).count
	}
	
	func test() {
		assert(containsDuplicate([]) == false)
		assert(containsDuplicate([1]) == false)
		assert(containsDuplicate([1, 2]) == false)
		assert(containsDuplicate([1, 1]) == true)
		assert(containsDuplicate([1, 2, 1]) == true)
		
		assert(containsDuplicate2([]) == false)
		assert(containsDuplicate2([1]) == false)
		assert(containsDuplicate2([1, 2]) == false)
		assert(containsDuplicate2([1, 1]) == true)
		assert(containsDuplicate2([1, 2, 1]) == true)
	}
}
