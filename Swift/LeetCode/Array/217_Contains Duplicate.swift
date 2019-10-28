// 217. Contains Duplicate.swift
// https://leetcode.com/problems/contains-duplicate/
//
// Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
// Example 1:
// Input: [1,2,3,1]
// Output: true
// Example 2:
//
// Input: [1,2,3,4]
// Output: false
// Example 3:
//
// Input: [1,1,1,3,3,4,3,2,4,2]
// Output: true

// 数组的应该包含1 - nums.count
// 求是否有duplicate

import Foundation

class Num217_ContainsDuplicate: Solution {
    // O(n)
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

    // O(n)
	func containsDuplicate2(_ nums: [Int]) -> Bool {
		return nums.count > Set(nums).count
	}

    // O(nlogn)
    func sorted(_ nums: [Int]) -> Bool {
        guard nums.count > 0 else { return false }
        let sorted = nums.sorted()
        for i in 0..<sorted.count - 1 {
            if sorted[i] == sorted[i + 1] {
                return true
            }
        }
        return false
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
