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
    
    var counter: Int = 1
    var c: Int = 0
    var tmp: Int = 0

    mutating func loadData() {
        guard let note1 = Note(id: 0, name: "Go to work") else {
            fatalError("Unable to instantiate note1")
        }

        guard let note2 = Note(id: 1, name: "Study") else {
            fatalError("Unable to instantiate note2")
        }
        notes += [note1, note2]
        
        print("The id of note \(note1.name) is \(note1.id)")
        print("The id of note \(note2.name) is \(note2.id)")
        
    }
    
    mutating func addNote(_ newNote: Note) {
        // adding the new note into the array of notes
        /* returning the whole array */
        notes += [newNote]
    }
    
    mutating func deleteNote(deletedNote: Note) {
        notes.remove(at: deletedNote.id)
    }
    
    func notesNumber() -> Int {
        return notes.count
    }
    
    mutating func incrementIdentifierByOne() -> Int {
        counter = counter + 1
        return counter
    }
    
    
}
