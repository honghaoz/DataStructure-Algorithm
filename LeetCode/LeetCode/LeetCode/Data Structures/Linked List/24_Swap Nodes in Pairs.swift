// 24_Swap Nodes in Pairs
// https://leetcode.com/problems/swap-nodes-in-pairs/submissions/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a linked list, swap every two adjacent nodes and return its head.
//
//You may not modify the values in the list's nodes, only nodes itself may be changed.
//
//
//
//Example:
//
//Given 1->2->3->4, you should return the list as 2->1->4->3.
//

import Foundation

class Num24 {
  /// Use 25's solution
  func swapPairs(_ head: ListNode?) -> ListNode? {
    return Num25().reverseKGroup(head, 2)
  }
}
