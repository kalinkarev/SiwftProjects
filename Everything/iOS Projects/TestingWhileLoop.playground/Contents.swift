//: Playground - noun: a place where people can play

import UIKit

//var n = 10
//var i: Int = 1
//
//while (i <= n) {
//    print(i)
//
//    i += 1
//}

var n: Int = 10
var i: Int = 0

//repeat {
////    print("The i element is: \(i)")
////    i += 1
//} while (i <= n)

repeat {
    i += 1
    print("The i element is: \(i)")
} while (i < n)

func testReturn() -> Int {
    let n: Int = 10
    var i: Int = 0
    
    repeat {
        i += 1
        print("The i element is: \(i)")
        
        return i
    } while (i < n)
}

var result = testReturn()
print(result)
