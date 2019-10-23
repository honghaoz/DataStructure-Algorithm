//
//  238. Product of Array Except Self.swift
//  https://leetcode.com/problems/product-of-array-except-self/
//
//  Created by Honghao Zhang on 2016-10-26.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array of n integers where n > 1, nums, return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
//
//Solve it without division and in O(n).
//
//For example, given [1,2,3,4], return [24,12,8,6].
//
//Follow up:
//Could you solve it with constant space complexity? (Note: The output array does not count as extra space for the purpose of space complexity analysis.)

// 给出一个数组，求出除了self的乘积的数组

import Foundation

class Num238_ProductOfArrayExceptSelf: Solution {
  /// Build two arrays:
  ///   1) the product of left elements, except self
  ///   2) the product of right elements,
  ///   3) product of these two arrays
  func productExceptSelf_readable(_ nums: [Int]) -> [Int] {
    var running = 1 // the running product
    var leftProduct: [Int] = []
    for i in 0..<nums.count {
      leftProduct.append(running)
      running *= nums[i]
    }

    running = 1
    var rightProduct: [Int] = []
    for i in (0...(nums.count - 1)).reversed() {
      rightProduct.append(running)
      running *= nums[i]
    }
    rightProduct = rightProduct.reversed()

    /// multiple two arrys
    return zip(leftProduct, rightProduct).map { $0.0 * $0.1 }
  }

	func productExceptSelf_concise(_ nums: [Int]) -> [Int] {
		var a = 1
		var results: [Int] = []
		for i in 0..<nums.count {
			results.append(a)
			a *= nums[i]
		}
		
		a = 1
		for i in stride(from: nums.count - 1, to: -1, by: -1) {
			results[i] *= a
			a *= nums[i]
		}
		
		return results
	}

  /// Solution 2:
  /// Reduce the space complexity
  /// One idea is to just compute the result on the fly
  /// scan the element from left to right, but you can keep the two running product, one for the left side, one for the right side
  /// Then you can build the result.
	
	func test() {
		
	}
}
