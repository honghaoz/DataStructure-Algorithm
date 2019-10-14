// 733_Flood Fill
// https://leetcode.com/problems/flood-fill/
//
// Created by Honghao Zhang on 10/13/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
//
//Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
//
//To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
//
//At the end, return the modified image.
//
//Example 1:
//
//Input:
//image = [[1,1,1],[1,1,0],[1,0,1]]
//sr = 1, sc = 1, newColor = 2
//Output: [[2,2,2],[2,2,0],[2,0,1]]
//Explanation:
//From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
//by a path of the same color as the starting pixel are colored with the new color.
//Note the bottom corner is not colored 2, because it is not 4-directionally connected
//to the starting pixel.
//Note:
//
//The length of image and image[0] will be in the range [1, 50].
//The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
//The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
//

// 绘图软件，点到的地方换颜色

import Foundation

class Num733 {
  // 如果颜色不一样的话，换掉当前点的颜色，然后上下左右四个方向都call一遍
  func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    guard image.count > 0 else {
      return image
    }
    guard image[0].count > 0 else {
      return image
    }

    var image = image
    floodFillHelper(&image, sr, sc, newColor)
    return image
  }

  private func floodFillHelper(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) {
    let currentColor = image[sr][sc]
    if currentColor != newColor {
      image[sr][sc] = newColor
      // up
      if sr - 1 >= 0 && image[sr - 1][sc] == currentColor {
        floodFillHelper(&image, sr - 1, sc, newColor)
      }
      // left
      if sc - 1 >= 0 && image[sr][sc - 1] == currentColor {
        floodFillHelper(&image, sr, sc - 1, newColor)
      }
      // bottom
      if sr + 1 < image.count && image[sr + 1][sc] == currentColor {
        floodFillHelper(&image, sr + 1, sc, newColor)
      }
      // right
      if sc + 1 < image[0].count && image[sr][sc + 1] == currentColor {
        floodFillHelper(&image, sr, sc + 1, newColor)
      }
    }
  }
}
