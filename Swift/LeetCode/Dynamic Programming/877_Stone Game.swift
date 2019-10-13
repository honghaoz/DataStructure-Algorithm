// 877_Stone Game
// https://leetcode.com/problems/stone-game/
//
// Created by Honghao Zhang on 9/25/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Alex and Lee play a game with piles of stones.  There are an even number of piles arranged in a row, and each pile has a positive integer number of stones piles[i].
//
//The objective of the game is to end with the most stones.  The total number of stones is odd, so there are no ties.
//
//Alex and Lee take turns, with Alex starting first.  Each turn, a player takes the entire pile of stones from either the beginning or the end of the row.  This continues until there are no more piles left, at which point the person with the most stones wins.
//
//Assuming Alex and Lee play optimally, return True if and only if Alex wins the game.
//
//
//
//Example 1:
//
//Input: [5,3,4,5]
//Output: true
//Explanation:
//Alex starts first, and can only take the first 5 or the last 5.
//Say he takes the first 5, so that the row becomes [3, 4, 5].
//If Lee takes 3, then the board is [4, 5], and Alex takes 5 to win with 10 points.
//If Lee takes the last 5, then the board is [3, 4], and Alex takes 4 to win with 9 points.
//This demonstrated that taking the first 5 was a winning move for Alex, so we return true.
//
//
//Note:
//
//2 <= piles.length <= 500
//piles.length is even.
//1 <= piles[i] <= 500
//sum(piles) is odd.
//

import Foundation

class Num877 {
  /// 状态定义是通过两个index，来保存Alex (the first taker) 的最高分
  /// Minmax的关键是定义对手的行为是减分的，这样就可以通过最终分数的正负来判断
  /// Alex是否能赢了。
  ///
  /// Returns true iff first taker wins
  func stoneGame(_ piles: [Int]) -> Bool {
    guard piles.count > 0 else {
      return false
    }
    if piles.count == 1 {
      return true
    }
    if piles.count == 2 {
      return true
    }

    // Scores begins with 0
    // Alex's turn, the score increase with the pile Alex chooses
    // Lee's turn, the score decreases with the pile Lee chooses
    // The goal is to find the max score and check if the score is greater than 0.

    // 1) state
    // s[i][j] represents the max score Alex can get for piles [i...j]
    var s: [[Int]] = Array(repeating: Array(repeating: 0, count: piles.count), count: piles.count)

    // 2) initialize
    // initializes for size == 1
    for i in 0..<piles.count {
      if isAlexTurn(piles.count, 1) {
        s[i][i] = piles[i] // for single pile, the max score is the file number itself
      }
      else {
        s[i][i] = -piles[i]
      }
    }

    // 3) function
    // s[i][j] =
    // if this is Alex's turn: s[i][j] = max(piles[i] + s[i + 1][j], s[i][j - 1] + piles[j])
    // if this is Lee's turn: s[i][j] = min(-piles[i] + s[i + 1][j], s[i][j - 1] - piles[j])
    for size in 2...piles.count { // iterates size from 2 since size 1 is already initialized
      // i is the left index of the piles (inclusive)
      // we want to iterate every possible case for a size
      for i in 0...(piles.count - size) {
        let j = i + size - 1 // j is the right index of the piles (inclusive)
        if isAlexTurn(piles.count, size) {
          s[i][j] = max(piles[i] + s[i + 1][j], s[i][j - 1] + piles[j])
        }
        else {
          s[i][j] = min(-piles[i] + s[i + 1][j], s[i][j - 1] - piles[j])
        }
      }
    }

    // answer
    return s[0][piles.count - 1] > 0
  }

  /// Returns true if this is Alex's turn (Alex starts first)
  private func isAlexTurn(_ initialPilesCount: Int, _ pilesCount: Int) -> Bool {
    if initialPilesCount % 2 == 0 {
      // even
      if pilesCount % 2 == 0 {
        return true
      }
      else {
        return false
      }
    }
    else {
      // odd
      if pilesCount % 2 == 0 {
        return false
      }
      else {
        return true
      }
    }
  }
}
