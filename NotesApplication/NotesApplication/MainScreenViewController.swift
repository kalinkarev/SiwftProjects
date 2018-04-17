//
//  MainScreenViewController.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

class MainScreenViewController: UIViewController {    
    // MARK: Properties
    @IBOutlet weak var notesTableView: UITableView!
    
    var userNotes = UserNotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title on the navigation bar on the main screen _Your Notes_
        title = "Your Notes"
        
        // Populate Items in the table view
        userNotes.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch (segue.identifier ?? "") {
        case "AddNoteViewController":
            let navigationController = segue.destination as? UINavigationController
            let addNoteViewController = navigationController?.topViewController as? AddNoteViewController
            
            if let viewController = addNoteViewController {
                viewController.delegate = self as AddNoteViewControllerDelegate
            }
            
        case "showDetail":

            print("You have selected edit note")
            
            guard let noteDetailViewController = segue.destination as? AddNoteViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }

            guard let selectedNoteCell = sender as? NoteTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }

            guard let indexPath = notesTableView.indexPath(for: selectedNoteCell) else {
                fatalError("The seleceted cell is not being displayed by the table")
            }

            let selectedNote = userNotes.notes[indexPath.row]
            noteDetailViewController.note = selectedNote

            print("The name of the selected note for edit is: \(selectedNote.name)")
            print("The id of the selected note for edit is: \(selectedNote.id)")
            
//            userNotes.editNote(selectedNote)
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
}


// MARK: TableViewDelegates
extension MainScreenViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNotes.notesNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "noteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteTableViewCell")
        }
        
        // Fetch item
        let note = userNotes.notes[indexPath.row]
        
        // Configure Cell
        cell.nameLabel.text = note.name
        
        return cell
    }
    
    /*
        Adding the Delete functionality (Deleting the cell, by slipping left (when the user slippes left))
     */
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
                
        if editingStyle == .delete {
            /*
                    Update Items.
                    After removing/deleting the selected cell (the user deletes the cell by slipping from the right to the left in a cell)
                */
  
            let note = Note(id: indexPath.row, name: indexPath.description)
            
//            userNotes.notes.remove(at: indexPath.row) //-> correct one, working perfectly
            userNotes.deleteNote(deletedNote: note!)
            
            /*
                    Update Table View
                    After the deleting of the selected cell
                */
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}


// MARK: Delegates (Use the delegate to pass data between the views)
extension MainScreenViewController: AddNoteViewControllerDelegate {
    func contollerDidSave(_ controller: AddNoteViewController, didSave: Note) {
        // Update the Data Source
        // Using the method implemented in the UserNotes.swift
        userNotes.addNote(didSave)
        
        // Reload Table View
        notesTableView.reloadData()
        
        // Dismiss Add Note View Controller
        dismiss(animated: true, completion: nil)
    }

    func contollerDidCancel(_ controller: AddNoteViewController) {
        dismiss(animated: true, completion: nil)
    }
}
