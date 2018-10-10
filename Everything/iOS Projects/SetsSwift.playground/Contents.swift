//: Playground - noun: a place where people can play

import UIKit

let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {
    print("No thanks, too sweet.")
}

var primes: Set = [2, 3, 5, 7]

// Tests whether primes is a subset of a Range<Int>
print(primes.isSubset(of: 0..<10))

// Perfroms an intersection with an Array<Int>
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

let laterPrimesSet = Set(morePrimes.filter { $0 > 10 })

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")

letters = []
print("letters is of type Set<Character> with \(letters.count) items.")

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I`m not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")
print("The set is: \(favoriteGenres)")

if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I`m over it.")
} else {
    print("I never much cared for that.")
}

//favoriteGenres.removeAll()
print("The set is: \(favoriteGenres)")

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It`s too funky in here.")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

func printSet(newSet: Set<Character>) {
    print("The set is: \(newSet.sorted())")
}

var characters = Set<Character>()
printSet(newSet: characters)

characters.insert("a")
printSet(newSet: characters)

characters.insert("b")
printSet(newSet: characters)

characters.insert("c")
printSet(newSet: characters)



let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


let numbersA: Set = [1, 3, 5, 7, 9, 11, 13, 15]
let numbersB: Set = [0, 2, 4, 6, 8, 10, 12, 14]

func printSets(newSet: Set<Int>) {
    print("The set is: \(newSet.sorted())")
}

printSets(newSet: numbersA)
printSets(newSet: numbersB)

var intersectionSet = numbersA.intersection(numbersB)
printSets(newSet: intersectionSet)

var symmetricDifferenceSet = numbersA.symmetricDifference(numbersB)
printSets(newSet: symmetricDifferenceSet)

var unionSet = numbersA.union(numbersB)
printSets(newSet: unionSet)

var subtractingSet = numbersA.subtracting(numbersB)
printSets(newSet: subtractingSet)


var firstSet: Set = [1, 2, 3, 4, 5, 7, 9]
var secondSet: Set = [0, 1, 2, 3, 4, 5, 6, 8]

var newIntersectionSet = firstSet.intersection(secondSet)
print("The intersection between the two sets is: \(newIntersectionSet.sorted())")

var newSymmetricDifferenceSet = firstSet.symmetricDifference(secondSet)
print("The symmetricDifference between the two sets is: \(newSymmetricDifferenceSet.sorted())")

var newUnionSet = firstSet.union(secondSet)
print("The union between the two sets is: \(newUnionSet.sorted())")

var newSubtractingSet = firstSet.subtracting(secondSet)
print("The subtraction between the two sets is: \(newSubtractingSet.sorted())")

// FOR EACH LOOP
let numberWords = ["one", "two", "three"]
for word in numberWords {
    print(word)
}

print("------------------------------------")

numberWords.forEach { word in
    print(word)
}










