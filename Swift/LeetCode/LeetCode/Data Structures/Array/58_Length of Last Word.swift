//
//  58. Length of Last Word.swift
//  https://leetcode.com/problems/length-of-last-word/
//
//  Created by Honghao Zhang on 2016-11-02.
//  Copyright © 2016 Honghaoz. All rights reserved.
//
// Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
//
//If the last word does not exist, return 0.
//
//Note: A word is defined as a character sequence consists of non-space characters only.
//
//Example:
//
//Input: "Hello World"
//Output: 5

import Foundation

class Num58_LengthOfLastWord: Solution {
	func lengthOfLastWord(_ s: String) -> Int {
		return s.split(separator: " ").last?.count ?? 0
	}
	
	func test() {
		
	}
}
