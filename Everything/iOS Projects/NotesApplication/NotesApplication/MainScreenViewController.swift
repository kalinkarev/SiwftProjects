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
    
    
    // Array for storing the notes (all the user notes are stored here)
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title on the navigation bar on the main screen _Your Notes_
        title = "Your Notes"
        
        // Populate Items in the table view
        loadSampleNotes()
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
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "noteTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteTableViewCell")
        }
        
        // Fetch item
        let note = notes[indexPath.row]
        
        
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
            notes.remove(at: indexPath.row)
            
            /*
                    Update Table View
                    After the deleting of the selected cell
                */
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
}


// MARK: Private Methods
extension MainScreenViewController {
    
    // this is a helper method to load sample data into the app
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Go to fitness") else {
            fatalError("Unable to instantiate note1")
        }
        
        guard let note2 = Note(name: "Swimming") else {
            fatalError("Unable to instantiate note2")
        }
        
        guard let note3 = Note(name: "Studying") else {
            fatalError("Unable to instantiate note3")
        }
        
        guard let note4 = Note(name: "Studying for the test tomorrow") else {
            fatalError("Unable to instantiate note4")
        }
        
        notes += [note1, note2, note3, note4]
    }
}


// MARK: Delegates (Use the delegate to pass data between the views)
extension MainScreenViewController: AddNoteViewControllerDelegate {

    func contollerDidSave(_ controller: AddNoteViewController, didSave: Note) {
        //Update the Data Source
        notes.append(didSave)
        
        // Reload Table View
        notesTableView.reloadData()
        
        // Dismiss Add Note View Controller
        dismiss(animated: true, completion: nil)
    }

    func contollerDidCancel(_ controller: AddNoteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
}
