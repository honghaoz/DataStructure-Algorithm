// 200_Number of Islands
// https://leetcode.com/problems/number-of-islands/
//
// Created by Honghao Zhang on 10/23/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
//
//Example 1:
//
//Input:
//11110
//11010
//11000
//00000
//
//Output: 1
//Example 2:
//
//Input:
//11000
//11000
//00100
//00011
//
//Output: 3
//

// 1 代表island，0 代表water
// 求岛的个数

import Foundation

class Num200 {
  // TODO:
  // MARK: - DFS, needs to mark the 1 to 0
  // 找到一个1，计数增加1。然后扩散把相邻的1都标记为0
  func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    var count = 0
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == "1" {
          count += 1
          markIsland(&grid, at: [i, j])
        }
      }
    }
    return count
  }

  private func markIsland(_ grid: inout [[Character]], at coordinate: [Int]) {
    let x = coordinate[0]
    let y = coordinate[1]
    guard grid[x][y] == "1" else {
      return
    }
    grid[x][y] = Character("0")

    // up
    if x - 1 >= 0 {
      markIsland(&grid, at: [x - 1, y])
    }
    // left
    if y - 1 >= 0 {
      markIsland(&grid, at: [x, y - 1])
    }
    // bottom
    if x + 1 < grid.count {
      markIsland(&grid, at: [x + 1, y])
    }
    // right
    if y + 1 < grid[0].count {
      markIsland(&grid, at: [x, y + 1])
    }
  }

  // MARK: - BFS, use a queue, also needs to mark the 1 to 0

  // MARK: - Union-Find
  // Union Find 支持find和union
  //   - Find返回的是这个node的root parent的id
  //   - Union是连接两个点，每个点有个rank。选择小的rank的那个点来作为新的parent
  // 把每个1的node都设置为独立的点，count是1的个数
  // 然后把1-1的edge都连起来，每连一个，count - 1
  // 那么当全部连完的时候，count就是独立component的个数

  //  class Solution {
  //    class UnionFind {
  //      int count; // # of connected components
  //      int[] parent;
  //      int[] rank;
  //
  //      public UnionFind(char[][] grid) { // for problem 200
  //        count = 0;
  //        int m = grid.length;
  //        int n = grid[0].length;
  //        parent = new int[m * n];
  //        rank = new int[m * n];
  //        for (int i = 0; i < m; ++i) {
  //          for (int j = 0; j < n; ++j) {
  //            if (grid[i][j] == '1') {
  //              parent[i * n + j] = i * n + j;
  //              ++count;
  //            }
  //            rank[i * n + j] = 0;
  //          }
  //        }
  //      }
  //
  //      public int find(int i) { // path compression
  //        if (parent[i] != i) parent[i] = find(parent[i]);
  //        return parent[i];
  //      }
  //
  //      public void union(int x, int y) { // union with rank
  //        int rootx = find(x);
  //        int rooty = find(y);
  //        if (rootx != rooty) {
  //          if (rank[rootx] > rank[rooty]) {
  //            parent[rooty] = rootx;
  //          } else if (rank[rootx] < rank[rooty]) {
  //            parent[rootx] = rooty;
  //          } else {
  //            parent[rooty] = rootx; rank[rootx] += 1;
  //          }
  //          --count;
  //        }
  //      }
  //
  //      public int getCount() {
  //        return count;
  //      }
  //    }
  //
  //    public int numIslands(char[][] grid) {
  //      if (grid == null || grid.length == 0) {
  //        return 0;
  //      }
  //
  //      int nr = grid.length;
  //      int nc = grid[0].length;
  //      int num_islands = 0;
  //      UnionFind uf = new UnionFind(grid);
  //      for (int r = 0; r < nr; ++r) {
  //        for (int c = 0; c < nc; ++c) {
  //          if (grid[r][c] == '1') {
  //            grid[r][c] = '0';
  //            if (r - 1 >= 0 && grid[r-1][c] == '1') {
  //              uf.union(r * nc + c, (r-1) * nc + c);
  //            }
  //            if (r + 1 < nr && grid[r+1][c] == '1') {
  //              uf.union(r * nc + c, (r+1) * nc + c);
  //            }
  //            if (c - 1 >= 0 && grid[r][c-1] == '1') {
  //              uf.union(r * nc + c, r * nc + c - 1);
  //            }
  //            if (c + 1 < nc && grid[r][c+1] == '1') {
  //              uf.union(r * nc + c, r * nc + c + 1);
  //            }
  //          }
  //        }
  //      }
  //
  //      return uf.getCount();
  //    }
  //  }
}
