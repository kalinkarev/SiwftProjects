//: Playground - noun: a place where people can play

import UIKit

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
//                word = word.changeSymbol(dictionarySearch: dict)
                word = word.changeWord(dictionarySearch: dict)
//                word = word.changeWord(dictionarySearch: dict)
                word.append(self[index])
                final.append(word)
                word = ""
            }
        }
//        word = word.changeSymbol(dictionarySearch: dict)
        word = word.changeWord(dictionarySearch: dict)
//        word = word.changeWord(dictionarySearch: dict)
        final.append(word)
        return final
    }
    
    func changeSymbol(dictionarySearch:[String:String]) -> String {
        var changeWord = self
        
        for (key, value) in dictionarySearch {
            if changeWord == key {
                changeWord = value
            }
        }
        return changeWord
    }
    
    func changeWord(dictionarySearch: [String:String]) -> String {
        var changeWord = self

        if dictionarySearch.keys.contains(changeWord) {
            print("Have found \(changeWord)")
            print("The value of the found word is: \(String(describing: dictionarySearch[changeWord]!))")

            changeWord = dictionarySearch[changeWord] ?? ""
//            return dictionarySearch[changeWord]
//            changeWord = dictionarySearch[changeWord]!
        }

        return changeWord
    }
}


print("")
var prices:[String:Double] = ["Chips":2.99, "Donuts":1.89, "Juice":3.99]

func costOfItem(item: String) -> Double? {
    if let available = prices[item] {
        if available == 0 {
            return nil
        } else {
            return prices[item]
        }
    } else {
        return nil
    }
}
var new = costOfItem(item: "Donuts")

var products:[String:String] = ["new":"old", "first":"last", "next":"previous"]
func nameOfValue(key: String) -> String? {
    if let available = products[key] {
        if available.isEmpty {
            return nil
        } else {
            return products[key]
        }
    } else {
        return nil
    }
}
var test = nameOfValue(key: "first")

var dictSearch:[String:String] = ["first":"last", "next":"previous", "new":"old", "last":"this"]
var userInput = """
                    he took the first place on the competition last one
                    she is the next new
                    """
var result = userInput.changeInput(dict: dictSearch)
print("")
print("The output is:")
print(result)


var testArr = ["new", "old", "first", "last", "searched", "finded"]

func printAnArray(arr:[String]) {
    print("The array is: \(arr)")
}
printAnArray(arr: testArr)

print("")

func iterateArray(arr:[String]) {
    for i in 0..<arr.count {
        print("The \(i + 1) element has value: \(arr[i])")
    }
}
iterateArray(arr: testArr)


//let countryCodes:[String:String] = ["BR":"Brazil", "GH":"Ghana", "JP":"Japan"]
//let index = countryCodes.index(forKey: "JP")

//print("Country code for \(countryCodes[index!].value): '\(countryCodes[index!].key)'.")


//extension Dictionary {
//    func keyedOrFirstValue(key: Key) -> Value? {
//        return self[key] ?? first(self.values)
//    }
//}

//let d = ["one":"red", "two":"blue"]

//d.keyedOrFirstValue(key: "one")

//let imagePaths:[String:String] = [
//    "star":"/glyphs/star.png",
//    "portrait":"/images/content/portrait.jpg",
//    "spacer":"/images/shred/spacer.gif"
//]
//for (name, path) in imagePaths {
//    print("The path to '\(name)' is '\(path)'.")
//}

//let glyphIndex = imagePaths.first(where: { $0.value.hasPrefix("/glyphs") })

//if let index = glyphIndex {
//    print("The '\(imagePaths)' image is a glyph.")
//} else {
//    print("No glyphs found!")
//}

//print(imagePaths[glyphIndex])

print("")
var testDicitonary:[String:String] = ["CHIPS":"chips", "JUICE":"juice", "DONUTS":"donuts"]
func showProduct(item: String) -> String? {
    if let available = testDicitonary[item] {
        if available.isEmpty {
            return nil
        } else {
            return testDicitonary[item]
        }
    } else {
        return nil
    }
}

for (key, _) in testDicitonary.sorted(by: <) {
    print("The value is: \(showProduct(item: key)!)")
}
