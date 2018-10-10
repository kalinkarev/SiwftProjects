//: Playground - noun: a place where people can play

import UIKit

var inputString = "He is :) like"
//var inputString = """
//Line one :)
//Line two :)
//Line three
//"""
//print("The input string is: \(inputString)")

var word: String = ""
//print("The string named word is: \(word)")

var final: String = ""
//print("The String named final is: \(final)")

let spaceValue = 32
let u = UnicodeScalar(spaceValue)
let charSpace = Character(u!)
//print(charSpace)

var numberOfWordsInTheInputtedString: Int = 0
var numberofSeparators: Int = 0

for index in inputString.indices {
    print("The characters in the strings are: \(inputString[index])")
    if (inputString[index] <= charSpace) {
//        print("Have found a split character")
        numberofSeparators += 1
//        word += String(inputString[index])
//        word.append(inputString[index])
        word.append(inputString[index])
//        numberOfWordsInTheInputtedString += 1
        print("The String named word is: \(word)")
        
        if (word == ":)") {
            print("Have found the symbol that is searched")
            final.append("!!")
        }
        
    }
}

//print("The String named word is: \(word)")

//print("The number of separators is: \(numberofSeparators)")
numberOfWordsInTheInputtedString = numberofSeparators + 1
//print("The number of words in the inputted string is: \(numberOfWordsInTheInputtedString)")

