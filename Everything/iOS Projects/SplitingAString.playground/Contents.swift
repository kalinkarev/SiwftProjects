//: Playground - noun: a place where people can play

import UIKit

let fullName = "First,Last"
let fullNameArr = fullName.components(separatedBy: ",")
let firstName = fullNameArr[0]
let lastName = fullNameArr[1]

print("The full name is: \(fullName)")
print("The first name is: \(firstName)")
print("The last name is: \(lastName)")



var sentence = "This is a simple sentence"
let wordToRemove = "simple"

if let range = sentence.range(of: wordToRemove) {
    sentence.removeSubrange(range)
}



