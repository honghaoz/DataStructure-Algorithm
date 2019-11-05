// 160_Intersection of Two Linked Lists
// https://leetcode.com/problems/intersection-of-two-linked-lists/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write a program to find the node at which the intersection of two singly linked lists begins.
//

import Foundation

class Num160 {
  // https://leetcode.com/problems/intersection-of-two-linked-lists/solution/
  // 1) two pointers at the head respectively
  // 2) count length
  // 3) when 1 pointer ends, check the difference
  // 4) start with offset, check when two pointers are same
  func solution() -> Bool {
    return true
  }

//  class Solution {
//  public:
//      ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
//          ListNode *p1 = headA;
//          ListNode *p2 = headB;
//          ListNode *ret = NULL;
//          int len1 = 0;
//          int len2 = 0;
//          while(p1 != NULL) {
//              len1++;
//              p1 = p1->next;
//          }
//          while(p2 != NULL) {
//              len2++;
//              p2 = p2->next;
//          }
//          p1 = headA;
//          p2 = headB;
//          if(len1 > len2) {
//              int diff = len1 - len2;
//              for(int i = 0;i < diff;i++) {
//                  p1 = p1->next;
//              }
//          }else {
//              int diff = len2 - len1;
//              for(int i = 0;i < diff;i++) {
//                  p2 = p2->next;
//              }
//          }
//          while(p1 != p2) {
//              p1 = p1->next;
//              p2 = p2->next;
//          }
//          return p1;
//
//      }
//  };
}
