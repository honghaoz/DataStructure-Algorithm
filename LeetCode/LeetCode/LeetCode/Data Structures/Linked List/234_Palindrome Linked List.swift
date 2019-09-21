// 234_Palindrome Linked List
// https://leetcode.com/problems/palindrome-linked-list/
//
// Created by Honghao Zhang on 9/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given a singly linked list, determine if it is a palindrome.
//
//Example 1:
//
//Input: 1->2
//Output: false
//Example 2:
//
//Input: 1->2->2->1
//Output: true
//Follow up:
//Could you do it in O(n) time and O(1) space?
//

import Foundation

class Num234 {
  func isPalindrome_copy_reverse(_ head: ListNode?) -> Bool {
    let copyHead = reverseList(copy(head))
    var p0 = head
    var p1 = copyHead
    while p0 != nil {
      if p0?.val != p1?.val {
        return false
      }
      p0 = p0?.next
      p1 = p1?.next
    }
    return true
  }

  func copy(_ head: ListNode?) -> ListNode? {
    let root: ListNode? = ListNode(0)
    var newP: ListNode? = root
    var p = head
    while p != nil {
      newP?.next = ListNode(p!.val)
      newP = newP?.next
      p = p?.next
    }
    return root?.next
  }

  func printList(_ head: ListNode?) {
    var p = head
    while p != nil {
      print("\(p!.val) -> ", terminator: "")
      p = p?.next
    }
    print("nil")
  }

  func isPalindrome_cut_reverse_2nd_half(_ head: ListNode?) -> Bool {
    var length = 0
    var p0 = head
    while p0 != nil {
      p0 = p0?.next
      length += 1
    }
    guard length >= 2 else {
      return true
    }

    let root: ListNode? = ListNode(0)
    root?.next = head
    p0 = root
    for _ in 0..<(length / 2) {
      p0 = p0?.next
    }
    var rightHead: ListNode?
    if length % 2 == 0 {
      rightHead = p0?.next
    } else {
      rightHead = p0?.next?.next
    }
    p0 = head
    var p1 = reverseList(rightHead)
    while p1 != nil {
      if p0?.val != p1?.val {
        return false
      }
      p0 = p0?.next
      p1 = p1?.next
    }
    return true
  }

  func isPalindrome_cut_reverse_2nd_half2(_ head: ListNode?) -> Bool {
    let root: ListNode? = ListNode(0)
    root?.next = head
    // root -> 1 -> 2
    // root -> 1 -> 2 -> 3
    var p0 = root
    var p1 = root
    while p1?.next != nil {
      p0 = p0?.next
      p1 = p1?.next?.next
    }
    let rightHead = p0?.next
    p0 = head
    p1 = reverseList(rightHead)
    while p1 != nil {
      if p0?.val != p1?.val {
        return false
      }
      p0 = p0?.next
      p1 = p1?.next
    }
    return true
  }

  func reverseList(_ head: ListNode?) -> ListNode? {
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

  // OLD
//  func isPalindrome(_ head: ListNode?) -> Bool {
//    // O(n) and O(1)
//
//    // Use slow and fast pointer, this is helpful for locating the middle node
//    // Unpon find the middle node, reverse the first part
//    // Check in two directions
//
//    if head == nil { return true } // question: should return false/true?
//    if head?.next == nil { return true }
//
//    var p = head
//    var p2 = head?.next
//
//    // nil √
//    // 1 √
//    // 1>2           end: (1)>(2)
//    // 1>2>3         end: 1>(2)>3>(4)
//
//    //                       p     p2
//    // 1>2>3>4       end: 1>(2)>3>(4)
//    // 1>2>3>4>5     end: 1>2>(3)>4>5>()
//    // 1>2>3>4>5>6   end: 1>2>(3)>4>5>(6)
//    while p2?.next != nil {
//      p = p?.next
//      p2 = p2?.next?.next
//    }
//
//    if p2 != nil {
//      // even number
//      var right = p?.next
//
//      // break left
//      p?.next = nil
//      var left = reverseList(head)
//      while left != nil {
//        if left?.val != right?.val {
//          return false
//        }
//        left = left?.next
//        right = right?.next
//      }
//    } else {
//      // odd number
//      var right = reverseList(p?.next)
//      var left = head
//      while right != nil {
//        if left?.val != right?.val {
//          return false
//        }
//        left = left?.next
//        right = right?.next
//      }
//    }
//
//    return true
//  }
//
//  func isPalindrome1(_ head: ListNode?) -> Bool {
//    // navie listNode -> Array -> Check | O(n) and On(n)
//    //
//    var array = [Int]()
//    var p = head
//    while let value = p?.val {
//      array.append(value)
//      p = p?.next
//    }
//
//    // 3 -> 1
//    // 4 -> 2  1 2 2 1
//    for i in 0..<array.count / 2 {
//      if array[i] != array[array.count - i - 1] {
//        return false
//      }
//    }
//
//    return true
//  }
//
//  func reverseList(_ head: ListNode?) -> ListNode? {
//    // Recursive
//    if head == nil { return nil }
//    if head?.next == nil { return head }
//
//    // 1>2>3>4>nil
//    // 1>2<3<4
//    //   |
//    //   v
//    //  nil
//    let restReversed = reverseList(head?.next)
//
//    // 1<2<3<4
//    head?.next?.next = head
//    head?.next = nil
//    return restReversed
//  }
}
