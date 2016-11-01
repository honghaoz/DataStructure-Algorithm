//
//  33. Search in Rotated Sorted Array.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-31.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Suppose a sorted array is rotated at some pivot unknown to you beforehand.
//
//(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
//
//You are given a target value to search. If found in the array return its index, otherwise return -1.
//
//You may assume no duplicate exists in the array.
//
//Subscribe to see which companies asked this question

import Foundation

class Num33_SearchinRotatedSortedArray: Solution {
	// [ )
	// func search(_ nums: [Int], _ target: Int) -> Int {
	//     guard nums.count > 0 else { return -1 }
	//     var start = 0
	//     var end = nums.count
	//     while start != end {
	//         var mid = start + (end - start) / 2
	//         if nums[mid] == target {
	//             return mid
	//         }
	//         if nums[start] <= nums[mid] {
	//             if nums[start] <= target && target < nums[mid] {
	//                 end = mid
	//             }
	//             else {
	//                 start = mid + 1
	//             }
	//         }
	//         else {
	//             if nums[mid] < target && target <= nums[end - 1] {
	//                 start = mid + 1
	//             }
	//             else {
	//                 end = mid
	//             }
	//         }
	//     }
	
	//     return -1
	// }
	
	// [ ]
	
	func search(_ nums: [Int], _ target: Int) -> Int {
		guard nums.count > 0 else { return -1 }
		var start = 0
		var end = nums.count - 1
		while start + 1 < end {
			let mid = start + (end - start) / 2
			if nums[mid] == target {
				return mid
			}
			
			// Cut first part
			if nums[start] < nums[mid] {
				if nums[start] <= target && target <= nums[mid] {
					end = mid
				}
				else {
					start = mid
				}
			}
				// Cut second part
			else {
				if nums[mid] <= target && target <= nums[end] {
					start = mid
				}
				else {
					end = mid
				}
			}
		}
		
		if nums[start] == target {
			return start
		}
		
		if nums[end] == target {
			return end
		}
		
		return -1
	}
	
	func test() {
	}
}
