// 804_Unique Morse Code Words
// https://leetcode.com/problems/unique-morse-code-words
//
// Created by Honghao Zhang on 10/5/19.
// Copyright © 2019 Honghaoz. All rights reserved.
//
// Description:
// International Morse Code defines a standard encoding where each letter is mapped to a series of dots and dashes, as follows: "a" maps to ".-", "b" maps to "-...", "c" maps to "-.-.", and so on.
//
//For convenience, the full table for the 26 letters of the English alphabet is given below:
//
//[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
//Now, given a list of words, each word can be written as a concatenation of the Morse code of each letter. For example, "cba" can be written as "-.-..--...", (which is the concatenation "-.-." + "-..." + ".-"). We'll call such a concatenation, the transformation of a word.
//
//Return the number of different transformations among all words we have.
//
//Example:
//Input: words = ["gin", "zen", "gig", "msg"]
//Output: 2
//Explanation:
//The transformation of each word is:
//"gin" -> "--...-."
//"zen" -> "--...-."
//"gig" -> "--...--."
//"msg" -> "--...--."
//
//There are 2 different transformations, "--...-." and "--...--.".
//Note:
//
//The length of words will be at most 100.
//Each words[i] will have length in range [1, 12].
//words[i] will only consist of lowercase letters.
//

import Foundation

class Num804 {
  // Trivial solution, just replace the word to morse string and use set to count
  func uniqueMorseRepresentations(_ words: [String]) -> Int {
    var results = Set<String>()
    for word in words {
      results.insert(word.morse)
    }
    return results.count
  }
}

extension String {
  static var table = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
  var morse: String {
    var result = ""
    for c in self {
      let index = Int(c.asciiValue! - Character("a").asciiValue!)
      result += String.table[index]
    }
    return result
  }
}
