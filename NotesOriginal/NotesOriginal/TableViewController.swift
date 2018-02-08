//
//  TableViewController.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var notes = [Note]()
    // decalres a property on NoteTableViewController and initializes it with a default value (an empty array of Note objects)
    
    
    // MARK: tableview datasource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Table view cells are reused and should be dequeued using a cell identifier.
//        let cellIdentifier = "NoteTableViewCell"
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
//            fatalError("The dequeued cell is not an instance of NoteTableViewCell.")
//        }
//
//        // Fetches the appropriate note for the data source layout.
//        let note = notes[indexPath.row]
//
//        // Configure the cell...
//
//        cell.nameLabel.text = note.name
//
//        return cell
//    }
    
        public func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
//        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return notes.count
//        }
    
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
        navigationItem.leftBarButtonItem = editButtonItem
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: Actions

    @IBAction func unwindToNoteList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NoteViewController, let note = sourceViewController.note {
            // Add a new meal.
            let newIndexPath = IndexPath(row: notes.count, section: 0)
            notes.append(note)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    // MARK: Private Methods
    
    // this is a helper method to load sample data into the app
    private func loadSampleNotes() {
        guard let note1 = Note(name: "Go to fitness") else {
            fatalError("Unable to instantiate note1")
        }
        notes += [note1]
    }
    
}
