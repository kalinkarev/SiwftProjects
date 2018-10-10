//: Playground - noun: a place where people can play

import UIKit

var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
print("letters is of type Set<Character> with \(letters.count) items.")

letters = []
print("letters is of type Set<Character> with \(letters.count) items.")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres1: Set = ["Rock", "Classical", "Hip hop"]

print("I have \(favoriteGenres1.count) favorite music genres.")

if favoriteGenres1.isEmpty {
    print("As far as music goes, I`m not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres1.insert("Jazz")

if let removedGenre = favoriteGenres1.remove("Rock") {
    print("\(removedGenre)? I`m over it.")
} else {
    print("I never much cared for that.")
}

if favoriteGenres1.contains("Funk") {
    print("I get up in the good foot.")
} else {
    print("It`s too funky in here.")
}

for genre in favoriteGenres1.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// TutorialPoint

var someSet = Set<Character>()
someSet.count
someSet.insert("c")
someSet.isEmpty
someSet.count
someSet.remove("c")
someSet.count
someSet.contains("c")

someSet.insert("a")
someSet.insert("b")
someSet.insert("c")
someSet.insert("d")
someSet.insert("e")
someSet.insert("f")
someSet.insert("g")
someSet.insert("h")
someSet.insert("i")
someSet.insert("j")
someSet.insert("k")
someSet.insert("l")
someSet.insert("m")
someSet.insert("n")
someSet.insert("o")
someSet.insert("p")
someSet.insert("q")

for items in someSet {
    print(items)
}

for items in someSet.sorted() {
    print(items)
}

let evens: Set = [10, 12, 14, 16, 18]
let odds: Set = [5, 7, 9, 11, 13]
let primes = [2, 3, 5, 7]
odds.union(evens).sorted()
odds.intersection(evens).sorted()
odds.subtracting(primes).sorted()
