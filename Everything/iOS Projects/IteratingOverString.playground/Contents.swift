//: Playground - noun: a place where people can play

import UIKit

var stringIteration = "He :) is"
print("The String is: \(stringIteration)")

print("The last char in the string is: \(String(describing: stringIteration.last))")

var word: String = ""
var final: String = ""

let spaceValue = 32
let u = UnicodeScalar(spaceValue)
let charSpace = Character(u!)

let changeSymbol = ":)"

//var countString = stringIteration.count
//print("The string has \(countString) symbols")

//for i in 0..<countString {
//    print("The poreden symbol is: \(stringIteration[i])")
//}

var numbeOfCharacters = stringIteration.count

var counter: Int = 0
for symbol in stringIteration {
    counter += 1
    print("The symbol is: \(symbol) has index: \(counter)")
    if (symbol > charSpace || counter == numbeOfCharacters) {
        word.append(symbol)
    } else {
        print("The word is: \(word)")
        if (word == changeSymbol) {
            word = "!!"
        }
        word.append(symbol)
        final.append(word)
        word = ""
    }
}

print("The word is: \(word)")

if (word == ":)") {
    word = "!!"
}

final.append(word)

print("The output is: \(final)")
