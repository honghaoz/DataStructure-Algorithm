//
//  383. Ransom Note.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-03.
//  Copyright © 2016 Honghaoz. All rights reserved.
//
//
//Given an arbitrary ransom note string and another string containing letters from all the magazines, write a function that will return true if the ransom note can be constructed from the magazines ; otherwise, it will return false.
//
//Each letter in the magazine string can only be used once in your ransom note.
//
//Note:
//You may assume that both strings contain only lowercase letters.
//
//canConstruct("a", "b") -> false
//canConstruct("aa", "ab") -> false
//canConstruct("aa", "aab") -> true

import Foundation

class Num383_RansomNote: Solution {
	func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
		let ransomNote = [Character](ransomNote.characters)
		let magazine = [Character](magazine.characters)
		
		var freq: [Character : Int] = [:]
		for i in 0..<magazine.count {
			if let count = freq[magazine[i]] {
				freq[magazine[i]] = count + 1
			} else {
				freq[magazine[i]] = 1
			}
		}
		
		for i in 0..<ransomNote.count {
			if let count = freq[ransomNote[i]] {
				if count == 0 {
					return false
				}
				freq[ransomNote[i]] = count - 1
			} else {
				return false
			}
		}
		
		return true
	}
	func test() {
		
	}
}

