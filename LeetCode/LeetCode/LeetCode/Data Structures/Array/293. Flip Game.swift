//
//  293. Flip Game.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Problem Description:
//
//You are playing the following Flip Game with your friend: Given a string that contains only these two characters: + and -, you and your friend take turns to flip two consecutive "++" into "--". The game ends when a person can no longer make a move and therefore the other person will be the winner.
//
//Write a function to compute all possible states of the string after one valid move.
//
//For example, given s = "++++", after one move, it may become one of the following states:
//
//[
//"--++",
//"+--+",
//"++--"
//]
//
//
//If there is no valid move, return an empty list [].

import Foundation

class Num293_FlipGame: Solution {
	func generatePossibleNextMoves(s: String) -> [String] {
		let chars = [Character](s.characters)
		guard chars.count >= 2 else { return [] }
		var res = [String]()
		
		for i in 0..<chars.count - 1 {
			let next = i + 1
			if chars[i] == chars[next] {
				var nextMove = chars
				flip(&nextMove, i)
				flip(&nextMove, next)
				res.append(String(nextMove))
			}
		}
		
		return res
	}
	
	func flip(_ chars: inout [Character], _ index: Int) {
		guard index < chars.count else { return }
		if chars[index] == "-" {
			chars[index] = "+"
		} else {
			chars[index] = "-"
		}
	}
	
	func test() {
		assert(generatePossibleNextMoves(s: "++++") == [
			"--++", "+--+", "++--"
			]
		)
	}
}

