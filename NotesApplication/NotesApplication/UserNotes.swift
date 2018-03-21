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
    
    // func myArrayFunc(inputArray:Array<Int>) -> Array<Int> {}
    
    func addNote(newNote: Note) -> Array<Note> {
        return notes
    }

    func deleteNote(deletedNote: Note) -> Array<Note> {
        return notes
    }
    
//    mutating func addNote(newNote: Note) {
//        // need to make the new value of Note to be inputted into the array
//        notes += [newNote]
//    }

//    func deleteNote(deletedNote: Note) {
//
//    }
    
//    func deleteNote(deletedNote: Note) -> Note {
//        return deletedNote
//    }
    
}
