//
//  36. Valid Sudoku.swift
//  https://leetcode.com/problems/valid-sudoku/
//
//  Created by Honghao Zhang on 2016-10-27.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.
//
//The Sudoku board could be partially filled, where empty cells are filled with the character '.'.

import Foundation

class Num36_ValidSudoku: Solution {
  func isValidSudoku(_ board: [[Character]]) -> Bool {
    return checkRow(board) && checkColumn(board) && checkBlock(board)
  }
  
  private func checkRow(_ board: [[Character]]) -> Bool {
    for row in board {
      if haveDuplicates(row.compactMap({ Int(String($0)) })) {
        return false
      }
    }
    
    return true
  }
  
  private func checkColumn(_ board: [[Character]]) -> Bool {
    for j in 0..<9 {
      var col: [Int] = []
      for i in 0..<9 {
        if let num = Int(String(board[i][j])) {
          col.append(num)
        }
      }
      if haveDuplicates(col) {
        return false
      }
    }
    return true
  }
  
  private func checkBlock(_ board: [[Character]]) -> Bool {
    // for each big block
    for i in 0..<3 {
      for j in 0..<3 {
        var nums = [Int]()
        for x in (i * 3)..<(i * 3 + 3) {
          for y in (j * 3)..<(j * 3 + 3) {
            if let num = Int(String(board[x][y])) {
              nums.append(num)
            }
          }
        }
        if haveDuplicates(nums) {
          return false
        }
      }
    }
    return true
  }
  
  private func haveDuplicates(_ nums: [Int]) -> Bool {
    guard nums.count > 0 else { return false }
    var check = Set<Int>()
    for num in nums {
      let (inserted, _) = check.insert(num)
      if inserted == false {
        return true
      }
    }

    return false
  }
  
  func test() {
    
  }
}
