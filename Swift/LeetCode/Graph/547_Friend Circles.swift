// 547_Friend Circles
// https://leetcode.com/problems/friend-circles/
//
// Created by Honghao Zhang on 10/29/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// There are N students in a class. Some of them are friends, while some are not. Their friendship is transitive in nature. For example, if A is a direct friend of B, and B is a direct friend of C, then A is an indirect friend of C. And we defined a friend circle is a group of students who are direct or indirect friends.
//
//Given a N*N matrix M representing the friend relationship between students in the class. If M[i][j] = 1, then the ith and jth students are direct friends with each other, otherwise not. And you have to output the total number of friend circles among all the students.
//
//Example 1:
//
//Input:
//[[1,1,0],
// [1,1,0],
// [0,0,1]]
//Output: 2
//Explanation:The 0th and 1st students are direct friends, so they are in a friend circle.
//The 2nd student himself is in a friend circle. So return 2.
//Example 2:
//
//Input:
//[[1,1,0],
// [1,1,1],
// [0,1,1]]
//Output: 1
//Explanation:The 0th and 1st students are direct friends, the 1st and 2nd students are direct friends,
//so the 0th and 2nd students are indirect friends. All of them are in the same friend circle, so return 1.
//Note:
//
//N is in range [1,200].
//M[i][i] = 1 for all students.
//If M[i][j] = 1, then M[j][i] = 1.
//

import Foundation

class Num547 {
  // MARK: - DFS
  func findCircleNum_DFS(_ M: [[Int]]) -> Int {
    let n = M.count
    guard n > 0 else {
      return 0
    }
    // should be same size
    guard n == M[0].count else {
      return 0
    }

    // we have n student, visited[0] represents the index 0 student is checked
    var visited: [Bool] = Array(repeating: false, count: n)

    var count = 0
    for i in 0..<n {
      if visited[i] == false {
        mark(M, &visited, i)
        count += 1
      }
    }
    return count
  }

  /// Mark for the student with the index and DFS mark his friends
  private func mark(_ M: [[Int]], _ visited: inout [Bool], _ studentIndex: Int) {
    if visited[studentIndex] {
      return
    }

    visited[studentIndex] = true
    for j in 0..<M.count {
      if M[studentIndex][j] == 1 {
        // j is a friend of the studentIndex, let's mark j's friends
        mark(M, &visited, j)
      }
    }
  }

  // MARK: - Build connection list and use Set for groups
  func findCircleNum(_ M: [[Int]]) -> Int {
    let n = M.count
    guard n > 0 else {
      return 0
    }
    // should be same size
    guard n == M[0].count else {
      return 0
    }

    // build connection list
    var connections: [[Int]] = []
    for i in 0..<n {
      for j in i..<n { // because the M matrix is symmetric
        if M[i][j] == 1 {
          connections.append([i, j])
        }
      }
    }

    return circleCount(connections)
  }

  /// Find the group count for a list of connections
  /// connections for in form like [
  ///   [1, 2],
  ///   [2, 3], // group 1
  ///   [4, 5], // group 2
  /// ]
  ///
  /// Check left and right node against sets
  /// Update sets accordingly

  //  private func circleCount(_ connections: [[Int]]) -> Int {
  //    var setGroup: [Set<Int>] = [] // how many groups
  //    for c in connections { // O(number of connections)
  //      let left = c[0]
  //      let right = c[1]
  //
  //      var leftIndex: Int?
  //      var leftBelongingSet: Set<Int>? = nil
  //      var rightIndex: Int?
  //      var rightBelongingSet: Set<Int>? = nil
  //      for (i, s) in setGroup.enumerated() { // O(how many connections)
  //        if s.contains(left) {
  //          leftIndex = i
  //          leftBelongingSet = s
  //        }
  //        if s.contains(right) {
  //          rightIndex = i
  //          rightBelongingSet = s
  //        }
  //      }
  //
  //      if leftBelongingSet == nil, rightBelongingSet == nil {
  //        let newSet = Set<Int>([left, right])
  //        setGroup.append(newSet)
  //      }
  //      else if var leftSet = leftBelongingSet, rightBelongingSet == nil {
  //        setGroup.remove(at: leftIndex!)
  //        leftSet.insert(right)
  //        setGroup.append(leftSet)
  //      }
  //      else if var rightSet = rightBelongingSet, leftBelongingSet == nil {
  //        setGroup.remove(at: rightIndex!)
  //        rightSet.insert(left)
  //        setGroup.append(rightSet)
  //      }
  //      else if let leftSet = leftBelongingSet, let rightSet = rightBelongingSet {
  //        // if same: both are in the set, no-op
  //        // if not same
  //        if leftIndex! != rightIndex! {
  //          setGroup.remove(at: max(leftIndex!, rightIndex!))
  //          setGroup.remove(at: min(leftIndex!, rightIndex!))
  //
  //          let newSet = Set<Int>(Array(leftSet) + Array(rightSet))
  //          setGroup.append(newSet)
  //        }
  //      }
  //    }
  //    return setGroup.count
  //  }

  private func circleCount(_ connections: [[Int]]) -> Int {
    var setGroup: [Set<Int>] = [] // how many groups
    for c in connections { // O(number of connections)
      let left = c[0]
      let right = c[1]

      var leftIndex: Int? // left belonging set index
      var rightIndex: Int? // right belonging set index
      for (i, s) in setGroup.enumerated() { // O(how many connections)
        if s.contains(left) {
          leftIndex = i
        }
        if s.contains(right) {
          rightIndex = i
        }
      }

      if leftIndex == nil, rightIndex == nil {
        let newSet = Set<Int>([left, right])
        setGroup.append(newSet)
      }
      else if let leftIndex = leftIndex, rightIndex == nil {
        setGroup[leftIndex].insert(right)
      }
      else if let rightIndex = rightIndex, leftIndex == nil {
        setGroup[rightIndex].insert(left)
      }
      else if let leftIndex = leftIndex, let rightIndex = rightIndex {
        // if same: both are in the set, no-op
        // if not same
        if leftIndex != rightIndex {
          let leftSet = setGroup[leftIndex]
          let rightSet = setGroup[rightIndex]
          setGroup.remove(at: max(leftIndex, rightIndex))
          setGroup.remove(at: min(leftIndex, rightIndex))

          let newSet = Set<Int>(Array(leftSet) + Array(rightSet))
          setGroup.append(newSet)
        }
      }
    }
    return setGroup.count
  }
}
