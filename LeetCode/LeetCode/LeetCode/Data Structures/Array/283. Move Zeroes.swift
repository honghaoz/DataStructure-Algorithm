//
//  283. Move Zeroes.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-24.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
//Note:
//You must do this in-place without making a copy of the array.
//Minimize the total number of operations.

import Foundation

class Num283_MoveZeros: Solution {
    func moveZeroes(_ nums: inout [Int]) {
        guard nums.count > 0 else { return }
        var lastNonZeroIndex: Int = -1
        
        for i in 0..<nums.count {
            let num = nums[i]
            if num == 0 {
                continue
            } else {
                lastNonZeroIndex += 1
                nums[lastNonZeroIndex] = num
            }
        }
        
        while lastNonZeroIndex + 1 < nums.count {
            lastNonZeroIndex += 1
            nums[lastNonZeroIndex] = 0
        }
    }
	
    func test() {
        var nums = [0, 1, 0, 3, 12]
        moveZeroes(&nums)
        assert(nums == [1, 3, 12, 0, 0])
    }
}
