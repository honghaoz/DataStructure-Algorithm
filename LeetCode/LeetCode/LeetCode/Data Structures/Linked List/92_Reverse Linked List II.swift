// 92_Reverse Linked List II
// https://leetcode.com/problems/reverse-linked-list-ii/submissions/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Reverse a linked list from position m to n. Do it in one-pass.
//
//Note: 1 ≤ m ≤ n ≤ length of list.
//
//Example:
//
//Input: 1->2->3->4->5->NULL, m = 2, n = 4
//Output: 1->4->3->2->5->NULL
//

import Foundation

class Num92 {
  // Treat group as the one node, and reverse with the next node
  func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    guard m < n else { return head }
    let root: ListNode? = ListNode(0)
    root?.next = head

    var p = root
    for _ in 0..<(m - 1) {
      p = p?.next
    }
    let previousTail = p
    p = p?.next
    var groupHead = p
    let groupTail = p
    var nextHead = p?.next
    var length = 1 // the reversed group length
    while length < (n - m + 1) {
      groupTail?.next = nextHead?.next
      nextHead?.next = groupHead
      previousTail?.next = nextHead

      length += 1

      // loop invariant
      groupHead = previousTail?.next
      nextHead = groupTail?.next
    }
    return root?.next
  }
}
