// 305_Number of Islands II
// https://leetcode.com/problems/number-of-islands-ii
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// A 2d grid map of m rows and n columns is initially filled with water. We may perform an addLand operation which turns the water at position (row, col) into a land. Given a list of positions to operate, count the number of islands after each addLand operation. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//Example:
//
//Input: m = 3, n = 3, positions = [[0,0], [0,1], [1,2], [2,1]]
//Output: [1,1,2,3]
//Explanation:
//
//Initially, the 2d grid grid is filled with water. (Assume 0 represents water and 1 represents land).
//
//0 0 0
//0 0 0
//0 0 0
//Operation #1: addLand(0, 0) turns the water at grid[0][0] into a land.
//
//1 0 0
//0 0 0   Number of islands = 1
//0 0 0
//Operation #2: addLand(0, 1) turns the water at grid[0][1] into a land.
//
//1 1 0
//0 0 0   Number of islands = 1
//0 0 0
//Operation #3: addLand(1, 2) turns the water at grid[1][2] into a land.
//
//1 1 0
//0 0 1   Number of islands = 2
//0 0 0
//Operation #4: addLand(2, 1) turns the water at grid[2][1] into a land.
//
//1 1 0
//0 0 1   Number of islands = 3
//0 1 0
//Follow up:
//
//Can you do it in time complexity O(k log mn), where k is the length of the positions?
//

// 还是求island的个数，不过这次是造岛渐进的过程
// 要求造岛的过程中实时返回岛的个数

import Foundation

class Num305 {
  // TODO:
  // MARK: - 用Dictionary
  // 保存坐标到island_id的一个dict，当新建一个岛的时候
  // 检查相邻的坐标有没有existing island。如果有，那么就link这个坐标到这个island
  // 特殊情况，如果相邻的坐标对应这不同的island，说明这个点连接了两个或多个island
  // 需要更新dict
  // 如果没有，说明这是一个新的island
  func solution() -> Bool {
    return true
  }

  // MARK: - Union-Find
  // 用一个UnionFind动态构造island的count
}
