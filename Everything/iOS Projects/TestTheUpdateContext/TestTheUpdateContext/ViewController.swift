//
//  ViewController.swift
//  TestTheUpdateContext
//
//  Created by Kalin Karev on 5/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var tableViewNotes: UITableView!
    
    var arrnotes = [Note]()

    var noteForTest = Note(id: 0, title: "dress")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        arrnotes += [noteForTest]
        
        print("The note for test is: \(noteForTest.title) with id: \(noteForTest.id)")
        print("----------------------------------------------------------------------")
        
//        arrnotes.append(Note(id: 0))
//        arrnotes.append(Note(id: 1))
//        arrnotes.forEach { note in
//            print(note.title)
//        }
//
//        arrnotes = arrnotes.map {
//            var mutableNote = $0
//
//            if ($0.id == 0) {
//                mutableNote.title = "hello"
//            }
//            return mutableNote
//        }
        
//        arrnotes = arrnotes.map {
//            var mutableNote = $0
//            if $0.id == 1 {
//                mutableNote.title = "modified"
//            }
//            return mutableNote
//        }
//
//        arrnotes.forEach { note in
//            print(note.title)
//        }
        
        loadInitialData()
        changeTitle(nameNote: noteForTest)
//        changeTitle(nameNote: arrnotes[1])
//        titleChange()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    // In a storyboard-based application, you will often want ot do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "addNoteSegue":
            os_log("Adding a new note.", log: OSLog.default, type: .debug)
            
        case "showDetailSegue":

            guard let destination = segue.destination as? AddNoteViewController else {
                return
            }
            destination.notesArray = arrnotes
            
            guard let noteDetailViewController = segue.destination as? AddNoteViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedNoteCell = sender as? NoteTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableViewNotes.indexPath(for: selectedNoteCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedNote = arrnotes[indexPath.row]
            noteDetailViewController.note = selectedNote
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    func loadInitialData() {
        let note1 = Note(id: 1, title: "default")
        let note2 = Note(id: 2, title: "default")
        let note3 = Note(id: 3, title: "default")
        let note4 = Note(id: 4, title: "default")

        arrnotes += [note1, note2, note3, note4]
    }
    
    func  changeTitle(nameNote: Note) {
        arrnotes = arrnotes.map {
            var mutableNote = $0
            if ($0.id == 0) {
                mutableNote.title = "dress well"
            }
            return mutableNote
        }
    }
    
    func titleChange() {
        arrnotes = arrnotes.map {
            var mutableNote = $0
            if ($0.id == 2) {
                mutableNote.title = "by default"
            }
            if ($0.id == 1) {
                mutableNote.title = "new"
            }
            return mutableNote
        }
    }
    
}

// MARK: TableViewDelegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrnotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifierNote"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteTableViewCell")
        }
        
        // Fetch item
        let note = arrnotes[indexPath.row]
        
        // Configure Cell
        cell.nameNote.text = note.title
        
        return cell
    }
}
