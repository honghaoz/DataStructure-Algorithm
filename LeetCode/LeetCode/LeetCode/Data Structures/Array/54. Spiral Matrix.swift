//
//  54. Spiral Matrix.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-30.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
//
//For example,
//Given the following matrix:
//
//[
//[ 1, 2, 3 ],
//[ 4, 5, 6 ],
//[ 7, 8, 9 ]
//]
//You should return [1,2,3,6,9,8,7,4,5].

import Foundation

class Num54_SpiralMatrix: Solution {
	func spiralOrder(_ matrix: [[Int]]) -> [Int] {
		var results = [Int]()
		
		let m = matrix.count
		guard m > 0 else { return results }
		let n = matrix[0].count
		guard n > 0 else { return results }
		
		var checked: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
		
		var direction: Int = 1
		var i = 0
		var j = 0
		while true {
			if checked[i][j] == false {
				results.append(matrix[i][j])
				checked[i][j] = true
			} else {
				break
			}
			
			switch direction {
			case 1:
				if j + 1 >= n || checked[i][j + 1] == true {
					direction = 2
					i += 1
					if i >= m {
						return results
					}
				} else {
					j += 1
				}
				
			case 2:
				if i + 1 >= m || checked[i + 1][j] == true {
					direction = 3
					j -= 1
					if j < 0 {
						return results
					}
				} else {
					i += 1
				}
				
			case 3:
				if j - 1 < 0 || checked[i][j - 1] == true {
					direction = 4
					i -= 1
					if i < 0 {
						return results
					}
				} else {
					j -= 1
				}
				
			case 4:
				if i - 1 < 0 || checked[i - 1][j] == true {
					direction = 1
					j += 1
					if j >= n {
						return results
					}
				} else {
					i -= 1
				}
				
			default:
				break;
			}
		}
		
		return results
	}
	
	func test() {
		
	}
}
