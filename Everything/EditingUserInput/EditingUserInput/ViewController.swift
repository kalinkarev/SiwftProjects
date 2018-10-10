//
//  ViewController.swift
//  EditingUserInput
//
//  Created by Kalin Karev on 5/15/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var notesTableView: UITableView!
    
    var userNotes = UserNotes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Adding a title on the main screen
        title = "Your notes"
        
        // Populate notes in the table view
        userNotes.loadData()
        
        print("----------------")
        userNotes.printTheArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    // This method lets you configure a view controller before it`s presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        
        if segue.identifier == "editNote" {
            print("You have selected edit note")
            
//            guard let noteDetailViewController = segue.destination as? NotesViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
            guard let selectedNoteCell = sender as? NotesCellTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = notesTableView.indexPath(for: selectedNoteCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedNote = userNotes.notes[indexPath.row]
//            noteDetailViewController.note = selectedNote
            print("The name of the selected note for edit is: \(selectedNote.name)")
            print("The id of the selected note for edit is: \(selectedNote.id)")
            
            print(userNotes.notes)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNotes.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "noteCellIdentifier"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NotesCellTableViewCell else {
            fatalError("The dequed cell is not an instance of NotesCellTableViewCell")
        }
        
        // Fetch item.
        let note = userNotes.notes[indexPath.row]
        
        // Configure cell.
        cell.nameLabel.text = note.name
        
        return cell
    }
    
}
