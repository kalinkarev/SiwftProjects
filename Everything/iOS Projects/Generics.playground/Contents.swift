//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
print("someInt is: \(someInt) and anotherInt is: \(anotherInt)")

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
print("someString is: \(someString) and anotherString is: \(anotherString)")


struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
print("The stack is: \(stackOfStrings)")
stackOfStrings.push("dos")
print("The stack is: \(stackOfStrings)")
stackOfStrings.push("tres")
print("The stack is: \(stackOfStrings)")
stackOfStrings.push("cuatro")
print("The stack is: \(stackOfStrings)")

let fromTheTop = stackOfStrings.pop()
print("The stack is: \(stackOfStrings)")

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem).")
}


//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//    // function body goes here
//}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}


//func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])


protocol Container {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct StackInt: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//struct Stack1<Element>: Container {
//    // original Stack<Element> implementation
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//    // conform to the Container protocol
//    mutating func append(_ item: Element) {
//        self.push(item)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//}


//extension Array: Container {}
//
//protocol SuffixableContainer: Container {
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//    func suffix(_ size: Int) -> Suffix
//}
//
//extension Stack: SuffixableContainer {
//    func suffix(_ size: Int) -> Stack {
//        var result = Stack()
//        for index in (count - size)..<count {
//            result.append(self[index])
//        }
//        return result
//    }
//    // Inferred that Suffix is Stack.
//}
//var stackOfInts = Stack<Int>()
//stackOfInts.append(10)
//stackOfInts.append(20)
//stackOfInts.append(30)
//let suffix = stackOfInts.suffix(2)


func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    
    // Check that both containers contain the same number of items.
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    // Check each pair of items to see if they`re equivalent.
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    // All items match, so return true.
    return true
}
var stackStrings = Stack<String>()
stackStrings.push("uno")
stackStrings.push("dos")
stackStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

//if allItemsMatch(stackStrings, arrayOfStrings) {
//    print("All items match.")
//} else {
//    print("Not all items match.")
//}

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

if stackStrings.isTop("tres") {
    print("Top element is tres.")
} else {
    print("Top element is something else.")
}

struct NotEquatable { }
var notEquatableStack = Stack<NotEquatable>()
let notEquatableValue = NotEquatable()
notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue) // Error

extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1 && self[0] == item
    }
}

//if [9, 9, 9].starts(with: 42) {
//    print("Starts with 42.")
//} else {
//    print("Starts with something else.")
//}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
//print([1260.0, 1200.0, 98.6, 37.0].average())

extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}





























