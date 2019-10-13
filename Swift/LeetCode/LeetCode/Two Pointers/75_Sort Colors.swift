// 75_Sort Colors
// https://leetcode.com/problems/sort-colors/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
//
//Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
//
//Note: You are not suppose to use the library's sort function for this problem.
//
//Example:
//
//Input: [2,0,2,1,1,0]
//Output: [0,0,1,1,2,2]
//Follow up:
//
//A rather straight forward solution is a two-pass algorithm using counting sort.
//First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
//Could you come up with a one-pass algorithm using only constant space?
//

import Foundation

class Num75 {
  // Three partition, use p and q to divide into three parts
  // Use running i to check each number and move it into the correct part
  func sortColors(_ nums: inout [Int]) {
    guard nums.count > 0 else {
      return
    }
    //      p q
    // [0,0,1,1,2,2]
    //      i
    var p = 0 // nums[<p] is 0
    var q = nums.count - 1 // nums[>q] is 2
    var i = 0 // the running index
    while i <= q  {
      if nums[i] == 0 {
        // swap and move p
        (nums[p], nums[i]) = (nums[i], nums[p])
        p += 1
        i += 1 // since i could == q, needs to move i
      }
      else if nums[i] == 1 {
        // this is the middle partition, no need to swap, just skip
        i += 1
      }
      else {
        // swap and move q
        (nums[q], nums[i]) = (nums[i], nums[q])
        q -= 1
        // shouldn't move i, sine you don't know if nums[i] is 0 or 1
        // if it's 1, you should check again
      }
    }
  }
}
