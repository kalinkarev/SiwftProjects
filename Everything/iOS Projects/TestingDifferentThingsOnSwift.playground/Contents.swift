//: Playground - noun: a place where people can play

import UIKit

enum SomeEnumeration {
    // enumeration definition goes here
}

// Four main points of a compass:
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
print("The direction is: \(directionToHead)")
directionToHead = .east
print("The direction is: \(directionToHead)")

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
//case .west:
//    print("Where the skies are blue")
default:
    print("No such direction")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
print("The barcode is: \(productBarcode)")

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print("The barcode is: \(productBarcode)")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(_):
    print("QR code: \(productBarcode).")
//default:
//    print("No such option")
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum PlanetNames: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

print(PlanetNames.mercury.rawValue)
print(PlanetNames.venus.rawValue)
print(PlanetNames.earth.rawValue)
print(PlanetNames.mars.rawValue)
print(PlanetNames.jupiter.rawValue)
print(PlanetNames.saturn.rawValue)
print(PlanetNames.uranus.rawValue)
print(PlanetNames.neptune.rawValue)

enum Compass: String {
    case north, south, east, west
}

let earthsOrder = PlanetNames.earth.rawValue
let sunsetDirection = Compass.west.rawValue

let possiblePlanet = PlanetNames(rawValue: 7)
print(possiblePlanet!)

let positionToFind = 11
if let somePlanet = PlanetNames(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not safe place for humans")
    }
} else {
    print("There isn`t a planet at position \(positionToFind)")
}

//enum ArithmeticExpression {
//    case number(Int)
//    indirect case addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
//}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print()

print(sum)
print(product)

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))


indirect enum Calculator {
    case number(Int)
    case add(Calculator, Calculator)
    case subtract(Calculator, Calculator)
    case multiply(Calculator, Calculator)
    case divide(Calculator, Calculator)
}

func calculate(_ exp: Calculator) -> Int {
    switch(exp) {
    case let .number(value):
        return value
    case let .add(first, second):
        return calculate(first) + calculate(second)
    case let .subtract(first, second):
        return calculate(first) - calculate(second)
    case let .multiply(first, second):
        return calculate(first) * calculate(second)
    case let .divide(first, second):
        return calculate(first) / calculate(second)
    }
}

let two = Calculator.number(1)
let three = Calculator.number(2)
let five1 = Calculator.number(5)

//print(calculate(Calculator.add(one, two)))
//print(calculate(Calculator.subtract(one, two)))
//print(calculate(Calculator.multiply(one, two)))
//print(calculate(Calculator.divide(one, two)))

let addition = Calculator.add(two, three)
let subtraction = Calculator.subtract(five1, two)

print(calculate(Calculator.multiply(addition, subtraction)))


var newTestDictionary: [Int:String] = [1:"One", 3:"Three", 5:"Five", 7:"Seven", 9:"Nine", 11:"Eleven", 0:"Zero", 2:"Two", 4:"Four", 6:"Six", 8:"Eight", 10:"Ten", 12:"Twelve"]

for (key, value) in newTestDictionary {
    print("The key: \(key) has value: \(value)")
}

var arrKeys = Array(newTestDictionary.keys)
print("The array of keys in the dictionary is: \(arrKeys)")

var arrValues = Array(newTestDictionary.values)
print("The array of values in the dictionary is: \(arrValues)")


let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

var primes: Set = [2, 3, 5, 7]

// Tests whether primes is a subset of Range<Int>
print(primes.isSubset(of: 0..<10))

// Performs an intersection with an Array<Int>
let favoriteNumbers = [5, 7, 15, 21]
print(primes.intersection(favoriteNumbers))

if primes.isEmpty {
    print("No primes!")
} else {
    print("We have \(primes.count) primes.")
}

let primeSum = primes.reduce(0, +)

let primeStrings = primes.sorted().map(String.init)

for number in primes {
    print(number)
}

let morePrimes = primes.union([11, 13, 17, 19])

let laterPrimes = morePrimes.filter { $0 > 10 }
print(laterPrimes)

let laterPrimesSet = Set(morePrimes.filter { $0 > 10 })
print(laterPrimesSet)


struct Book {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

var arrayBooks: [Book] = []
print("The array is: \(arrayBooks)")

var book1 = Book(id: 0, name: "BOOK1")
arrayBooks.append(book1)
print("The array is: \(arrayBooks)")
var book2 = Book(id: 1, name: "BOOK2")
arrayBooks.append(book2)
print("The array is: \(arrayBooks)")
var book3 = Book(id: 2, name: "BOOK3")
arrayBooks.append(book3)
print("The array is: \(arrayBooks)")

arrayBooks = arrayBooks.map {
    var mutableBook = $0

    if $0.id == 1 {
        mutableBook.name = "THE SECOND BOOK"
    }

    return mutableBook
}

print("The changed array is: \(arrayBooks)")

print("\n")

struct Game {
    var id: Int
    var name: String
    var scoredPoints: Int
    var dictionaryHolePoints: [Int:Int]

    init(id: Int, name: String, scoredPoints: Int, dictionaryHolePoints: [Int:Int]) {
        self.id = id
        self.name = name
        self.scoredPoints = scoredPoints
        self.dictionaryHolePoints = dictionaryHolePoints
    }
}

func countPoints(dictHolePoints:[Int:Int]) -> Int {
    var sum: Int = 0

    for (key, value) in dictHolePoints {
        print("The key: \(key) in the dictionary has value: \(value)")
        sum += value
    }

    return sum
}

var arrayGames = [Game]()
print("The array is: \(arrayGames)")

var game1 = Game(id: 0, name: "game1", scoredPoints: 45, dictionaryHolePoints: [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9])
arrayGames.append(game1)
print("The array is: \(arrayGames)")

var game2 = Game(id: 1, name: "game2", scoredPoints: 55, dictionaryHolePoints: [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:10])
arrayGames.append(game2)
print("The array is: \(arrayGames)")

var game3 = Game(id: 2, name: "game3", scoredPoints: 66, dictionaryHolePoints: [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:10, 11:11])
arrayGames.append(game3)
print("The array is: \(arrayGames)")

arrayGames.forEach { game in
    print(game)
}

arrayGames = arrayGames.map {
    var mutableGame = $0

    if $0.id == 2 {
        mutableGame.name = "Third game"
        mutableGame.scoredPoints = 78
        mutableGame.dictionaryHolePoints = [1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:10, 11:11, 12:12]
    }

    return mutableGame
}

arrayGames.forEach { game in
    print(game.id)
    print(game.name)
    print(game.scoredPoints)
    print(game.dictionaryHolePoints.sorted(by: <))
}

print("Dress Well")


















