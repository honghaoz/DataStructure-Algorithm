// 146_LRU Cache
// https://leetcode.com/problems/lru-cache/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
//
//get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
//put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
//
//The cache is initialized with a positive capacity.
//
//Follow up:
//Could you do both operations in O(1) time complexity?
//
//Example:
//
//LRUCache cache = new LRUCache( 2 /* capacity */ );
//
//cache.put(1, 1);
//cache.put(2, 2);
//cache.get(1);       // returns 1
//cache.put(3, 3);    // evicts key 2
//cache.get(2);       // returns -1 (not found)
//cache.put(4, 4);    // evicts key 1
//cache.get(1);       // returns -1 (not found)
//cache.get(3);       // returns 3
//cache.get(4);       // returns 4
//
//

// 实现一个LRU cache，access过的key要放在最前，保持一个size
// 当size超过的时候，老的key要被删掉

import Foundation

class Num146 {
  class LRUCache {

    // 标准的实现方式是用doubly linked list
    // dict存node，需要调整顺序的话，linked list调整。
    var dict: [Int: Int] = [:]

    // From old to new, this needs to use doubly Linked list
    var keys: [Int] = []

    let size: Int

    init(_ capacity: Int) {
      self.size = capacity
    }

    func get(_ key: Int) -> Int {
      if let value = dict[key] {
        // if exists, adjust order
        let index = keys.firstIndex(of: key)!
        keys.remove(at: index)
        keys.append(key)
        return value
      }
      else {
        return -1
      }
    }

    func put(_ key: Int, _ value: Int) {
      if dict[key] != nil {
        // if exists
        // needs to update the value
        // adjust the keys order
        dict[key] = value
        let index = keys.firstIndex(of: key)!
        keys.remove(at: index)
        keys.append(key)
      }
      else {
        // if not
        // add new key value
        dict[key] = value
        // drop oldest key if needed
        if keys.count == size {
          let oldKey = keys.removeFirst()
          dict.removeValue(forKey: oldKey)
        }
        keys.append(key)
      }
    }
  }

  /**
   * Your LRUCache object will be instantiated and called as such:
   * let obj = LRUCache(capacity)
   * let ret_1: Int = obj.get(key)
   * obj.put(key, value)
   */
}
