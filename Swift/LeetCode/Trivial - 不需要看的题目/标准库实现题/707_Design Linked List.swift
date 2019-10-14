// 707_Design Linked List
// https://leetcode.com/problems/design-linked-list/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design your implementation of the linked list. You can choose to use the singly linked list or the doubly linked list. A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node. If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.
//
//Implement these functions in your linked list class:
//
//get(index) : Get the value of the index-th node in the linked list. If the index is invalid, return -1.
//addAtHead(val) : Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
//addAtTail(val) : Append a node of value val to the last element of the linked list.
//addAtIndex(index, val) : Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. If index is negative, the node will be inserted at the head of the list.
//deleteAtIndex(index) : Delete the index-th node in the linked list, if the index is valid.
//Example:
//
//MyLinkedList linkedList = new MyLinkedList();
//linkedList.addAtHead(1);
//linkedList.addAtTail(3);
//linkedList.addAtIndex(1, 2);  // linked list becomes 1->2->3
//linkedList.get(1);            // returns 2
//linkedList.deleteAtIndex(1);  // now the linked list is 1->3
//linkedList.get(1);            // returns 3
//Note:
//
//All values will be in the range of [1, 1000].
//The number of operations will be in the range of [1, 1000].
//Please do not use the built-in LinkedList library.
//

import Foundation

class Num707 {
  
  class MyLinkedList {
    
    var nums: [Int] = []
    /** Initialize your data structure here. */
    init() {
      
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
      guard index < nums.count, index >= 0 else {
        return -1
      }
      return nums[index]
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
      nums.insert(val, at: 0)
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
      nums.append(val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
      guard index <= nums.count else {
        return
      }
      if index < 0 {
        nums.insert(val, at: 0)
      } else {
        nums.insert(val, at: index)
      }
      
      
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
      guard index < nums.count, index >= 0 else {
        return
      }
      nums.remove(at: index)
    }
  }
  
  /**
   * Your MyLinkedList object will be instantiated and called as such:
   * let obj = MyLinkedList()
   * let ret_1: Int = obj.get(index)
   * obj.addAtHead(val)
   * obj.addAtTail(val)
   * obj.addAtIndex(index, val)
   * obj.deleteAtIndex(index)
   */
}
