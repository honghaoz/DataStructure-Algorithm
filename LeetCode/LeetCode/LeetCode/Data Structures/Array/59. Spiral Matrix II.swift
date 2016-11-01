//
//  59. Spiral Matrix II.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-30.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
//
//For example,
//Given n = 3,
//
//You should return the following matrix:
//[
//[ 1, 2, 3 ],
//[ 8, 9, 4 ],
//[ 7, 6, 5 ]
//]

import Foundation

class Num59_SpiralMatrixII: Solution {
	func generateMatrix(_ n: Int) -> [[Int]] {
		var results: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
		guard n > 0 else { return results }
		
		var index = 1
		
		for loop in 0..<Int(ceil(Double(n) / 2)) {
			var i = loop
			var j = loop
			for j in (0 + loop)..<(n - loop) {
				results[i][j] = index
				index += 1
			}
			
			j = n - 1 - loop
			for i in (1 + loop)..<(n - loop) {
				results[i][j] = index
				index += 1
			}
			
			i = n - 1 - loop
			for j in stride(from: n - 2 - loop, to: loop - 1, by: -1) {
				results[i][j] = index
				index += 1
			}
			
			j = loop
			for i in stride(from: n - 2 - loop, to: loop, by: -1) {
				results[i][j] = index
				index += 1
			}
		}
		
		return results
	}
	
	func test() {
	}
}
