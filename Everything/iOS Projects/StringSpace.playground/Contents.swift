import UIKit

let list = "1234567890"

for (index, element) in list.enumerated() {
    print("Item \(index): \(element)")
}

func makeInsertion(separator: String, afterEveryXCharacters: Int, intoString: String) -> String {
    var ouput = ""
    for (index, c) in intoString.enumerated() {
        if index % afterEveryXCharacters == 0 && index > 0 {
            ouput += separator
        }
        ouput.append(c)
    }
    return ouput
}

let testString = "1234567890123"
makeInsertion(separator: ":", afterEveryXCharacters: 5, intoString: testString)

let reversedTestString = String(testString.reversed())
let newString = makeInsertion(separator: ":", afterEveryXCharacters: 5, intoString: reversedTestString)
let lastString = String(newString.reversed())
print("The result is: \(lastString)")

func insertionIntoUserInput(intoString: String) -> String {
    var output = ""
    for (index, c) in intoString.enumerated() {
        if index % 5 == 0 && index > 0 {
            output += " "
        }
        output.append(c)
    }
    return output
}

let input = "1234567890123"
let reversedInput = String(input.reversed())
let newInput = insertionIntoUserInput(intoString: reversedInput)
let output = String(newInput.reversed())

//let input = "1234567890123"
//insert(separator: " ", afterEveryXCharacters: 5, intoString: input)
//
//let reversedInput = String(input.reversed())
//
//let newString = insert(separator: " ", afterEveryXCharacters: 5, intoString: reversedInput)
//print("The new string is: \(newString)")
//
//let lastString = String(newString.reversed())
//print("The result is : \(lastString)")

func insert(separator: String, afterEveryXCharacters: Int, intoString: String) -> String {
    var output = ""
    intoString.enumerated().forEach { index, c in
        if index % afterEveryXCharacters == 0 && index > 0 {
            output += separator
        }
        output.append(c)
    }
    return output
}

func makeSeparator(separator: String, afterEveryXCharacters: Int, intoString: String) -> String {
    var ouput = ""
    let counterString = intoString.count
    for index in 0...counterString {
        for c in intoString {
            if index % afterEveryXCharacters == 0 && index > 0 {
                ouput += separator
            }
            ouput.append(c)
        }
    }
    return ouput
}

//let input = "1234567890123"
//makeSeparator(separator: ";", afterEveryXCharacters: 5, intoString: input)


//insert(separator: ":", afterEveryXCharacters: 5, intoString: "123456789")
//
//var stringForReverse = "Hello, World!"
//let reversedString = String(stringForReverse.reversed())
//print(reversedString)
//
//let input = "1234567890123"
//insert(separator: " ", afterEveryXCharacters: 5, intoString: input)
//
//let reversedInput = String(input.reversed())
//
//let newString = insert(separator: " ", afterEveryXCharacters: 5, intoString: reversedInput)
//print("The new string is: \(newString)")
//
//let lastString = String(newString.reversed())
//print("The result is : \(lastString)")


var userInput = "123456789012345678"
print("The input is: \(userInput)")

let countSymbols = userInput.count
print("The numbr of characters are: \(countSymbols)")

var numberOfSeparators = 0

if (countSymbols % 5 == 0) {
    numberOfSeparators = (countSymbols / 5) - 1
} else {
    numberOfSeparators = countSymbols / 5
}

print("The number of separators is: \(numberOfSeparators)")

var numberOfSymbolsBeforeFirstSeparator = countSymbols - (numberOfSeparators * 5)

//userInput.insert(";", at: userInput.index(userInput.startIndex, offsetBy: numberOfSymbolsBeforeFirstSeparator))

for _ in 0..<numberOfSeparators {
    userInput.insert(";", at: userInput.index(userInput.startIndex, offsetBy: numberOfSymbolsBeforeFirstSeparator))
    numberOfSymbolsBeforeFirstSeparator += 6
}

print("The result is: \(userInput)")


var test = "012345"
var end = test.last

var countS = test.count

func reverse(_ s: String) -> String {
    var str = ""
    for character in s {
        str = "\(character)" + str
        print(str)
    }
    return str
}

func makeFormation(intoString: String) -> String {
    var output = ""
    for (index, c) in intoString.enumerated() {
        if index % 5 == 0 && index > 0 {
            output += " "
        }
        output.append(c)
    }
    return output
}

var new = reverse(test)

var separate = makeFormation(intoString: new)

var final = reverse(separate)




var searchString: [String] = [":)"]
var putString: [String] = ["!!"]

var he = "he is :) new one"

for char in he {
    var c = char
    print("The char is: \(c)")
    
    if c == "n" {
        c = "N"
    }
}


//
//func stringByRemovingAll(characters: [Character]) -> String {
//    return String(self.characters.filter({ !characters.contains($0)}))
//}
//
//func stringByRemovingAll(subStrings: [String]) -> String {
//    var resultString = self
//    subStrings.map(resultString = resultString.stringByReplacingOccurencesOfString($0, withString: ";"))
//    return resultString
//}


extension String {
    func strinByRemovingAll(characters: [Character]) -> String {
        return String(self.characters.filter({!characters.contains($0)}))
    }
    func stringByRemovingAll(subStrings: [String]) -> String {
        var resultString = self
        subStrings.map {resultString = resultString.stringByReplacingOccurencesOfString($0, withString: "")}
        return resultString
    }
    
}




















