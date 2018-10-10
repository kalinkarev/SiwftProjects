//
//  TableViewController.swift
//  NotesApplicationWithDelegates
//
//  Created by Kalin Karev on 2/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var listNotes = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showAddingNoteViewController" {
//            let addingNoteViewController: AddingNoteViewController = segue.destination as! AddingNoteViewController
//            addingNoteViewController.delegate = self
//        }
//    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showAddingNoteViewController" {
//            let addingNoteViewController: AddingNoteViewController = segue.destination as! AddingNoteViewController
//            addingNoteViewController.delegate = self
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddingVC" {
            let addingVC: AddingNoteViewController = segue.destination as! AddingNoteViewController
            addingVC.delegate = self
        }
    }
    
}

// MARK: Delegate
extension TableViewController: NotesManagerDelegate {
    func userDidEnterNote(_ data: String) {
        listNotes += [data]
        
        print(listNotes)
    }
}


// MARK: TableView
extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? NoteTableViewCell else {
            fatalError("The dequeued cell is not an instance of NoteTableViewCell")
        }
        
        // Fetch the appropriate note for the data source layout.
        let note = listNotes[indexPath.row]
        
        // Config the cell
        
        cell.nameNote.text = note
        
        return cell
        
    }
}
