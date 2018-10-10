//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// define a closure which accepts parameters and returns a data type
//{
//    (parameters) -> return type in
//    statements
//}

let studname = {
    print("Welcome to Swift Closures")
}
studname()

//{
//    (Int, Int) -> Bool in
//    Statement1
//    Statement 2
//    .......
//    Statement n
//}

let divide = {
    (val1: Int, val2: Int) -> Int in
    return val1 / val2
}

let result = divide(200, 20)
print(result)

func ascend(s1: String, s2: String) -> Bool {
    return s1 > s2
}

let stringcmp = ascend(s1: "Swift 4", s2: "great")
print(stringcmp)

let sum = {
    (no1: Int, no2: Int) -> Int in
    return no1 + no2
}

let digits = sum(10, 20)
print(digits)

var count: [Int] = [5, 10, -6, 75, 20]
let descending = count.sorted(by: { n1, n2 in n1 > n2 })
let ascending = count.sorted(by: { n1, n2 in n1 < n2 })

print(descending)
print(ascending)

let sub = {
    (no1: Int, no2: Int) -> Int in
    return no1 - no2
}

let digits1 = sub(10, 20)
print(digits1)

var shorthand: (String, String, String) -> String
shorthand = { $2 }
print(shorthand("100", "200", "300"))

let numb = [98, -20, -30, 42, 18, 35]
//var sortedNumbers = numb.sorted ({
//    (left: Int, right: Int) -> Bool in
//    return left < right
//})

let asc = numb.sorted()
print(asc)

//reversed = sorted(names) { $0 > $1 }
//
//import Foundation
//var letters = ["North", "East", "West", "South"]
//
//let twoletters = letters.map({
//    (state: String) -> String in
//    return state.substring(to: advance(state.startIndex, 2)).uppercaseString
//})
//
//let stletters = letters.map() {
//    $0.substring(to: advance($0.startIndex, 2)).uppercaseString
//}
//print(stletters)

func calcDecrement(forDecrement total: Int) -> () -> Int {
    var overalldecrement = 100
    func decrementer() -> Int {
        overalldecrement -= total
        print(overalldecrement)
        return overalldecrement
    }
    return decrementer
}

let decrem = calcDecrement(forDecrement: 18)
decrem()
decrem()
decrem()
decrem()

print("")
print("Protocols:")

protocol classA {
    var marks: Int { get set }
    var result: Bool { get }
    
    func attendance() -> String
    func marksSecured() -> String
}

protocol classB: classA {
    var present: Bool { get set }
    var subject: String { get set }
    var stname: String { get set }
}

class classC: classB {
    var present: Bool = false
    
    var subject: String = "Swift 4 Protocols"
    
    var stname: String = "Protocols"
    
    var marks: Int = 96
    
    var result: Bool = true
    
    func attendance() -> String {
        return "The \(stname) has secured 99% attendance"
    }
    
    func marksSecured() -> String {
        return "\(stname) has scored \(marks)"
    }
}

let studdet = classC()
studdet.stname = "Swift 4"
studdet.marks = 98
studdet.marksSecured()

print(studdet.marks)
print(studdet.result)
print(studdet.present)
print(studdet.subject)
print(studdet.stname)


protocol dayOfAWeek {
    mutating func print()
}

enum days: dayOfAWeek {
    case sun, mon, tue, wed, thurs, fri, sat
    mutating func print() {
        switch self {
        case .sun:
            self = .sun
            Swift.print("Sunday")
        case .mon:
            self = .mon
            Swift.print("Monday")
        case .tue:
            self = .tue
            Swift.print("Tuesday")
        case .wed:
            self = .wed
            Swift.print("Wednesday")
        case .mon:
            self = .thurs
            Swift.print("Thursday")
        case .tue:
            self = .fri
            Swift.print("Friday")
        case .sat:
            self = .sat
            Swift.print("Saturday")
        default:
            Swift.print("No Such day")
        }
    }
}

var res = days.wed
res.print()

var resMonday = days.mon
resMonday.print()

protocol SomeProtocol {
    init(someParameter: Int)
}

protocol tcpProtocol {
    init(aprot: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        
    }
}

//protocol tcpProtocol {
//    init(aprot: Int)
//}
//
//class tcpClass: tcpProtocol {
//
//}

protocol AgeClasificationProtocol {
    var age: Int { get }
    func ageType() -> String
}

class Person {
    let firstName: String
    let lastName: String
    var age: Int
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = 10
    }
}

extension Person: AgeClasificationProtocol {
    func fullName() -> String {
        var c: String
        c = firstName + " " + lastName
        return c
    }
    
    func ageType() -> String {
        switch age {
        case 0...2:
            return "Baby"
        case 2...12:
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}
