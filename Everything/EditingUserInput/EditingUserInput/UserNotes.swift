//
//  UserNotes.swift
//  EditingUserInput
//
//  Created by Kalin Karev on 5/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct UserNotes {
    var notes: [Note] = []
    
    mutating func loadData() {
        guard let note1 = Note(id: 0, name: "Study") else {
            fatalError("Unable to instantiate note1")
        }
        guard let note2 = Note(id: 1, name: "Train") else {
            fatalError("Unable to instantiate note2")
        }
        guard let note3 = Note(id: 2, name: "Sleep") else {
            fatalError("Unable to instantiate note3")
        }
        notes += [note1, note2, note3]
        print("The note name: \(note1.name) has id: \(note1.id)")
        print("The note name: \(note2.name) has id: \(note2.id)")
        print("The note name: \(note3.name) has id: \(note3.id)")
        
        printTheArray()
    }
    
    mutating func editNote(_ noteEdit: Note) {
        print("You are in the editNote function")
        printTheArray()
        
        if let index = notes.index(where: {$0.id == noteEdit.id}) {
            notes[index].name = noteEdit.name
        }
        print(notes)
    }
    
    func printTheArray() {
        print("The array of notes is: \(notes)")
    }
}
