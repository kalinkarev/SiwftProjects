//: Playground - noun: a place where people can play

import UIKit

struct Note {
    var id: Int
    var name: String
}

var notes: [Note] = []

var note1 = Note(id: 0, name: "study")
var note2 = Note(id: 1, name: "train")
var note3 = Note(id: 2, name: "sleep")
var note4 = Note(id: 3, name: "relax")

print("The first note name is: \(note1.name) and has id: \(note1.id)")
print("The second note name is: \(note2.name) and has id: \(note2.id)")
print("The third note name is: \(note3.name) and has id: \(note3.id)")
print("The fourth note name is: \(note4.name) and has id: \(note4.id)")

notes += [note1]
print("The array of notes is: \(notes)")
notes += [note2]
print("The array of notes is: \(notes)")
notes += [note3]
print("The array of notes is: \(notes)")
notes += [note4]
print("The array of notes is: \(notes)")

func editNote(_ noteEdit: Note) {
    print("The edited note id is: \(noteEdit.id)")
    print("The edited note name is: \(noteEdit.name)")
    
    if let index = notes.index(where: {$0.id == noteEdit.id}) {
        notes[index].name = "Go to fitness"
    }
}

editNote(note2)
print("The array of notes is: \(notes)")
editNote(note1)
print("The array of notes is: \(notes)")
editNote(note4)
print("The array of notes is: \(notes)")


var number: Int = 69
print("The number variable has value: \(number)")

var sentence: String = "Husten, we have a huge problem"
print("The sentence is: \(sentence)")



let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1f496}"
let faceWithTearsOfJoy = "\u{1f602}"
let winkingFace = "\u{1f60b}"
var smokingSymbol = "\u{1f6ac}"
var noSmokingSymbol = "\u{1f6ad}"

print("Here is not allowed smoking: \(noSmokingSymbol)")
print("Here you can smoke: \(smokingSymbol)")
print("I'm glad to see you: \(winkingFace, faceWithTearsOfJoy)")

let WC = "\u{1f6be}"
print("You can go to the OO(double zero): \(WC)")
let sumOfHearts: String = blackHeart + sparklingHeart

let whiteSmilingFace = "\u{263a}"
let sheHodqNaMore = "\u{2693}"
let attention = "\u{26a0}"
let vlizanetoZabraneno = "\u{26d4}"





