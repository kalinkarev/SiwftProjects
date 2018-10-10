//: Playground - noun: a place where people can play

import UIKit

var arrayOfInts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print("The array is: \(arrayOfInts)")

var arrayOfString: [String] = []
print("The array is: \(arrayOfString)")

arrayOfString = arrayOfInts.map {
    String($0)
}
print("The array is: \(arrayOfString)")

var arrayOfOptionalString = arrayOfInts.map {
    Optional(String($0))
}
print("The array is: \(arrayOfOptionalString)")
