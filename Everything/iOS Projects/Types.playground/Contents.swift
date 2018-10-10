//: Playground - noun: a place where people can play

import UIKit

let yes: Bool = true
let no: Bool = false

let doesOneEqualTwo = (1 == 2)
let doesOneNotEqualTwo = (1 != 2)

let alsoTrue = !(1 == 2)

let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)

let and = true && true
let or = true || false

let andTrue = 1 < 2 && 4 > 3
let andFalse = 1 < 2 && 3 > 4
let orTrue = 1 < 2 || 3 > 4
let orFalse = 1 == 2 || 3 == 4

let guess = "dog"
let dogEqualsCat = guess == "cat"

let order = "cat" < "dog"

let stringA = "cafe"
let stringB = "cafe\u{0301}"
let equal = stringA == stringB

if 2 > 1 {
    print("Yes, 2 is greater than 1.")
}

let animal = "Fox"

if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
} else {
    print("Animal is not a house pet.")
}

var hoursWorked = 45

var price = 0
if hoursWorked > 40 {
    let hoursOver40 = hoursWorked - 40
    price += hoursOver40 * 50
    hoursWorked -= hoursOver40
}
price += hoursWorked * 25

print(price)

//let a = 5
//let b = 10
//
//let min: Int
//if a < b {
//    min = a
//} else {
//    min = b
//}
//
//let max: Int
//if a > b {
//    max = a
//} else {
//    max = b
//}

let a = 5
let b = 10

let min = a < b ? a : b
let max = a > b ? a : b

var sum = 1
while sum < 1000 {
    sum = sum + (sum + 1)
}

var sumNew = 1
repeat {
    sumNew = sumNew + (sumNew + 1)
} while sumNew < 1000

let closedRange = 0...5
print(closedRange)

let halfOpenRange = 0..<5
print(halfOpenRange)

let count = 10
var sumNumber = 0

for i in 1...count {
    sumNumber += i
}
print("The sum is: \(sumNumber)")

let countN = 10
var sumN = 1
var lastSum = 0

for _ in 0..<count {
    let temp = sumN
    sumN = sumN + lastSum
    lastSum = temp
}

let number = 10
switch number {
case 0:
    print("Zero")
default:
    print("Non-zero")
}








