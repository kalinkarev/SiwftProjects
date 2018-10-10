//
//  ViewController.swift
//  TrainObjectsInArrays
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var objectTableView: UITableView!
    
    var objectManager = ObjectManager()
    
    // MARK: Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Your notes"
        
        // Load sample data
        objectManager.loadSampleObjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: TableViewDelegates
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectManager.objectNumber()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "noteTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellTableViewCell else {
            fatalError("The dequed cell is not an instance of NoteTableViewCell")
        }
        
        // Fetch item
        let object = objectManager.objects[indexPath.row]
        
        // Configure Cell
        cell.nameLabel.text = object.name
        
        return cell
    }
    
    /*
     Adding the Delete functionality (Deleting the cell, by slipping left (when the user slippes left))
     */
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//
////        if editingStyle == .delete {
////            /*
////             Update Items.
////             After removing/deleting the selected cell (the user deletes the cell by slipping from the right to the left in a cell)
////             */
////
////            let note = Note(id: indexPath.row, name: indexPath.description)
////
////            //            userNotes.notes.remove(at: indexPath.row) //-> correct one, working perfectly
////            userNotes.deleteNote(note!)
////
////            /*
////             Update Table View
////             After the deleting of the selected cell
////             */
////            tableView.deleteRows(at: [indexPath], with: .right)
////        }
//    }
}

