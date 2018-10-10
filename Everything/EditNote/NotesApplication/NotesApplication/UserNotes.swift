import Foundation
import UIKit

struct UserNotes {
    // Array for storing the notes (all the user notes are stored here)
    var notes: [Note] = []
    
    var newNotes: [Note] = []
    
    private var counter: Int = 1

    mutating func loadData() {
        guard let note1 = Note(id: 0, name: "Go to work") else {
            fatalError("Unable to instantiate note1")
        }
        guard let note2 = Note(id: 1, name: "Study") else {
            fatalError("Unable to instantiate note2")
        }
        notes += [note1, note2]

        print("The note name: \(note1.name) and id: \(note1.id)")
        print("The note name: \(note2.name) and id: \(note2.id)")
        newNotes = notes
        
        print("The array named newNotes has elements: \(newNotes)")
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
    
    mutating func changeNote(_ noteEdit: Note) {
        print("The edited note id is: \(noteEdit.id)")
        print("The edited note name is: \(noteEdit.name)")
//        if let index = notes.index(where:{$0.id == noteEdit.id}) {
//            notes[index].name = noteEdit.name
//        }
        
        /*
            items[2] = “👻”
            // a, b, 👻, d, e, f
            let indexPath = IndexPath(item: 2, section: 0)
            collectionView.reloadItems(at: [indexPath])
          */
        
        changeElementAtIndex(element: noteEdit, index: noteEdit.id)
        
        print("The changed array is: \(notes)")
    }

    mutating func deleteNote(_ deletedNote: Note) {
        // Removing the selected note (the user selects a note and it should be removed |we are using the removement by id|)
        notes.remove(at: deletedNote.id)
        printTheArray()
    }
    
    // Implement the functionality of editing a note
    mutating func editNoteID(_ editedNote: Note) -> Int {
        return editedNote.id
    }
    
//    mutating func editNote(_ noteEdit: Note) {
//        print("Have found the note")
//        print("The edit note id is: \(noteEdit.id)")
//        print("The edit note name is: \(noteEdit.name)")
//        print("Changing the name property of a note")
//
//        changeElementAtIndex(element: noteEdit, index: noteEdit.id)
//
//        print("The changed array is: \(notes)")
//        print("The old array is: \(newNotes)")
//
//        print("The id of the changed note is: \(noteEdit.id) and the name is: \(noteEdit.name)")
//    }

    func notesNumber() -> Int {
        return notes.count
    }
    
    mutating func changeElementAtIndex(element: Note, index: Int) {
        
        print("The array named newNotes has elements: \(newNotes)")
        
        guard let testNote = Note(id: 0, name: "Ala-Bala") else {
            fatalError("Unable to instantiate testNote")
        }
        
        while notes.count < index {
            notes.append(testNote)
        }
        
        print("Have put the changed element name in the correct place")

        notes.insert(element, at: index)
    }

    mutating func incrementIdentifierByOne() -> Int {
        counter = counter + 1
        return counter
    }
    
    func printTheArray() {
        print("The array is: \(notes)")
    }
}
