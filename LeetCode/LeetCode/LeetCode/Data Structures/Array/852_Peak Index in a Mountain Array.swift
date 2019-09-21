// 852_Peak Index in a Mountain Array
// https://leetcode.com/problems/peak-index-in-a-mountain-array/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Let's call an array A a mountain if the following properties hold:
//
//A.length >= 3
//There exists some 0 < i < A.length - 1 such that A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
//Given an array that is definitely a mountain, return any i such that A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1].
//
//Example 1:
//
//Input: [0,1,0]
//Output: 1
//Example 2:
//
//Input: [0,2,1,0]
//Output: 1
//Note:
//
//3 <= A.length <= 10000
//0 <= A[i] <= 10^6
//A is a mountain, as defined above.
//

import Foundation

class Num852 {
  // Use binary search to find the mid, check nums[mid - 1], nums[mid], nums[mid + 1] to determine
  // which one to move
  func peakIndexInMountainArray(_ nums: [Int]) -> Int {
    assert(nums.count >= 3)
    var start = 0
    var end = nums.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] > nums[mid - 1], nums[mid] > nums[mid + 1] {
        return mid
      }
      else if nums[mid - 1] < nums[mid], nums[mid] < nums[mid + 1] {
        start = mid
      }
      else {
        end = mid
      }
    }
    assert(false)
    return -1
  }
}
