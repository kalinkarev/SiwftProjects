//: Playground - noun: a place where people can play

import UIKit

var foo = [5, 4, 3, 2, 1]

var index = foo.index(of: 2)

//let lenght = Int(foo.substring(to: index))

let optionalString = "New string"

var optinalStringArray: [String?] = ["hello", "nice", "to", "meet", "you"]
print("The array of optionals is: \(optinalStringArray)")

var arrayWithoutOptionals: [String] = optinalStringArray.map { $0 ?? "" }
print("The array without optionals is: \(arrayWithoutOptionals)")

var optionalIntArray: [Int?] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var sum: Int = 0

for i in 0..<optionalIntArray.count {
    print("Position \(i) has value: \(String(describing: optionalIntArray[i]))")
    sum += optionalIntArray[i]!
}

print("The sum is: \(sum)")

var arrayIntWithoutOptionals: [Int] = optionalIntArray.map { $0 ?? 0 }
print("The int array without optionals is: \(arrayIntWithoutOptionals)")

var sumOfArray: Int = 0

for i in 0..<arrayIntWithoutOptionals.count {
    print("The position \(i) has value: \(arrayIntWithoutOptionals[i])")
    sumOfArray += arrayIntWithoutOptionals[i]
}

print("The sum of the elements in the array is: \(sumOfArray)")
