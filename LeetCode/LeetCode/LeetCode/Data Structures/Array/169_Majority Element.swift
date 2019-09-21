// 169. Majority Element
// https://leetcode.com/problems/majority-element/
// 
// Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
//
// You may assume that the array is non-empty and the majority element always exist in the array.
//
// Example 1:
//
//   Input: [3,2,3]
//   Output: 3
//
// Example 2:
//
//   Input: [2,2,1,1,1,2,2]
//   Output: 2

import Foundation

class Num169_MajorityElement: Solution {
    /// Use dictionary to count the frequency.
    func dictionary1(_ nums: [Int]) -> Int {
        // Normal way to build the dictionary.
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

    /// Use dictionary to count the frequency.
    func dictionary2(_ nums: [Int]) -> Int {
        let mappedNums = nums.map { ($0, 1) }
        // Short version:
        let numberCountDict = Dictionary(mappedNums, uniquingKeysWith: +)
        // Long version:
        // let numberCountDict = Dictionary(mappedNums, uniquingKeysWith: { firstValue, secondValue in
        //     return firstValue + secondValue
        // })
        return numberCountDict.filter { key, value in
          return value > nums.count / 2
        }.first!.key
    }

    /// Sorting the numbers, just return the number at index [count / 2].
    func sorting(_ nums: [Int]) -> Int {
        return nums.sorted()[nums.count / 2]
    }

    /// 💯
    /// Choose candidate when count is 0. +1, if same, -1 if not.
    func boyer_moore_voting(_ nums: [Int]) -> Int {
        var candidate: Int?
        var count = 0
        for i in 0..<nums.count {
            if count == 0 {
                candidate = nums[i]
            }
            if nums[i] == candidate {
                count += 1
            } else {
                count -= 1
            }
        }
        return candidate!
    }
    
    func test() {
        // [1] -> 1
        assert(dictionary1([1]) == 1)
        
        // 2 / 2 = 1
        // [1, 1] -> 1
        assert(dictionary1([1, 1]) == 1)
        
        // 3 / 2 = 1.5 = 1
        // [1, 1, 2] -> 1
        // [1, 1, 1] -> 1
        assert(dictionary1([1, 1, 2]) == 1)
        assert(dictionary1([1, 1, 1]) == 1)
        
        // 4/ 2 = 2
        // [1, 1, 1, 2] -> 1
        assert(dictionary1([1, 1, 1, 2]) == 1)

        assert(boyer_moore_voting([3, 3, 4]) == 3)
    }
}

// Discussion
// https://discuss.leetcode.com/topic/17446/6-suggested-solutions-in-c-with-explanations
