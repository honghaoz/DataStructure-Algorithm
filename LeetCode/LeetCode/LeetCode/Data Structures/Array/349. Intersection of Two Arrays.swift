//
//  349. Intersection of Two Arrays.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-18.
//  Copyright © 2016 Honghaoz. All rights reserved.
//


// Given two arrays, write a function to compute their intersection.
//
// Example:
// Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].

import Foundation

class Num349_IntersectionOfTwoArrays: Solution {
	func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
		return Array(Set(nums1).intersection(Set(nums2)))
	}
	
	func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
		var results = Set<Int>()
		
		for num1 in nums1 {
			for num2 in nums2 {
				if num1 == num2 {
					results.insert(num1)
				}
			}
		}
		
		return Array(results)
	}
	
	func test() {
		// [], [] -> []
		assert(intersection([], []) == [])
		// [], [1] -> []
		assert(intersection([], [1]) == [])
		// [1], [2] -> []
		assert(intersection([1], [2]) == [])
		// [1], [1] -> [1]
		assert(intersection([1], [1]) == [1])
		// [1, 2], [2] -> [2]
		assert(intersection([1, 2], [2]) == [2])
		// [1, 2, 2, 1], [2, 2] -> [2]
		assert(intersection([1, 2, 2, 1], [2, 2]) == [2])
		
		// [], [] -> []
		assert(intersection2([], []) == [])
		// [], [1] -> []
		assert(intersection2([], [1]) == [])
		// [1], [2] -> []
		assert(intersection2([1], [2]) == [])
		// [1], [1] -> [1]
		assert(intersection2([1], [1]) == [1])
		// [1, 2], [2] -> [2]
		assert(intersection2([1, 2], [2]) == [2])
		// [1, 2, 2, 1], [2, 2] -> [2]
		assert(intersection2([1, 2, 2, 1], [2, 2]) == [2])
	}
}
