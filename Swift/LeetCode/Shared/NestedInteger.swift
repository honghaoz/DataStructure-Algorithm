//
//  NestedInteger.swift
//  LeetCode
//
//  Created by Honghao Zhang on 10/22/19.
//  Copyright © 2019 Honghaoz. All rights reserved.
//

import Foundation

protocol NestedInteger {
  // Return true if this NestedInteger holds a single integer, rather than a nested list.
  func isInteger() -> Bool

  // Return the single integer that this NestedInteger holds, if it holds a single integer
  // The result is undefined if this NestedInteger holds a nested list
  func getInteger() -> Int

  // Set this NestedInteger to hold a single integer.
  func setInteger(value: Int)

  // Set this NestedInteger to hold a nested list and adds a nested integer to it.
  func add(elem: NestedInteger)

  // Return the nested list that this NestedInteger holds, if it holds a nested list
  // The result is undefined if this NestedInteger holds a single integer
  func getList() -> [NestedInteger]
}
