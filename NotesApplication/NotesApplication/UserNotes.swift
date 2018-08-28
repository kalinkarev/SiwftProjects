//
//  UserNotes.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/19/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

struct UserNotes {
    // Array for storing the notes (all the user notes are stored here)
    var notes: [Note] = []

    private var counter: Int = 1

    mutating func addNote(_ newNote: Note) {
        // adding the new note into the array of notes
        if (notes.isEmpty) {
            let newID = 0
            var localNewNote = newNote
            localNewNote.id = newID
            notes += [localNewNote]
            print("The new note has name: \(localNewNote.name) and id: \(localNewNote.id)")
        } else {
            let lastNote = notes.last
//            print("The last note is: \(String(describing: lastNote))")
            let lastID = lastNote?.id
//            print("The last id is: \(String(describing: lastID))")
            var localNewNote  = newNote
            localNewNote.id = lastID! + 1
            notes += [localNewNote]
            print("The new note has name: \(localNewNote.name) and id: \(localNewNote.id)")
        }
        printTheArray()
    }

    mutating func deleteNote(_ deletedNote: Note) {
        // Removing the selected note (the user selects a note and it should be removed | we are using the removement by id |)
        notes.remove(at: deletedNote.id)

        printTheArray()
    }

    mutating func editNote(_ selectedNote: Note) {
        printTheArray()

        print("The selected note`s id is: \(selectedNote.id)")
        print("THe selected note`s name is: \(selectedNote.name)")

        notes.remove(at: selectedNote.id)
        printTheArray()

        let newNote = selectedNote

        notes.insert(newNote, at: selectedNote.id)
        printTheArray()
    }

    func notesNumber() -> Int {
        return notes.count
    }

//    mutating func incrementIdentifierByOne() -> Int {
//        counter = counter + 1
//        return counter
//    }

    func printTheArray() {
        print("The array is: \(notes)")
    }

//    func passTheArray() -> [Note] {
//        return notes
//    }
}
