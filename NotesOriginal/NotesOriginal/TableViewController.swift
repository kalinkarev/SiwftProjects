//
//  TableViewController.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit
import os.log

class TableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [Note]()
    // decalres a property on NoteTableViewController and initializes it with a default value (an empty array of Note objects)
    
    // Override to support conditional editing of the table view.
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notes.remove(at: indexPath.row)
            // this code removes the Note object to be deleted from notes.
            tableView.deleteRows(at: [indexPath], with: .fade)
            // deletes the corresponding row from the table view.
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        //        navigationItem.leftBarButtonItem = editButtonItem
        /*
         Creating a special type of bar button item that has editing behavior built into it.
         It then adds this button to the left side of the navigation bar in the note list scene.
         */
        
        // Load the sample data.
        loadSampleNotes()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


// MARK: UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "NoteTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequeued cell is not an instance of NoteTableViewCell.")
        }
        
        // Fetches the appropriate note for the data source layout.
        let note = notes[indexPath.row]
        
        // Configure the cell...
        
        cell.nameLabel.text = note.name
        
        return cell
    }
}

// MARK: - Navigation
extension TableViewController {
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let noteDetailViewController = segue.destination as? NoteViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedNoteCell = sender as? NoteTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedNoteCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedNote = notes[indexPath.row]
            noteDetailViewController.note = selectedNote
            
        default:
            //            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
            print("Problem")
        }
        // examing the segue's identifier. If the identifier is nil, the nil-coalescing operator (??) replaces it with an empty string("")
        
    }
}

// MARK: Actions
extension TableViewController {
    
    @IBAction func unwindToNoteList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? NoteViewController, let note = sourceViewController.note {
            
            // checks whether a row in the table view is selected. A user tapped one of the table view cells to edit a meal.
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                // Update an existing note.
                notes[selectedIndexPath.row] = note
                // updates the notes array, replace the old note object with the new one
                
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                // reloads the appropriate row in the table view. Replaces the current cell with a new cell that contains the updated note data
            } else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: notes.count, section: 0)
                notes.append(note)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
}

// MARK: Private Methods
extension TableViewController {
    
    // this is a helper method to load sample data into the app
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Go to fitness") else {
            fatalError("Unable to instantiate note1")
        }
        
        guard let note2 = Note(name: "Swimming") else {
            fatalError("Unable to instantiate note2")
        }
        
        notes += [note1, note2]
    }
}
