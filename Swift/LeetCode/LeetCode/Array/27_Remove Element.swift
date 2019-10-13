//
//  27. Remove Element.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-24.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an array and a value, remove all instances of that value in place and return the new length.
//
//Do not allocate extra space for another array, you must do this in place with constant memory.
//
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
//Example:
//Given input array nums = [3,2,2,3], val = 3
//
//Your function should return length = 2, with the first two elements of nums being 2.

import Foundation

class Num27_RemoveElement: Solution {
  func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    guard nums.count > 0 else { return 0 }

    var lastNonValueIndex = -1
    for i in 0..<nums.count {
      let num = nums[i]
      if num == val {
        continue
      } else {
        lastNonValueIndex += 1
        nums[lastNonValueIndex] = num
      }
    }

    return lastNonValueIndex + 1
  }

  func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
    var last = -1
    for n in nums {
      if n != val {
        last += 1
        nums[last] = n
      }
    }
    return last + 1
  }

  // The order of elements can be changed. It doesn't matter what you leave beyond the new length.
  // When seeing the val, swap it with the last one and reduce the array
  func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
    var i = 0
    var j = nums.count
    while i < j {
      if nums[i] == val {
        nums[i] = nums[j - 1]
        j -= 1
      } else {
        i += 1
      }
    }
    return j
  }

  func test() {

  }
}
