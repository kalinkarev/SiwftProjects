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
        if segue.identifier == "AddNoteViewController" {
            let navigationController = segue.destination as? UINavigationController
            let addNoteViewController = navigationController?.topViewController as? AddNoteViewController
            
            if let viewController = addNoteViewController {
                viewController.delegate = self as AddNoteViewControllerDelegate
            }
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
            
            print("The row is: \(indexPath.row)")
            
//            let selectedNote = Note(id: indexPath.row, name: "")
            
//            print("The id of the selected note is: \(String(describing: selectedNote?.id))")
            
//            userNotes.notes.remove(at: indexPath.row)
//            userNotes.deleteNote(deletedNote: userNotes.notes.remove(at: indexPath.row))
//            userNotes.deleteNote(deletedNote: selectedNote!)

//            userNotes.notes.remove(at: indexPath.row)
//            userNotes.deleteNote(deletedNote: selectedNote!)

//            userNotes.deleteNote(deletedNote: indexPath.row)
            userNotes.notes.remove(at: indexPath.row) //-> correct one, working perfectly
            
            /* Now i have to make it work with the method deleteNote() in the UserNotes.swift file */
            
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
