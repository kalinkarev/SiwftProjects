//
//  ViewController.swift
//  ProjectForTestingSaveButtonToBeUnavailable
//
//  Created by Kalin Karev on 8/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var manageNotes = ManageNotes()
    
    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manageNotes.loadInitialNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier {
        case "addItem"?:
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        case "editItem"?:
            guard let detailViewController = segue.destination as? AddItemViewController else {
                fatalError("Error with the connection")
            }
            guard let selectedNoteCell = sender as? MainScreenTableViewCell else {
                fatalError("Not known sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedNoteCell) else {
                fatalError("The cell is not in tableView")
            }

            let selectedNote = manageNotes.notes[indexPath.row]
            detailViewController.selectedNoteEdit = selectedNote
            detailViewController.delegate = self
        default:
            print("There is no such operation that you can do with the note")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageNotes.numberNotes()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("There is no such cell in the table view")
        }
        let note = manageNotes.notes[indexPath.row]
        cell.nameLabel.text = note.name
        return cell
    }
    
    // Delete note
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = Note(id: indexPath.row, name: indexPath.description)
            
            manageNotes.deleteNote(note)
            
            userTableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

extension ViewController: AddItemViewControllerDelegate {
    func controllerDidCancel(_ controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func controllerDidSave(_ controller: AddItemViewController, didSave: Note) {
        manageNotes.addNote(didSave)
        userTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func controllerDidEdit(_ controller: AddItemViewController, didEdit: Note) {
        manageNotes.editNote(didEdit)
        userTableView.reloadData()
    }
}
