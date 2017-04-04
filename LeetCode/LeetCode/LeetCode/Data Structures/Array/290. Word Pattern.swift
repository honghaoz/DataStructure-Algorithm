//
//  290. Word Pattern.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-04.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a pattern and a string str, find if str follows the same pattern.
//
//Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in str.
//
//Examples:
//pattern = "abba", str = "dog cat cat dog" should return true.
//pattern = "abba", str = "dog cat cat fish" should return false.
//pattern = "aaaa", str = "dog cat cat dog" should return false.
//pattern = "abba", str = "dog dog dog dog" should return false.
//Notes:
//You may assume pattern contains only lowercase letters, and str contains lowercase letters separated by a single space.

import Foundation

class Num290_WordPattern: Solution {
	func wordPattern(_ pattern: String, _ str: String) -> Bool {
		let strs = str.characters.split(separator: " ").map { String($0) }
		var dict: [String : String] = [:]
		var lastCharValue = Int(("a" as UnicodeScalar).value) - 1
		
		strs.forEach {
			if dict[$0] == nil {
				let char = String(Character(UnicodeScalar(lastCharValue + 1)!))
				dict[$0] = char
				lastCharValue += 1
			}
		}
		
		let patternOfStr = strs.reduce("") { return $0 + dict[$1]! }
		return pattern == patternOfStr
	}
	
	func test() {
		
	}
}
