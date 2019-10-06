// 412_Fizz Buzz
// https://leetcode.com/problems/fizz-buzz/
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// Write a program that outputs the string representation of numbers from 1 to n.
//
//But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
//
//Example:
//
//n = 15,
//
//Return:
//[
//    "1",
//    "2",
//    "Fizz",
//    "4",
//    "Buzz",
//    "Fizz",
//    "7",
//    "8",
//    "Fizz",
//    "Buzz",
//    "11",
//    "Fizz",
//    "13",
//    "14",
//    "FizzBuzz"
//]
//

import Foundation

class Num412 {
  func fizzBuzz(_ n: Int) -> [String] {
    return Array(1...n).map {
      if $0 % 3 == 0, $0 % 5 == 0 {
        return "FizzBuzz"
      }
      else if $0 % 3 == 0 {
        return "Fizz"
      }
      else if $0 % 5 == 0 {
        return "Buzz"
      }
      else {
        return String($0)
      }
    }
  }
}
