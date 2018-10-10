//
//  ViewController.swift
//  ProjectEveryThingNeededForNoteApplication
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var manageNotes = ManageNote()

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        print("Add button pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manageNotes.loadNotes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch segue.identifier {
        case "addNote"?:
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddNoteViewController

            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        case "editNote"?:
//            let navigationController = segue.destination as? UINavigationController
//            let secondController = navigationController?.topViewController as? AddNoteViewController

            guard let detailViewController = segue.destination as? AddNoteViewController else {
                fatalError("Error with the conection")
            }

            guard let selectedNoteCell = sender as? MainScreenTableViewCell else {
                fatalError("Not known sender: \(String(describing: sender))")
            }

            guard let indexPath = userTableView.indexPath(for: selectedNoteCell) else {
                fatalError("The cell is not in the table view")
            }

            let selectedNote = manageNotes.notes[indexPath.row]
            detailViewController.selectedNote = selectedNote
            detailViewController.delegate = self
//            if let viewController = secondController {
//                viewController.delegate = self
//
//                viewController.selectedNote = selectedNote
//            }

        default:
            print("There is no such operation that you can do with the note")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageNotes.numberOfNotes()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("The table view does not have cell named 'mainScreenCell'")
        }

        let note = manageNotes.notes[indexPath.row]
        cell.nameLabel.text = note.title

        return cell
    }

    // Delete note
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = Note(id: indexPath.row, title: indexPath.description)

            manageNotes.deleteNote(note)

            userTableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

extension ViewController: AddNoteViewControllerDelegate {
    func controllerDidSave(_ controller: AddNoteViewController, didSave: Note) {
        manageNotes.addNote(didSave)

        userTableView.reloadData()

        dismiss(animated: true, completion: nil)
    }

    func controllerDidCancel(_ controller: AddNoteViewController) {
        dismiss(animated: true, completion: nil)
    }

    func controllerDidEdit(_ controller: AddNoteViewController, didEdit: Note) {
        manageNotes.editNote(didEdit)

        userTableView.reloadData()

//        dismiss(animated: true, completion: nil)
    }
}
