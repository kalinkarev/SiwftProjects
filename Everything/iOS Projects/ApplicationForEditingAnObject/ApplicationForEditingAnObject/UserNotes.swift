//
//  UserNotes.swift
//  ApplicationForEditingAnObject
//
//  Created by Kalin Karev on 5/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct UserNotes {
    var notes: [NoteObject] = []
    
    mutating func loadData() {
        guard let note1 = NoteObject(id: 0, title: "getting up") else {
            fatalError("Unable to instantiate note1")
        }
        guard let note2 = NoteObject(id: 1, title: "having breakfast") else {
            fatalError("Unable to instantiate note2")
        }
        guard let note3 = NoteObject(id: 2, title: "going to work") else {
            fatalError("Unable to instantiate note3")
        }
        notes += [note1, note2, note3]
    }
    
    mutating func editNote(_ noteEdit: NoteObject) {
        if let index = notes.index(where: {$0.id == noteEdit.id}) {
            notes[index].title = noteEdit.title
        }
        printTheArray()
    }
    
    func numberOfNotes() -> Int {
        return notes.count
    }
    
    func printTheArray() {
        print("The array is: \(notes)")
    }
}
