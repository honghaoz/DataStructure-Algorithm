//
//  239. Sliding Window Maximum.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-31.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

//Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.
//
//For example,
//Given nums = [1,3,-1,-3,5,3,6,7], and k = 3.
//
//Window position                Max
//---------------               -----
//[1  3  -1] -3  5  3  6  7       3
//1 [3  -1  -3] 5  3  6  7       3
//1  3 [-1  -3  5] 3  6  7       5
//1  3  -1 [-3  5  3] 6  7       5
//1  3  -1  -3 [5  3  6] 7       6
//1  3  -1  -3  5 [3  6  7]      7
//Therefore, return the max sliding window as [3,3,5,5,6,7].
//
//Note:
//You may assume k is always valid, ie: 1 ≤ k ≤ input array's size for non-empty array.
//
//Follow up:
//Could you solve it in linear time?

class Num239_SlidingWindowMaximum: Solution {
	func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
		var res: [Int] = []
		var q: [Int] = []
		
		for i in nums.startIndex ..< nums.endIndex {
			// Check whether the first element is still in the window
			if let first = q.first, first < i - k + 1 {
				q.removeFirst()
			}
			
			// Check coming element, clear smaller elements
			while q.isEmpty == false && nums[q.last!] < nums[i] {
				q.removeLast()
			}
			
			q.append(i)
			
			// Record if needed
			if (i - k + 1 >= 0) {
				res.append(nums[q.first!])
			}
		}
		
		return res
	}
	
	func test() {
	}
}
