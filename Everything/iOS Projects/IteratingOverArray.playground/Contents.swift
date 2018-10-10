//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


var j: Int = 0

var testArray = [1, 3, 2, 4, 3, 2, 1]

var dictionarySave: [Int: Int] = [:]

while (j < testArray.count) {
    print("The value on position: \(j) is \(testArray[j])")
    dictionarySave[j] = testArray[j]
    j += 1
}

for (key, value) in dictionarySave.sorted(by: <) {
    print("The key is: \(key) and has value: \(value)")
}


var numberSections = [1, 2, 3, 4, 5]

var i: Int = 0
while (i < numberSections.count) {
    print("The i is: \(i) and has value: \(numberSections[i])")
    i += 1
}


