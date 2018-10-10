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
    
    // MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    
        // Configure the destination view controller only when the save button is pressed.
        if segue.identifier == "AddItem" {
            let navigationController = segue.destination as? UINavigationController
            let addObjectViewController = navigationController?.topViewController as? AddObjectViewController
            
            if let viewController = addObjectViewController {
                viewController.delegate = self as AddObjectViewControllerDelegate
            }
        }
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
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let object = Object(id: indexPath.row, name: indexPath.description)
            objectManager.deleteObject(object!)
            
            /*
             Update Table View
             After the deleting of the selected cell
             */
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

extension MainViewController: AddObjectViewControllerDelegate {
    func controllerDidSave(_ controller: AddObjectViewController, didSave: Object) {
        // Update the Data Source
        // Using the method implemented in the ObjectManager.swift
        objectManager.addObject(didSave)
        // Reload the table View
        objectTableView.reloadData()
        // Dismiss the Add View Controller
        dismiss(animated: true, completion: nil)
    }
    func controllerDidCancel(_ controller: AddObjectViewController) {
        dismiss(animated: true, completion: nil)
    }
}

