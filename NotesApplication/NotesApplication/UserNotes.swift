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
    
    mutating func addNote(newNote: Note) -> Array<Note> {
        // adding the new note into the array of notes
        /* returning the whole array */
        notes += [newNote]
        return notes
    }

    var noteThatToBeDeleted = Note.init(name: "fitness")
    
    mutating func deleteNote(deletedNote: Note) -> Array<Note> {
        // creating a loop for iterating over the whole array
        for i in notes {
            // comparing the two names of the searched item and the items, which are in the array
            if i.name == noteThatToBeDeleted?.name {
                print("The note \(String(describing: noteThatToBeDeleted?.name)) is found in the array")
  
                let indexOfNote = notes.index(of: i)
                print("The index of the searched note is: \(String(describing: indexOfNote))")
                
                notes.remove(at: indexOfNote!)
            }
        }
        return notes
    }
}
