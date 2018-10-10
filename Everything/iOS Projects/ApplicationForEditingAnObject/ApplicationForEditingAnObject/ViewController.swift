//
//  ViewController.swift
//  ApplicationForEditingAnObject
//
//  Created by Kalin Karev on 5/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    // connection to the elements of the view controller
    // MARK: Properties
    @IBOutlet weak var notesTableView: UITableView!
    // the table view of the main screen

    var userNotes = UserNotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userNotes.loadData()
        userNotes.printTheArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    // This method lets you configure a viewcontroller before it`s presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination viewcontroller only when the save button is pressed.
        if segue.identifier == "editNote" {
            print("You have selected edit note");
//            guard let noteDetailViewController = segue.destination as? EditNoteScreenViewController else {
//                fatalError("Unexpected destination: \(segue.description)")
//            }
            guard let selectedNoteCell = sender as? NoteCellTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let index = notesTableView.indexPath(for: selectedNoteCell) else {
                fatalError("The selcted cell is not being displayed by the table")
            }
            let selectedNote = userNotes.notes[index.row]
//            noteDetailViewController.passedNote = selectedNote
            
            print("The name of the selected note for edit is: \(selectedNote.title)")
            print("The id of the selected note for edit is: \(selectedNote.id)")
            // Printing the array of notes, how is it looking, before editing the context of the note object that the user has selected
            print(userNotes.notes)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNotes.numberOfNotes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellNote"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteCellTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteCellTableViewCell")
        }
        let note = userNotes.notes[indexPath.row]
        cell.titleNote.text = note.title
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {}
        _ = NoteObject(id: indexPath.row, title: indexPath.description)
        userNotes.notes.remove(at: indexPath.row)
        
        userNotes.printTheArray()
        
        tableView.deleteRows(at: [indexPath], with: .right)
    }
}
