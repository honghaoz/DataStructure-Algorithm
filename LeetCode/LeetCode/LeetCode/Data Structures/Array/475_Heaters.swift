// 475_Heaters
// https://leetcode.com/problems/heaters/
//
// Created by Honghao Zhang on 9/4/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Winter is coming! Your first job during the contest is to design a standard heater with fixed warm radius to warm all the houses.
//
//Now, you are given positions of houses and heaters on a horizontal line, find out minimum radius of heaters so that all houses could be covered by those heaters.
//
//So, your input will be the positions of houses and heaters seperately, and your expected output will be the minimum radius standard of heaters.
//
//Note:
//
//Numbers of houses and heaters you are given are non-negative and will not exceed 25000.
//Positions of houses and heaters you are given are non-negative and will not exceed 10^9.
//As long as a house is in the heaters' warm radius range, it can be warmed.
//All the heaters follow your radius standard and the warm radius will the same.
//
//
//Example 1:
//
//Input: [1,2,3],[2]
//Output: 1
//Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
//
//
//Example 2:
//
//Input: [1,2,3,4],[1,4]
//Output: 1
//Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
//

import Foundation

class Num475 {
  // TODO:
//  func findRadisu_binary_search()
  
  // Sorted, sliding window
  func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
      guard houses.count > 0, heaters.count > 0 else { return 0 }
      let houses = houses.sorted()
      let heaters = heaters.sorted()

      var i = 0 // house index
      var j = 0 // header window left index
                // j + 1 is the window right index
      var radius = 0
      while i < houses.count, j + 1 < heaters.count {
          let house = houses[i] // house number
          let leftHeater = heaters[j]
          let rightHeater = heaters[j + 1]
          if house <= leftHeater {
              // house to the leftHeater
              radius = max(leftHeater - house, radius)
              i += 1
          }
          else if leftHeater < house, house < rightHeater {
              let minRadius = min(house - leftHeater, rightHeater - house)
              radius = max(minRadius, radius)
              i += 1
          }
          else if house >= rightHeater {
              j += 1 // move window
          }
      }

      // case1: i == houses.count
      // house is already covered

      // case2: window exceeds
      if j + 1 == heaters.count {
          // check max radius for rest houses
          while i < houses.count {
              let house = houses[i]
              let leftHeater = heaters[j]
              radius = max(abs(house - leftHeater), radius)
              i += 1
          }
      }
      return radius
  }
}
