//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//var someProtocol = [String : Int]()
//someProtocol["one"] = 1
//someProtocol["two"] = 2
//
//var index: Int
//for (value, e) in someProtocol {
//    print("The id \(value) has value \(e)")
//}

var someProtocol = [
    "one": 1,
    "two": 2
]

var index: Int
for (value, e) in someProtocol {
    print("The id \(value) has value \(e)")
}


var responseMessages = [
    200: "OK",
    403: "Access forbidden",
    404: "File not found",
    500: "Internal server error"
]

var emptyDict: [String : String] = [ : ]

print(responseMessages[200])

let httpResponseCodes = [200, 403, 301]

for code in httpResponseCodes {
    if let message = responseMessages[code] {
        print("Response \(code) is: \(message)")
    } else {
        print("Unknown response \(code)")
    }
}

responseMessages[301] = "Moved permanently"
print(responseMessages[301])

responseMessages[404] = "Not found"
responseMessages[500] = nil
print(responseMessages)


var interestingNumbers = [
    "primes": [2, 3, 4, 5, 7, 11, 13, 17],
    "triangular": [1, 3, 6, 10, 15, 21, 28],
    "hexagonal": [1, 6, 15, 28, 45, 66, 91]
]

for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}

print(interestingNumbers["primes"]!)
print(interestingNumbers["triangular"]!)
print(interestingNumbers["hexagonal"]!)

let imagePaths = [
    "star": "/glyphs/star.png",
    "portrait": "/images/content/portrait.jpg",
    "spacer": "/imges/shared/spacer.gif"
]

for (name, path) in imagePaths {
    print("The path to '\(name)' is '\(path)'.")
}

let glyphIndex = imagePaths.first(where: { $0.value.hasPrefix("/glyphs") })
if let index  = glyphIndex {
//    print("The '\(imagePaths[index].key)' image is a glyph.")
} else {
    print("No glyphs found!")
}





