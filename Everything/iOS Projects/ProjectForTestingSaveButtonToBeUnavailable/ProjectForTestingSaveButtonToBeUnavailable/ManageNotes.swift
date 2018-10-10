//
//  ManageNotes.swift
//  ProjectForTestingSaveButtonToBeUnavailable
//
//  Created by Kalin Karev on 8/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageNotes {
    var notes: [Note] = []
    
    func numberNotes() -> Int {
        return notes.count
    }
    
    func printNotes() {
        print("The array of notes is: \(notes)")
    }
    
    mutating func loadInitialNotes() {
        let note1 = Note(id: 0, name: "Do my homework")
        let note2 = Note(id: 1, name: "Buy milk")

        notes += [note1, note2]
    }
    
    mutating func addNote(_ newNote: Note) {
        if notes.isEmpty {
            let newID = 0
            var localNewNote = newNote
            localNewNote.id = newID
            notes.append(localNewNote)
        } else {
            let lastNote = notes.last
            let lastID = lastNote?.id
            
            if let lastNoteID = lastID {
                var localNewNote = newNote
                localNewNote.id = lastNoteID + 1
                notes.append(localNewNote)
          
            }
        }
        printNotes()
    }
    
    mutating func deleteNote(_ deleteNote: Note) {
        notes.remove(at: deleteNote.id)

        printNotes()
    }
    
    mutating func editNote(_ editNote: Note) {
        printNotes()
        
        print("The selected note`s id is: \(editNote.id)")
        print("The selected note`s name is: \(editNote.name)")
        
        notes.remove(at: editNote.id)
        printNotes()
        
        let newNote = editNote
        
        notes.insert(newNote, at: editNote.id)
        printNotes()
        
        print("The array is: \(notes)")
    }
}
