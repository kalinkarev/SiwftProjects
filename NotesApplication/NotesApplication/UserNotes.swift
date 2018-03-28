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
    
    mutating func loadData() {
//        guard let note1 = Note(id: 0, name: "Go to work") else {
//            fatalError("Unable to instantiate note1")
//        }
//
//        guard let note2 = Note(id: 1, name: "Study") else {
//            fatalError("Unable to instantiate note2")
//        }
//        notes += [note1, note2]
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
}
