// 155_Min Stack
// https://leetcode.com/problems/min-stack/
//
// Created by Honghao Zhang on 10/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//
//push(x) -- Push element x onto stack.
//pop() -- Removes the element on top of the stack.
//top() -- Get the top element.
//getMin() -- Retrieve the minimum element in the stack.
//
//
//Example:
//
//MinStack minStack = new MinStack();
//minStack.push(-2);
//minStack.push(0);
//minStack.push(-3);
//minStack.getMin();   --> Returns -3.
//minStack.pop();
//minStack.top();      --> Returns 0.
//minStack.getMin();   --> Returns -2.
//

// 实现一个可以取最小值的Stack
// 实现方式是用两个stack，一个存正常的值，一个存最小值

import Foundation

class Num155 {
  class MinStack {

    var stack: [Int] = []
    var minStack: [Int] = []

    /** initialize your data structure here. */
    init() {
      
    }

    func push(_ x: Int) {
      stack.append(x)
      if minStack.isEmpty {
        minStack.append(x)
      }
      else {
        let minValue = min(minStack.last!, x)
        minStack.append(minValue)
      }
    }

    func pop() {
      _ = stack.popLast()
      _ = minStack.popLast()
    }

    func top() -> Int {
      return stack.last!
    }

    func getMin() -> Int {
      return minStack.last!
    }
  }

  /**
   * Your MinStack object will be instantiated and called as such:
   * let obj = MinStack()
   * obj.push(x)
   * obj.pop()
   * let ret_3: Int = obj.top()
   * let ret_4: Int = obj.getMin()
   */
}
