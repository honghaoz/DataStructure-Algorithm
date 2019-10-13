// 1025_Divisor Game
// https://leetcode.com/problems/divisor-game/
//
// Created by Honghao Zhang on 9/21/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Alice and Bob take turns playing a game, with Alice starting first.
//
//Initially, there is a number N on the chalkboard.  On each player's turn, that player makes a move consisting of:
//
//Choosing any x with 0 < x < N and N % x == 0.
//Replacing the number N on the chalkboard with N - x.
//Also, if a player cannot make a move, they lose the game.
//
//Return True if and only if Alice wins the game, assuming both players play optimally.
//
//
//
//Example 1:
//
//Input: 2
//Output: true
//Explanation: Alice chooses 1, and Bob has no more moves.
//Example 2:
//
//Input: 3
//Output: false
//Explanation: Alice chooses 1, Bob chooses 1, and Alice has no more moves.
//
//
//Note:
//
//1 <= N <= 1000
//

import Foundation

class Num1025 {
  class Solution {

    var cache: [Int: Bool] = [:]

    // return True iff the the first player wins
      func divisorGame(_ N: Int) -> Bool {
        if N == 1 {
          return false
        }
        if N == 2 {
          return true
        }
        if let result = cache[N] {
          return result
        }

          for x in 1..<N {
            if N % x == 0 {
              // if bob always fails, we found a way to always win
              // return true
              if !divisorGame(N - x) {
                cache[N] = true
                return true
              }
            }
          }
        // if there's no way to guarantee I win, return false
        cache[N] = false
        return false
      }
  }
}
