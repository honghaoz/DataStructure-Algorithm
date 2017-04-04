//
//  38. Count and Say.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//The count-and-say sequence is the sequence of integers beginning as follows:
//1, 11, 21, 1211, 111221, ...
//
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//Given an integer n, generate the nth sequence.
//
//Note: The sequence of integers will be represented as a string.

import Foundation

class Num38_CountAndSay: Solution {
	func countAndSay(_ n: Int) -> String {
		var res = ""
		guard n > 0 else { return res }
		
		res = "1"
		for _ in 1..<n {
			let resChars = [Character](res.characters)
			var nextString = ""
			var lastChar = resChars[0]
			var count = 1
			var j = 1
			while j < resChars.count {
				if resChars[j] == lastChar {
					count += 1
				} else {
					nextString += "\(count)\(lastChar)"
					count = 1
				}
				
				lastChar = resChars[j]
				j += 1
			}
			nextString += "\(count)\(lastChar)"
			res = nextString
		}
		
		return res
	}
	
	func test() {
		assert(countAndSay(6) == "312211")
	}
}
