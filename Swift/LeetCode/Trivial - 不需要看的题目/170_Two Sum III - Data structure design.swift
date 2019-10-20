// 170_Two Sum III - Data structure design
// https://leetcode.com/problems/two-sum-iii-data-structure-design/
//
// Created by Honghao Zhang on 10/18/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design and implement a TwoSum class. It should support the following operations: add and find.
//
//add - Add the number to an internal data structure.
//find - Find if there exists any pair of numbers which sum is equal to the value.
//
//Example 1:
//
//add(1); add(3); add(5);
//find(4) -> true
//find(7) -> false
//Example 2:
//
//add(3); add(1); add(2);
//find(3) -> true
//find(6) -> false
//

import Foundation

class Num170 {
  class TwoSum {

    private var numbers: [Int] = []

    /** Initialize your data structure here. */
    init() {

    }

    /** Add the number to an internal data structure.. */
    func add(_ number: Int) {
      numbers.append(number)
    }

    /** Find if there exists any pair of numbers which sum is equal to the value. */
    func find(_ value: Int) -> Bool {
      var numToIndex: [Int : Int] = [:]
      for i in 0..<numbers.count {
        let numToFind = value - numbers[i]
        if let _ = numToIndex[numToFind] {
          return true
        } else {
          numToIndex[numbers[i]] = i
        }
      }
      return false
    }
  }

  /**
   * Your TwoSum object will be instantiated and called as such:
   * let obj = TwoSum()
   * obj.add(number)
   * let ret_2: Bool = obj.find(value)
   */
}
