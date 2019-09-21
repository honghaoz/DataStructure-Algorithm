//
//  80. Remove Duplicates from Sorted Array II.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-20.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

//Follow up for "Remove Duplicates":
//What if duplicates are allowed at most twice?
//
//For example,
//Given sorted array nums = [1,1,1,2,2,3],
//
//Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.

class Num80_RemoveDuplicatesFromSortedArrayII: Solution {
  func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 2 else {
      return nums.count
    }

    var lastIndex1: Int = 0
    var lastIndex2: Int = 1

    for i in 2 ..< nums.count {
      let num = nums[i]
      if num != nums[lastIndex2] || (num == nums[lastIndex2] && num != nums[lastIndex1]) {
        lastIndex1 += 1
        lastIndex2 += 1
        nums[lastIndex2] = num
        continue
      }
    }

    return lastIndex2 + 1
  }

  func removeDuplicates2(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    if nums.count == 1 {
      return 1
    }
    var last = 1
    for i in 2..<nums.count {
      let n = nums[i]
      if n != nums[last] {
        last += 1
        nums[last] = n
      } else if nums[last - 1] != nums[last] {
        last += 1
        nums[last] = n
      }
    }
    return last + 1
  }

  func test() {
    // [] -> []
    var nums: [Int] = []
    var expected: [Int] = []
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1] -> [1]
    nums = [1]
    expected = [1]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1] -> [1, 1]
    nums = [1, 1]
    expected = [1, 1]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 2] -> [1, 2]
    nums = [1, 2]
    expected = [1, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1, 1] -> [1, 1]
    nums = [1, 1, 1]
    expected = [1, 1]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1, 2] -> [1, 1, 2]
    nums = [1, 1, 2]
    expected = [1, 1, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 2, 2] -> [1, 2, 2]
    nums = [1, 2, 2]
    expected = [1, 2, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1, 1, 1] -> [1, 1]
    nums = [1, 1, 1, 1]
    expected = [1, 1]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1, 1, 2] -> [1, 1, 2]
    nums = [1, 1, 1, 2]
    expected = [1, 1, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 1, 2, 2] -> [1, 1, 2, 2]
    nums = [1, 1, 2, 2]
    expected = [1, 1, 2, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))

    // [1, 2, 2, 2] -> [1, 2, 2]
    nums = [1, 2, 2, 2]
    expected = [1, 2, 2]
    assert(removeDuplicates(&nums) == expected.count)
    assert(checkEqual(nums1: nums, nums2: expected, firstCount: expected.count))
  }

  func checkEqual(nums1: [Int], nums2: [Int], firstCount: Int) -> Bool {
    guard nums1.count >= firstCount && nums2.count >= firstCount else { return false }
    for i in 0..<firstCount {
      if nums1[i] != nums2[i] {
        return false
      }
    }

    return true
  }
}
