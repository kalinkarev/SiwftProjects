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
        notes += [newNote]
        return notes
    }

    var noteThatToBeDeleted = Note.init(name: "fitness")
    
    mutating func deleteNote(deletedNote: Note) -> Array<Note> {
        for i in notes {
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
