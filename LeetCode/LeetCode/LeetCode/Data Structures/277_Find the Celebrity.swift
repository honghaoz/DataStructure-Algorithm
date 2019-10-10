// 277_Find the Celebrity
// https://leetcode.com/problems/find-the-celebrity/
//
// Created by HongHao Zhang on 10/10/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Suppose you are at a party with n people (labeled from 0 to n - 1) and among them, there may exist one celebrity. The definition of a celebrity is that all the other n - 1 people know him/her but he/she does not know any of them.
//
//Now you want to find out who the celebrity is or verify that there is not one. The only thing you are allowed to do is to ask questions like: "Hi, A. Do you know B?" to get information of whether A knows B. You need to find out the celebrity (or verify there is not one) by asking as few questions as possible (in the asymptotic sense).
//
//You are given a helper function bool knows(a, b) which tells you whether A knows B. Implement a function int findCelebrity(n). There will be exactly one celebrity if he/she is in the party. Return the celebrity's label if there is a celebrity in the party. If there is no celebrity, return -1.
//
//
//
//Example 1:
//
//
//Input: graph = [
//  [1,1,0],
//  [0,1,0],
//  [1,1,1]
//]
//Output: 1
//Explanation: There are three persons labeled with 0, 1 and 2. graph[i][j] = 1 means person i knows person j, otherwise graph[i][j] = 0 means person i does not know person j. The celebrity is the person labeled as 1 because both 0 and 2 know him but 1 does not know anybody.
//Example 2:
//
//
//Input: graph = [
//  [1,0,1],
//  [1,1,0],
//  [0,1,1]
//]
//Output: -1
//Explanation: There is no celebrity.
//
//
//Note:
//
//The directed graph is represented as an adjacency matrix, which is an n x n matrix where a[i][j] = 1 means person i knows person j while a[i][j] = 0 means the contrary.
//Remember that you won't have direct access to the adjacency matrix.
//

// 在一堆人中找名人，名人的定义是所有人都知道他，他不知道任何人

import Foundation

class Num277 {
  // TODO: 有空把这个实现出来
  // 1) 先从任意点开始，找一个candidate，只要认识新的人，这个新的人就是candidate
  //    然后再去验证这个candidate是不是符合定义
  // https://leetcode.com/problems/find-the-celebrity/discuss/399092/C-Candidate-solution
  
  // 2) two pointer，一个从头，一个从尾，必然这两个指针会碰面。然后去验证。
  // https://leetcode.com/problems/find-the-celebrity/discuss/398846/Python-Two-pointers-super-readable-and-easy!
  func solution() -> Bool {
    return true
  }
}
