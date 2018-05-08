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
//        guard let note1 = Note(id: 0, name: "Go to work") else {
//            fatalError("Unable to instantiate note1")
//        }
//
//        guard let note2 = Note(id: 1, name: "Study") else {
//            fatalError("Unable to instantiate note2")
//        }
//        notes += [note1, note2]
//
//        print("The note name: \(note1.name) and id: \(note1.id)")
//        print("The note name: \(note2.name) and id: \(note2.id)")
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
//            print("The last note is: \(String(describing: lastNote))")
            let lastID = lastNote?.id
//            print("The last id is: \(String(describing: lastID))")
            var localNewNote  = newNote
            localNewNote.id = lastID! + 1
            notes += [localNewNote]
            print("The new note has name: \(localNewNote.name) and id: \(localNewNote.id)")
        }
        printTheArray()
    }
    
    mutating func deleteNote(_ deletedNote: Note) {
        // Removing the selected note (the user selects a note and it should be removed | we are using the removement by id |)
        notes.remove(at: deletedNote.id)
        
        printTheArray()
    }
    
    /*
        Implement the functionality of editing a note
     */
    mutating func editNote(_ editedNote: Note) {
        print("You have entered edit note")
        
        print("The edit note id is: \(editedNote.id)")
        print("The edit note name is: \(editedNote.name)")
//        The editedNote here has the new name and the same id(correct one)
        
        notes = notes.map {
            var mutableNote = $0
            if $0.id == editedNote.id {
                mutableNote.name = editedNote.name
            }
            print("The changed id of the object is: \(mutableNote.id)")
            print("The change name of the object is: \(mutableNote.name)")
            return mutableNote
        }
        
    }
    
    
    mutating func editNoteID(_ editedNote: Note) -> Int {
//        printTheArray()
//
//        print("You are entering the edit note")
//
//        notes = notes.map {
//            var mutableNote = $0
//            if ($0.id == editedNote.id) {
//                mutableNote.name = editedNote.name
//            }
//            return mutableNote
//        }
//
//        print("You are exiting the edit note")
        return editedNote.id
    }
    
    mutating func makeEdit(_ noteEdit: Note) {
        print("You are in the edit function")
        
        notes = notes.map {
            var mutableNote = $0
            
            if ($0.id == noteEdit.id) {
                mutableNote.name = noteEdit.name
            }
            return mutableNote
        }
        
        print("You are exiting the edit function")
        
        print("Iterating over the array")
        print("------------------------")
        for note in notes {
            if notes.isEmpty {
                print("No elements in the array")
            } else {
                print(note.name)
            }
        }
    }

//    mutating func editedNote(_ editedNote: Note) {
//        notes.filter({$0.id == editedNote.id}).first?.name = editedNote.name
//
//        if let row = self.upcoming.index(where: {$0.id == editedNote.id}) {
//            notes[row] = editedNote.name
//        }
//        notes = notes.map{
//            var mutableBook = $0
//            if $0.id == 1 {
//                mutableBook.title = "modified"
//            }
//            return mutableBook
//        }
//
//        notes.filter{
//            $0.id == editedNote.id
//        }.first?.name = editedNote.name
//
//        notes = notes.map{
//            var mutableNote = $0
//            if $0.id == editedNote.id {
//                mutableNote.name = editedNote.name
//            }
//
//            print("The new item is: \(mutableNote.name) and has id: \(mutableNote.id)")
//
//            return mutableNote
//        }
//
//    }
    
    func notesNumber() -> Int {
        return notes.count
    }
    
    mutating func incrementIdentifierByOne() -> Int {
        counter = counter + 1
        return counter
    }
    
    func printTheArray() {
        print("The array is: \(notes)")
    }
    
    func passTheArray() -> [Note] {
        return notes
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let viewController =  as! MainScreenViewController
        let viewController = MainScreenViewController()
        viewController.arrayNotes = self.notes
    }
    
}
