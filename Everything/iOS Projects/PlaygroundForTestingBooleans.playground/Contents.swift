//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var show = false

var input = "game1"

extension Collection {
    func all(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        for item in self {
            let result = try predicate(item)
            
            if !result {
                return false
            }
        }
        
        return true
    }
}

var result = [1, 2, 4, 6, 5].all { $0 > 0 }

//if input.isEmpty {
//    print("The user hasn`t inputted anything")
//} else {
//    print("The user has inputted \(input)")
//}
//
//if result == true {
//    print("The input isn`t containing zero")
//} else {
//    print("The input is containing zero")
//}

if input.isEmpty {
    print("The user input is empty")
    show = false
} else {
    print("The user input is not empty")
    if (result == true) {
        show = true
    } else {
        show = false
    }
}

print("Do we have to show the item: \(show)")
