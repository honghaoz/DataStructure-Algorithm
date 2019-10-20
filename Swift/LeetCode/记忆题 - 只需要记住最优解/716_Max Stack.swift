// 716_Max Stack
// https://leetcode.com/problems/max-stack/
//
// Created by Honghao Zhang on 10/19/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design a max stack that supports push, pop, top, peekMax and popMax.
//
// 1. push(x) -- Push element x onto stack.
// 2. pop() -- Remove the element on top of the stack and return it.
// 3. top() -- Get the element on the top.
// 4. peekMax() -- Retrieve the maximum element in the stack.
// 5. popMax() -- Retrieve the maximum element in the stack, and remove it. If you find more than one maximum elements, only remove the top-most one.
//Example 1:
//MaxStack stack = new MaxStack();
//stack.push(5);
//stack.push(1);
//stack.push(5);
//stack.top(); -> 5
//stack.popMax(); -> 5
//stack.top(); -> 1
//stack.peekMax(); -> 5
//stack.pop(); -> 1
//stack.top(); -> 5
//Note:
// 1. -1e7 <= x <= 1e7
// 2. Number of operations won't exceed 10000.
// 3. The last four operations won't be called when stack is empty.
//

// 实现一个max stack，有个popMax()

import Foundation

class Num716 {
  // MARK: - Use a heap (TreeMap/PriorityQueue) to store the max node reference
  // Use doubly linked list to make sure the removing is O(1)
  // So for popMax(), use heap to get the max value, then remove in the linked list.
  // O(log N)

  // MARK: - Use two stacks 1)
  // TODO: 另一个stack存最大数，popMax的时候就从stack中依次pop，直到遇到max
  // 然后保留这个max值，再把之前pop出来的值再重新push回去

  // MARK: - Use two stacks 2)
  // 关键是这个popMax，这个会影响pop的元素之后的max，需要重新计算max的index
  class MaxStack {

    // if it's nil, this means it's removed
    private var stack: [Int] = []
    private var maxIndexStack: [Int] = []

    /** initialize your data structure here. */
    init() {

    }

    func push(_ x: Int) {
      if stack.isEmpty {
        stack.append(x)
        maxIndexStack.append(0)
      }
      else {
        stack.append(x)
        let currentMax = stack[maxIndexStack.last!]
        if x >= currentMax {
          // if the new element is the new max, should keep the last index
          maxIndexStack.append(stack.count - 1)
        }
        else {
          // otherwise, keep the current max index
          maxIndexStack.append(maxIndexStack.last!)
        }
      }
    }

    func pop() -> Int {
      _ = maxIndexStack.popLast()
      return stack.popLast() ?? -1
    }

    func top() -> Int {
      return stack.last ?? -1
    }

    func peekMax() -> Int {
      if maxIndexStack.isEmpty {
        return -1
      }
      else {
        return stack[maxIndexStack.last!]
      }
    }

    func popMax() -> Int {
      guard let maxIndex = maxIndexStack.last else {
        return -1
      }

      let maxValue = stack.remove(at: maxIndex)
      maxIndexStack.removeLast()

      // The numbers from maxIndex to the end needs to update
      for i in maxIndex..<stack.count {
        if i == 0 {
          // if there's no prev max index, just set it
          maxIndexStack[i] = 0
        }
        else {
          let prevMax = stack[maxIndexStack[i - 1]]
          if stack[i] >= prevMax {
            // should keep current index as the max index
            maxIndexStack[i] = i
          }
          else {
            // should keep the prev max index
            maxIndexStack[i] = maxIndexStack[i - 1]
          }
        }

      }

      return maxValue
    }
  }

  /**
   * Your MaxStack object will be instantiated and called as such:
   * let obj = MaxStack()
   * obj.push(x)
   * let ret_2: Int = obj.pop()
   * let ret_3: Int = obj.top()
   * let ret_4: Int = obj.peekMax()
   * let ret_5: Int = obj.popMax()
   */
}
