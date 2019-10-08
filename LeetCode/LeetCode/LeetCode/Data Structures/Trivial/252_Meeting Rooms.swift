// 252_Meeting Rooms
// https://leetcode.com/problems/meeting-rooms/
//
// Created by Honghao Zhang on 10/6/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), determine if a person could attend all meetings.
//
//Example 1:
//
//Input: [[0,30],[5,10],[15,20]]
//Output: false
//Example 2:
//
//Input: [[7,10],[2,4]]
//Output: true
//NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
//

import Foundation

class Num252 {
  // Iterate and check if there's any overlap
  func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.count == 0 {
      return true
    }
    if intervals.count == 1 {
      return true
    }

    let intervals = intervals.sorted {
      $0[0] < $1[0]
    }

      for i in 0..<(intervals.count - 1) {
        if intervals[i][1] > intervals[i + 1][0] {
          return false
        }
      }

    return true
  }
}
