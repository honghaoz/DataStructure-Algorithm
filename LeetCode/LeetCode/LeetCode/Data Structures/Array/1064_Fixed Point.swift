// 1064_Fixed Point
// https://leetcode.com/problems/fixed-point/
//
// Created by Honghao Zhang on 9/16/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array A of distinct integers sorted in ascending order, return the smallest index i that satisfies A[i] == i.  Return -1 if no such i exists.
//
//
//
//Example 1:
//
//Input: [-10,-5,0,3,7]
//Output: 3
//Explanation:
//For the given array, A[0] = -10, A[1] = -5, A[2] = 0, A[3] = 3, thus the output is 3.
//Example 2:
//
//Input: [0,2,5,8,17]
//Output: 0
//Explanation:
//A[0] = 0, thus the output is 0.
//Example 3:
//
//Input: [-10,-5,3,4,7,9]
//Output: -1
//Explanation:
//There is no such i that A[i] = i, thus the output is -1.
//
//
//Note:
//
//1 <= A.length < 10^4
//-10^9 <= A[i] <= 10^9
//

import Foundation

class Num1064 {
  // Binary search, to find the smallest, move the end if nums[mid] == mid
  func fixedPoint(_ nums: [Int]) -> Int {
    if nums.count == 0 {
      return -1
    }
    if nums.count == 1{
      if nums[0] == 0 {
        return 0
      }
      else {
        return -1
      }
    }
    
    var start = 0
    var end = nums.count - 1
    while start + 1 < end {
      let mid = start + (end - start) / 2
      if nums[mid] < mid {
        start = mid
      }
      else if nums[mid] > mid {
        end = mid
      }
      else {
        // to find the smallest, move the end
        end = mid
      }
    }
    if nums[start] == start {
      return start
    }
    else if nums[end] == end {
      return end
    }
    else {
      return -1
    }
  }
}
