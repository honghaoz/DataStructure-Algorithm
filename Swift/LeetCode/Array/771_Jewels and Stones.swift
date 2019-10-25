// 771_Jewels and Stones
// https://leetcode.com/problems/jewels-and-stones/
//
// Created by Honghao Zhang on 9/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

//The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
//
//Example 1:
//
//Input: J = "aA", S = "aAAbbbb"
//Output: 3
//Example 2:
//
//Input: J = "z", S = "ZZ"
//Output: 0
//Note:
//
//S and J will consist of letters and have length at most 50.
//The characters in J are distinct.
//

// 告诉你那种char是珠宝，然后给你一堆石头
// 求出这些石头中有多少个是珠宝

import Foundation

class Num771 {
  func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var count = 0
    for c in S {
      if J.contains(c) {
        count += 1
      }
    }
    return count
  }
}
