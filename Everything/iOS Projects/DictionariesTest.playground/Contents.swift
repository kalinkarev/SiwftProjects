//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var someDict: [Int: String] = [1:"One", 2:"Two", 3:"Three"]

var cities = ["Delhi", "Bangalore", "Hyderabad", "Dehradun", "Bihar"]

var Distance = [2000, 10, 620]

let cityDistanceDict = Dictionary(uniqueKeysWithValues: zip(cities, Distance))

var closeCities = cityDistanceDict.filter({ $0.value < 1000 })
print(closeCities)

var GroupedCities = Dictionary(grouping: cities) { $0.first! }
print(GroupedCities)

var someVar = someDict[1]

for i in 0..<someDict.count {
    print("Value of key = \(i+1) is \(someDict[i+1]!)")
}

var oldVal = someDict.updateValue("New value of one", forKey: 1)
for i in 0..<someDict.count {
    print("Value of key = \(i+1) is \(someDict[i+1]!)")
}

print("")
print("New test:")

var dict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
var removedValue = dict.removeValue(forKey: 2)

for i in 0...dict.count {
    print("Value of key = \(i+1) is \(String(describing: dict[i+1]))")
}

var iterateDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

for (index, keyValue) in iterateDict.enumerated() {
    print("Dictionary key \(index) - Dictionary value \(keyValue)")
}

let dictKeys = [Int](iterateDict.keys)
let dictValues = [String](iterateDict.values)

print("Print Dictionary Keys: ")
for (key) in dictKeys {
    print(key)
}

print("Print Dictionary Values")
for value in dictValues {
    print(value)
}

var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
var someDict2:[Int:String] = [4:"Four", 5:"Five"]
var someDict3:[Int:String] = [Int:String]()

print("Total items in someDict1 = \(someDict1.count)")
print("Total items in someDict2 = \(someDict2.count)")

print("someDict1 = \(someDict1.isEmpty)")
print("someDict2 = \(someDict2.isEmpty)")
print("someDict3 = \(someDict3.isEmpty)")






extension String {
    func changeInput(dict:[String:String]) -> String {
        var word = ""
        var final = ""
        
        let spaceValue = 32
        guard let u = UnicodeScalar(spaceValue) else {
            fatalError("Problems with the space value")
        }
        let charSpace = Character(u)
        
        for index in self.indices {
            if self[index] > charSpace {
                word.append(self[index])
            } else {
                word = changeSymbol(input: word, dictionarySearch: dict)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
        word = changeSymbol(input: word, dictionarySearch: dict)
        final.append(word)
        return final
    }
    
    func changeSymbol(input: String, dictionarySearch: [String:String]) -> String {
        var changeInput = input
        
        for (key, value) in dictionarySearch {
            if changeInput == key {
                changeInput = value
            }
        }
        return changeInput
    }
}

var dictSearch:[String:String] = ["first":"last", "next":"previous"]
var userInput = """
                    he took the first place of the competition
                    she is next
                    """
var result = userInput.changeInput(dict: dictSearch)
print("")
print("The output is:")
print(result)

var arr: [String] = ["hello", "how", "are"]

for i in 0..<arr.count {
    print("The i \(i) element of the array is \(arr[i])")
}

print("")

var dictTest:[String:String] = ["1":"One", "2":"Two", "3":"Three"]

func printDictionary(dictInput:[String:String]) {
    print("The dictionary is: \(dictInput)")
}

printDictionary(dictInput: dictTest)

func printKeyValue(dictInput: [String : String]) {
    for (key, value) in dictInput.sorted(by: <) {
        print("The key is: \(key) and has value: \(value)")
    }
}

printKeyValue(dictInput: dictTest)


//var my_variable = (1 > 2) ? print("Bigger") : print("Smaller")
//
//print("The variable is: \(my_variable)")
//
//let fileExists = true
//print("something " + (fileExists ? "exists": "does not exists"))

//let check = (1 > 2)
//
//print("The truth is: " + (check ? "bigger" : "smaller"))

//print("The true is that: " + (1 > 2) ? "bigger" : "smaller")

print("The truth is: " + ((1 > 2) ? "the first is bigger" : "the second is bigger"))

print("The bigger is: \((5 > 6) ? "the first is bigger" : "the second is bigger")")

var test = 12 < 14
print("\((test) ? "true" : "false")")

let caseTrue = "The comparison is true"
let caseFalse = "The comparison is false"

print("\((test) ? caseTrue : caseFalse)")

print("\((test) ? "the first number is bigger(IF)" : "the first number is bigger(ELSE)")")

var newArr:[String] = ["apple", "pear", "cherry", "peach", "apricot"]

func printArray(arr:[String]) {
    print("The array is: \(arr)")
}

printArray(arr: newArr)

for i in 0..<newArr.count {
    print("The element \(i + 1) of the array has value: \(newArr[i])")
}
