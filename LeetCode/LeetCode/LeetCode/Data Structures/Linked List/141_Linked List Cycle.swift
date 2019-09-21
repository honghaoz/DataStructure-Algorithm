// 141. Linked List Cycle
// https://leetcode.com/problems/linked-list-cycle/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a linked list, determine if it has a cycle in it.
//
//To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.
//Example 1:
//
//Input: head = [3,2,0,-4], pos = 1
//Output: true
//Explanation: There is a cycle in the linked list, where tail connects to the second node.
//
//
//Example 2:
//
//Input: head = [1,2], pos = 0
//Output: true
//Explanation: There is a cycle in the linked list, where tail connects to the first node.
//
//
//Example 3:
//
//Input: head = [1], pos = -1
//Output: false
//Explanation: There is no cycle in the linked list.
//
//
//
//
//Follow up:
//
//Can you solve it using O(1) (i.e. constant) memory?
//

import Foundation

class Num141 {
  // https://leetcode.com/problems/linked-list-cycle/solution/
  // 1) Hash Table
  // 2) Two pointers

//  public boolean hasCycle(ListNode head) {
//    if (head == null || head.next == null) {
//      return false;
//    }
//    ListNode slow = head;
//    ListNode fast = head.next;
//    while (slow != fast) {
//      if (fast == null || fast.next == null) {
//        return false;
//      }
//      slow = slow.next;
//      fast = fast.next.next;
//    }
//    return true;
//  }
}
