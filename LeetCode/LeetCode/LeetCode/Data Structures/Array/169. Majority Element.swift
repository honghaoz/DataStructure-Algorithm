//
//  169. Majority Element.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-17.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

import Foundation

// https://leetcode.com/problems/majority-element/

// Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

// You may assume that the array is non-empty and the majority element always exist in the array.

class Num169_MajorityElement: Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var numCount: [Int : Int] = [:]
        nums.forEach {
            if let count = numCount[$0] {
                numCount[$0] = count + 1
            } else {
                numCount[$0] = 1
            }
        }
        
        return numCount.filter {
            return $0.value > nums.count / 2
        }.first!.key
    }
    
    func test() {
        // [1] -> 1
        assert(majorityElement([1]) == 1)
        
        // 2 / 2 = 1
        // [1, 1] -> 1
        assert(majorityElement([1, 1]) == 1)
        
        // 3 / 2 = 1.5 = 1
        // [1, 1, 2] -> 1
        // [1, 1, 1] -> 1
        assert(majorityElement([1, 1, 2]) == 1)
        assert(majorityElement([1, 1, 1]) == 1)
        
        // 4/ 2 = 2
        // [1, 1, 1, 2] -> 1
        assert(majorityElement([1, 1, 1, 2]) == 1)
    }
}

// Discussion
// https://discuss.leetcode.com/topic/17446/6-suggested-solutions-in-c-with-explanations
