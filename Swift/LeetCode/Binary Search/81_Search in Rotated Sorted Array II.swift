//
//  81. Search in Rotated Sorted Array II.swift
//  https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
//
//  Created by Honghao Zhang on 2016-10-31.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//
//Follow up for "Search in Rotated Sorted Array":
//What if duplicates are allowed?
//
//Would this affect the run-time complexity? How and why?
//
//Write a function to determine if a given target is in the array.

import Foundation

class Num81_SearchinRotatedSortedArrayII: Solution {
  func search(_ nums: [Int], _ target: Int) -> Bool {
    guard nums.count > 0 else { return false }
    
    var left = 0
    var right = nums.count - 1
    
    // Cut trailing, this is because when nums[left] == nums[mid], we can safely
    // move the left pointer
    while left < right && nums[right] == nums[left] && right >= 0 {
      right -= 1
    }
    
    while left + 1 < right {
      let mid = left + (right - left) / 2
      if nums[left] == nums[mid] { // this is true because the trailing is cut.
        left = mid
      }
      else if nums[left] < nums[mid] {
        if nums[left] <= target && target <= nums[mid] {
          right = mid
        } else {
          left = mid
        }
      }
      else {
        if nums[mid] <= target && target <= nums[right] {
          left = mid
        } else {
          right = mid
        }
      }
    }
    
    if nums[left] == target {
      return true
    }
    
    if nums[right] == target {
      return true
    }
    
    return false
  }
  
  func test() {
    
  }
}
