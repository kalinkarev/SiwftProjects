//: Playground - noun: a place where people can play

import UIKit

var initialArray = [0, 1, 2, 3, 4, 5, 6, 7, 8]

print("The array has: \(initialArray.count) elements.")

var newArray = [Int]()

for i in 1...initialArray.count {
    print("The i element is: \(i)")
    newArray.append(i)
}

print("The old array is: \(initialArray)")
print("The new arry is: \(newArray)")
