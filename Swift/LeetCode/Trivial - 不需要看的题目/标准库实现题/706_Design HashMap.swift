// 706_Design HashMap
// https://leetcode.com/problems/design-hashmap/
//
// Created by Honghao Zhang on 10/12/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design a HashMap without using any built-in hash table libraries.
//
//To be specific, your design should include these functions:
//
//put(key, value) : Insert a (key, value) pair into the HashMap. If the value already exists in the HashMap, update the value.
//get(key): Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
//remove(key) : Remove the mapping for the value key if this map contains the mapping for the key.
//
//Example:
//
//MyHashMap hashMap = new MyHashMap();
//hashMap.put(1, 1);
//hashMap.put(2, 2);
//hashMap.get(1);            // returns 1
//hashMap.get(3);            // returns -1 (not found)
//hashMap.put(2, 1);          // update the existing value
//hashMap.get(2);            // returns 1
//hashMap.remove(2);          // remove the mapping for 2
//hashMap.get(2);            // returns -1 (not found)
//
//Note:
//
//All keys and values will be in the range of [0, 1000000].
//The number of operations will be in the range of [1, 10000].
//Please do not use the built-in HashMap library.
//

import Foundation

class Num706 {
  // https://leetcode.com/problems/design-hashmap/discuss/225312/hashmaparraylinkedlistcollision
  // Make custom hash function
  // Handle collision

  // Swift explanation: https://medium.com/@stevenpcurtis.sc/implement-a-dictionary-in-swift-5e06052aa120
  class MyHashMap {

    private static let loadFactor = 0.75

    class Node {
      var key: Int
      var value: Int
      var next: Node?

      init(key: Int, value: Int, next: Node?) {
        self.key = key
        self.value = value
        self.next = next
      }
    }

    var buckets: [Node?] = Array(repeating: nil, count: 100005) // 100005 works
    var size: Int = 5

    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
      let index = hash(key: key)
      var head = buckets[index]
      // If found a existing node in the list, update the value and early return
      while head != nil {
        if head!.key == key {
          head!.value = value
          return
        }
        head = head!.next
      }
      // Otherwise, insert a new node at the beginning
      buckets[index] = Node(key: key, value: value, next: buckets[index])
      size += 1

      let loadFactor = Double(size) / Double(buckets.count)
      if loadFactor > MyHashMap.loadFactor {
        rehash()
      }
    }

    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
      let index = hash(key: key)
      var head = buckets[index]
      while head != nil {
        if head!.key == key {
          return head!.value
        }
        head = head!.next
      }
      return  -1
    }

    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
      let index = hash(key: key)
      var prev = Node(key: -1, value: -1, next: buckets[index])
      var current = prev.next
      while current != nil {
        if current!.key == key {
          prev.next = current!.next
          buckets[index] = prev.next
          size -= 1
          return
        }
        prev = current!
        current = current!.next
      }
    }

    private func hash(key: Int) -> Int {
      return key % buckets.count
    }

    private func rehash() {
      let temp = buckets
      buckets = Array(repeating: nil, count: temp.count * 2)
      size = 0
      for head in temp {
        var node = head
        while node != nil {
          put(node!.key, node!.value)
          node = node!.next
        }
      }
    }

  }

  //
  //  /**
  //   * Your MyHashMap object will be instantiated and called as such:
  //   * let obj = MyHashMap()
  //   * obj.put(key, value)
  //   * let ret_2: Int = obj.get(key)
  //   * obj.remove(key)
  //   */
}
