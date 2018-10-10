//
//  ViewController.swift
//  WorkingWIthDelegates
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var objectsTableView: UITableView!

    var items: [Object] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let item1 = Object(id: 0, name: "Hello")
        let item2 = Object(id: 1, name: "Nice")
        items += [item1, item2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "AddItemViewController" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddViewController

            if let viewController = addItemViewController {
                viewController.delegate = self as AddViewControllerDelegate
            }
        }

        if segue.identifier == "editViewController" {
            let navigationController = segue.destination as? UINavigationController
            let editItemViewController = navigationController?.topViewController as? AddViewController

            if let viewController = editItemViewController {
                viewController.delegate = self as AddViewControllerDelegate
            }

//            guard let indexPath = tableView.indexPath(for: editItemViewController) else {
//                fatalError("The selected cell is not beign displayed by the table")
//            }

//            let indexPath = objectsTableView.indexPath(for: editItemViewController)
            guard let selectedObjectCell = sender as? CustomTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = objectsTableView.indexPath(for: selectedObjectCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedObject = items[indexPath.row]
            
//            items = changeProperty(array: items, identifier: 4)
//            self.objectsTableView.reloadData()
        }
    }

//    func changeProperty(array: [Object], identifier: Int) -> [Object] {
//        var newArray = array
//        newArray = newArray.map{
//            var mutatingObject = $0
//
//            if $0.id == identifier {
//                mutatingObject.name = "Free"
//            }
//            return mutatingObject
//        }
//        return newArray
//    }

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "customCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("The dequed is not an instance of CustomTableViewCell")
        }

        cell.nameLabel.text = items[indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Update Items
            items.remove(at: indexPath.row)

            // Update TableView
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

// MARK: Add Item View Controller Delegate Methods
extension ViewController: AddViewControllerDelegate {
    func controller(_ controller: AddViewController, didAddItem: Object) {
        // Update Data Source
        items.append(didAddItem)

        // Reload Table View
        objectsTableView.reloadData()

        // Dismiss Add Item View Controller
        dismiss(animated: true, completion: nil)
    }

    func dismissSave(_ controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
}
