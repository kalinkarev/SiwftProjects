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
    
    mutating func loadData() {
        guard let note1 = Note(id: 0, name: "Go to work") else {
            fatalError("Unable to instantiate note1")
        }

        guard let note2 = Note(id: 1, name: "Study") else {
            fatalError("Unable to instantiate note2")
        }
        notes += [note1, note2]

        print("The note name: \(note1.name) and id: \(note1.id)")
        print("The note name: \(note2.name) and id: \(note2.id)")
    }
    
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
            print("The last note is: \(String(describing: lastNote))")
            let lastID = lastNote?.id
            print("The last id is: \(String(describing: lastID))")
            var localNewNote  = newNote
            localNewNote.id = lastID! + 1
            notes += [localNewNote]
            print("The new note has name: \(localNewNote.name) and id: \(localNewNote.id)")
        }
    }
    
    mutating func deleteNote(deletedNote: Note) {
        // Removing the selected note (the user selects a note and it should be removed | we are using the removement by id |)
        notes.remove(at: deletedNote.id)
    }
    
    /*
        Implement the functionality of editing a note
     */
    mutating func editNote(_ editedNote: Note) {
        let nameOfTheEditingNote = editedNote.name
        let idOfTheEditingNote = editedNote.id
        
        print("The name of the selected note is: \(nameOfTheEditingNote)")
        print("The id of the selected note is: \(idOfTheEditingNote)")

        // Update the context of the element without changing the id
        /*
                ...
                ...
                ...
          */
        
    }
    
    func notesNumber() -> Int {
        return notes.count
    }
    
    mutating func incrementIdentifierByOne() -> Int {
        counter = counter + 1
        return counter
    }
}
