//
//  20. Valid Parentheses.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-11-06.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.

import Foundation

class Stack<T> {
	var stack: [T] = []
	init () {
		
	}
	
	func push(_ value: T) {
		stack.append(value)
	}
	
	func pop() -> T? {
		return stack.popLast()
	}
	
	func size() -> Int {
		return stack.count
	}
}

class Num20_ValidParentheses: Solution {
	func isValid(_ s: String) -> Bool {
		let s = [Character](s.characters)
		guard s.count > 0 else { return true }
		
		let stack = Stack<Character>()
		for char in s {
			switch char {
			case "(", "{", "[":
				stack.push(char)
			case ")":
				if stack.pop() != "(" {
					return false
				}
			case "}":
				if stack.pop() != "{" {
					return false
				}
			case "]":
				if stack.pop() != "[" {
					return false
				}
			default: continue
			}
		}
		return true
	}
	
	func test() {
	}
	
	class Solution {
		func maximalSquare(_ matrix: [[Character]]) -> Int {
			let m = matrix.count
			guard m > 0 else { return 0 }
			let n = matrix[0].count
			guard n > 0 else { return 0 }
			
			var s = Array(repeating: Array(repeating: 0, count: n), count: m)
			var maxSize = 0
			
			for i in 0..<m {
				for j in 0..<n {
					// For edge
					if i == 0 || j == 0 {
						s[i][j] = matrix[i][j] == "0" ? 0 : 1
						maxSize = max(maxSize, s[i][j])
						continue
					}
					
					if matrix[i][j] == "0" {
						continue
					}
					else {
						s[i][j] = min(s[i - 1][j - 1], s[i][j - 1], s[i - 1][j]) + 1
						maxSize = max(maxSize, s[i][j])
					}
				}
			}
			
			return maxSize * maxSize
		}
	}
}
