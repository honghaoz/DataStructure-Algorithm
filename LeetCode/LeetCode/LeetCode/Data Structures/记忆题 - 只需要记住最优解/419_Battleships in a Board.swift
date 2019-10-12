// 419_Battleships in a Board
// https://leetcode.com/problems/battleships-in-a-board/
//
// Created by HongHao Zhang on 10/11/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an 2D board, count how many battleships are in it. The battleships are represented with 'X's, empty slots are represented with '.'s. You may assume the following rules:
//You receive a valid board, made of only battleships or empty slots.
//Battleships can only be placed horizontally or vertically. In other words, they can only be made of the shape 1xN (1 row, N columns) or Nx1 (N rows, 1 column), where N can be of any size.
//At least one horizontal or vertical cell separates between two battleships - there are no adjacent battleships.
//Example:
//
//X..X
//...X
//...X
//In the above board there are 2 battleships.
//Invalid Example:
//
//...X
//XXXX
//...X
//This is an invalid board that you will not receive - as battleships will always have a cell separating between them.
//Follow up:
//Could you do it in one-pass, using only O(1) extra memory and without modifying the value of the board?
//

// 求battleship board中的ship的个数

import Foundation

class Num419 {
  // solution1:
  // iterate all locations
  // if found a ship, expand it and remove it (there's modification)
  // then continue, untile there's no ships left
  //
  // solution2: 最优解
  // one pass and O(1) space
  // count verticall and horizontally start from the top left corner
  // if found X, check the vertical previous one and the horizontal previous one
  // if both directions' previous one is out of board or empty, then we know there's a new ship
  // if previous is X, this means this is already counted, can skip.
  func countBattleships(_ board: [[Character]]) -> Int {
    guard board.count > 0 else {
      return 0
    }
    guard board[0].count > 0 else {
      return 0
    }
    
    var count = 0
    for i in 0..<board.count {
      for j in 0..<board[0].count {
        if board[i][j] == "X" {
          // check vertically and horizontally
          if (j - 1 < 0 || board[i][j - 1] == ".") &&
            (i - 1 < 0 || board[i - 1][j] == ".") {
            count += 1
          }
        }
      }
    }
    return count
  }
}
