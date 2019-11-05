// 25_Reverse Nodes in k-Group
// https://leetcode.com/problems/reverse-nodes-in-k-group/submissions/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.
//
//k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.
//
//Example:
//
//Given this linked list: 1->2->3->4->5
//
//For k = 2, you should return: 2->1->4->3->5
//
//For k = 3, you should return: 3->2->1->4->5
//
//Note:
//
//Only constant extra memory is allowed.
//You may not alter the values in the list's nodes, only nodes itself may be changed.
//

// 每K个元素为一组反向

import Foundation

class Num25 {
  /// Reverse group by group
  func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard head != nil else { return nil }

    let root: ListNode? = ListNode(0)
    root?.next = head
    // loop invariant
    var lastTail: ListNode? = root
    var p = lastTail
    var nextHead: ListNode? = nil
    while p != nil {
      for _ in 0..<k {
        p = p?.next
      }
      if p == nil {
        return root?.next
      }
      // keep the next group head
      nextHead = p?.next
      // break the group
      p?.next = nil
      // reverse the group
      _ = reverseList(lastTail?.next)
      // p is now the head
      // lastTail?.next is now the tail
      let newTail = lastTail?.next // keep the old head (new tail)
      newTail?.next = nextHead // reconnect the group
      lastTail?.next = p // reconnect the old tail with the new head

      // keep loop invariant
      lastTail = newTail // lastTail should point to the new tail
      p = lastTail // p should point to the new tail
      nextHead = nil
    }
    return root?.next
  }

  private func reverseList(_ head: ListNode?) -> ListNode? {
    let root: ListNode? = nil
    var i: ListNode? = root
    var j: ListNode? = head
    var k: ListNode? = head?.next
    while j != nil {
      j?.next = i
      i = j
      j = k
      k = k?.next
    }
    return i
  }
}
