//
//  189. Rotate Array.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-26.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Rotate an array of n elements to the right by k steps.
//
//For example, with n = 7 and k = 3, the array [1,2,3,4,5,6,7] is rotated to [5,6,7,1,2,3,4].
//
//Note:
//Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.

import Foundation

class Num189_RotateArray: Solution {
	func rotate(_ nums: inout [Int], _ k: Int) {
		guard nums.isEmpty == false else { return }
		
		let k = k % nums.count
		let rightPart = nums[(nums.count - k)..<nums.count]
		let leftPart = nums[0..<(nums.count - k)]
		nums = Array(rightPart) + Array(leftPart)
	}
	
	func test() {
	}
}
