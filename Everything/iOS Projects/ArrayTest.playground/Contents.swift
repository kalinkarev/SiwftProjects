//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var arr: [Int] = [1, 2, 3, 4, 0, 7, 6]

var enableButton = false

for i in arr {
    print("The i element is: \(i)")
    
    if i != 0 {
        print("The element is not ZERO")
    } else {
        print("The element is ZERO")
    }
}


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

var result = [1, 2, 3, 6, 5].all { $0 > 0 }
print("The result is: \(result)")

if result == true {
    enableButton = true
} else {
    enableButton = false
}

print("The value of the enable button is: \(enableButton)")
