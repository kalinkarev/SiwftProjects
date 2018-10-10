//
//  ManageNote.swift
//  ProjectEveryThingNeededForNoteApplication
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageNote {
    var notes: [Note] = []
    
    func showNotes() {
        print("The array of notes is: \(notes)")
    }
    
    func numberOfNotes() -> Int {
        return notes.count
    }
    
    mutating func loadNotes() {
        let note1 = Note(id: 0, title: "Buy Milk")
        let note2 = Note(id: 1, title: "Do My Homework")
        
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
        showNotes()
    }
    
    mutating func deleteNote(_ deleteNote: Note) {
        notes.remove(at: deleteNote.id)

        showNotes()
    }
    
    mutating func editNote(_ selectedNote: Note) {
        showNotes()
        
        print("The selected note`s id is: \(selectedNote.id)")
        print("The selected note`s title is: \(selectedNote.title)")
        
        notes.remove(at: selectedNote.id)
        showNotes()
        
        let newNote = selectedNote
        
        notes.insert(newNote, at: selectedNote.id)
        showNotes()
        
        print("The array is: \(notes)")
    }
}
