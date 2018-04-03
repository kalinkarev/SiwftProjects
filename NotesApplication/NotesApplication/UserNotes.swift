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
    private var tmp: Int = 1
    var saveValue: Int = 0
    var identifier: Int = 0
    
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
        
        let lastNote = notes.last
        print("The last note is: \(String(describing: lastNote))")
        
        let lastID = lastNote?.id
        print("The last id is: \(String(describing: lastID))")
        
        var localNewNote = newNote
        localNewNote.id = lastID! + 1
        
        
//        if let lastNote = notes.last {
//            print("The last note is: \(lastNote)")
//
//            var lastID = lastNote.id
//            newNote.id = lastID + 1
//
//            func someFunction (parameterName:Int) {
//                var localParameterName = parameterName
//                // Now use localParameterName
//                localParameterName = 2;
//                var a = localParameterName;
//            }
            
//            newNote.id = lastNote.id + 1
//        }
        
        notes += [localNewNote]
        
        print("The new note has name: \(localNewNote.name) and id: \(localNewNote.id)")
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
    
    mutating func printValues() {
        print("The value of tmp is: \(tmp)")
        print("The value of the save value is: \(saveValue)")
        if (identifier == counter) {
            identifier += 1
            print("The value of the identifier of the new note is \(identifier)")
        }
        // How to make the identifier to be incremented By One each time the user save a note
    }
}
