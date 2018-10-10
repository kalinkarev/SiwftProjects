//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Int {
    var add: Int {
        return self + 100
    }
    
    var sub: Int {
        return self - 10
    }
    
    var mul: Int {
        return self * 10
    }
    
    var div: Int {
        return self / 5
    }
}

let addition = 3.add

let subtration = 120.sub

let multiplication = 39.mul

let division = 55.div

extension String {
    mutating func formatString( number: Int, separator: String) -> String {
        var userInput = self
        let numberOfSeparators = userInput.count / number
        var numberOfSymbolsBeforeFirstSeparator = userInput.count % number
        
        for _ in 0..<numberOfSeparators {
            userInput.insert(contentsOf: separator, at: (userInput.index(userInput.startIndex, offsetBy: numberOfSymbolsBeforeFirstSeparator)))
            numberOfSymbolsBeforeFirstSeparator += number + separator.count
        }
        return userInput
    }
}

var test = "1234567890"
var newString = test.formatString(number: 6, separator: "!!:)")

print("The new string is: \(newString)")

extension Double {
    mutating func square() {
        let pi = 3.1415
        self = pi * self * self
    }
}

var Trial1 = 3.3
Trial1.square()
print("Area of a circle is: \(Trial1)")

var Trial2 = 5.8
Trial2.square()
print("Area of circle is: \(Trial2)")

var Trial3 = 120.3
Trial3.square()
print("Area of circle is: \(Trial3)")


extension Int {
    enum calc {
        case add
        case sub
        case mult
        case div
        case anything
    }
    
    var print: calc {
        switch self {
        case 0:
            return .add
        case 1:
            return .sub
        case 2:
            return .mult
        case 3:
            return .div
        default:
            return .anything
        }
    }
}

func result(numb: [Int]) {
    for i in numb {
        switch i.print {
        case .add:
            print(" 10 ")
        case .sub:
            print(" 20 ")
        case .mult:
            print(" 30 ")
        case .div:
            print(" 40 ")
        default:
            print(" 50 ")
        }
    }
}

result(numb: [0 , 1, 2, 3, 4, 7])

