// 253_Meeting Rooms II
// https://leetcode.com/problems/meeting-rooms-ii/
//
// Created by Honghao Zhang on 9/7/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
//
//Example 1:
//
//Input: [[0, 30],[5, 10],[15, 20]]
//Output: 2
//Example 2:
//
//Input: [[7,10],[2,4]]
//Output: 1
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//

// 给出一些meeting的时间，问最多需要多少room
// 先把时间按照start排序，然后扫描一遍，把end time放进一个priority queue (min)。每次循环，先检查新的start time是否大于start time
// 如果大于，说明之前的meeting已经结束，先dequeue掉，然后再放入新的end time

import Foundation

class Num253 {
  // MARK: Priority Queue
  // Use a priority queue to store the end time, the priority queue size indicates the rooms count
  // Sort the intervals by start time
  // Iterate each interval. First peek the min end time.
  // If it's nil (the queue is empty), just enqueue the new end time
  // If the top min end time is greater than current start time, we know we need to allocate a new room
  // If the top min end time is less than or equal to start time, we know we can release the room and enqueue the new end time
  // Track the max priority queue size
  func minMeetingRooms_priorityQueue(_ intervals: [[Int]]) -> Int {
    // Min-heap for end times
    var queue = PriorityQueue<Int>(sort: <)

    var maxSize: Int = 0
    // sorted by start time
    for time in intervals.sorted(by: { $0[0] < $1[0] }) {
      let start = time[0]
      let end = time[1]

      if queue.isEmpty {
        // No meetings, allocate a new room
        queue.enqueue(end)
      }
      else {
        let minEndTime = queue.peek()!
        if minEndTime <= start {
          // last meeting has ended, release the room
          _ = queue.dequeue()
          // then allocate a new room
          queue.enqueue(end)
        }
        else {
          // the nearest meeting has not ended, need a new room
          queue.enqueue(end)
        }
      }

      maxSize = max(maxSize, queue.count)
    }

    return maxSize
  }

  // MARK: Simulate the meetings
  // We sort the time point in chronological order
  // Then we map them into [S, E, S, E, S, S, E, E]
  // S means a meeting starts
  // E means a meeting ends
  // Then iterate the array and track what's max rooms reached.
  // When meets S, +1, otherwise, -1

  enum Time: Comparable {
    case start(Int)
    case end(Int)

    // the time
    var value: Int {
      switch self {
        case .start(let startTime):
          return startTime
        case .end(let endTime):
          return endTime
      }
    }

    static func < (lhs: Time, rhs: Time) -> Bool {
      // When value is same, make sure end is before start
      if lhs.value == rhs.value {
        switch (lhs, rhs) {
          case (.start, .end):
          return false
          case (.end, .start):
          return true
          default:
          return true
        }
      }
      else {
        return lhs.value < rhs.value
      }
    }
  }

  func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    let times = intervals.flatMap {
      [Time.start($0[0]), Time.end($0[1])]
    }
    let sortedTimes = times.sorted()

    var maxRoom: Int = 0
    var rooms: Int = 0
    for time in sortedTimes {
      switch time {
        case .start(_):
          rooms += 1
        case .end(_):
          rooms -= 1
      }
      maxRoom = max(maxRoom, rooms)
    }
    return maxRoom
  }
}
