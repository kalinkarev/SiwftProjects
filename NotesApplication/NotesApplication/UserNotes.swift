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
    
    mutating func addNote(newNote: Note) -> Array<Note> {
        
        notes += [newNote]
        
        return notes
    }

//    var noteForDelete = "fitness" //= Note(name: "fitness")
    var noteThatToBeDeleted = Note.init(name: "fitness")
    
    func deleteNote(deletedNote: Note) -> Array<Note> {
        
        for i in notes {
            
            // if saveButton == (sender as? UIBarButtonItem)

            if i.name == noteThatToBeDeleted?.name {
                
            }
        }
            
//            if i.name == noteForDelete {
//                print("The is the note \(noteForDelete) in the array")
//
//                //let indexOfNote = notes.index(of: i)
//                let indexOfNote = notes.index(of: i)
//                print("The index of the searched item is: \(indexOfNote)")
//
//                notes.remove(at: indexOfNote)
//            }
//        }
        
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
