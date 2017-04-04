//
//  344. Reverse String.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Write a function that takes a string as input and returns the string reversed.
//
//Example:
//Given s = "hello", return "olleh".

import Foundation

class Num344_ReverseString: Solution {
	func reverseString(_ s: String) -> String {
//		return String(s.characters.reversed())
		var s = [Character](s.characters)
		for i in 0..<s.count / 2 {
			(s[i], s[s.count - 1 - i]) = (s[s.count - 1 - i], s[i])
		}
		return String(s)
	}
	
	func test() {
	}
}
