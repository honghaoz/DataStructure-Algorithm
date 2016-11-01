//
//  350. Intersection of Two Arrays II.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-18.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given two arrays, write a function to compute their intersection.
//
//Example:
//Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
//
//Note:
//Each element in the result should appear as many times as it shows in both arrays.
//The result can be in any order.
//Follow up:
//What if the given array is already sorted? How would you optimize your algorithm?
//What if nums1's size is small compared to nums2's size? Which algorithm is better?
//What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

import Foundation

class Num350_IntersectionOfTwoArraysII: Solution {
	func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
		var mutableNums1 = nums1
		var mutableNums2 = nums2
		var results: [Int] = []
		
		var i = 0
		while i < mutableNums1.count {
			for j in 0 ..< mutableNums2.count {
				if mutableNums1[i] == mutableNums2[j] {
					results.append(mutableNums1[i])
					mutableNums1.remove(at: i)
					mutableNums2.remove(at: j)
					i -= 1
					break
				}
			}
			i += 1
		}
		
		return results
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
		assert(intersection([1, 2, 2, 1], [2, 2]) == [2, 2])
		
		// [], [] -> []
//		assert(intersection2([], []) == [])
//		// [], [1] -> []
//		assert(intersection2([], [1]) == [])
//		// [1], [2] -> []
//		assert(intersection2([1], [2]) == [])
//		// [1], [1] -> [1]
//		assert(intersection2([1], [1]) == [1])
//		// [1, 2], [2] -> [2]
//		assert(intersection2([1, 2], [2]) == [2])
//		// [1, 2, 2, 1], [2, 2] -> [2]
//		assert(intersection2([1, 2, 2, 1], [2, 2]) == [2])
	}
}
