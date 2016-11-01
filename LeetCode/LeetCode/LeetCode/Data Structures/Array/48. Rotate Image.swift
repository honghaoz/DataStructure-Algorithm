//
//  48. Rotate Image.swift
//  LeetCode
//
//  Created by Honghao Zhang on 2016-10-27.
//  Copyright © 2016 Honghaoz. All rights reserved.
//

//You are given an n x n 2D matrix representing an image.
//
//Rotate the image by 90 degrees (clockwise).
//
//Follow up:
//Could you do this in-place?

import Foundation

class Num48_RotateImage: Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let d = matrix.count
        var rotated: [[Int]] = Array(repeating: Array(repeating: 0, count: d),
                                     count: d)
        for i in 0..<d {
            for j in 0..<d {
                rotated[i][j] = matrix[d - j - 1][i]
            }
        }
        
        matrix = rotated
    }
    
    func rotateInPlace(_ matrix: inout [[Int]]) {
        let d = matrix.count
        for i in 0..<Int(ceil(Double(d / 2))) {
            for j in i..<(d - i - 1) {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[d - j - 1][i]
                matrix[d - j - 1][i] = matrix[d - i - 1][d - j - 1]
                matrix[d - i - 1][d - j - 1] = matrix[j][d - i - 1]
                matrix[j][d - i - 1] = temp
            }
        }
    }
    
    func rotateInPlace2(_ matrix: inout [[Int]]) {
        let d = matrix.count
        for i in 0..<Int(ceil(Double(d / 2))) {
            for j in i..<(d - i - 1) {
                (matrix[i][j], matrix[d - j - 1][i], matrix[d - i - 1][d - j - 1], matrix[j][d - i - 1]) =
                    (matrix[d - j - 1][i], matrix[d - i - 1][d - j - 1], matrix[j][d - i - 1], matrix[i][j])
            }
        }
    }
    
    func test() {
    }
}
