//
//  ViewController.swift
//  ToDoApp
//
//  Created by Kalin Karev on 8/3/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!

    var items: [ToDo] = []
    var checkedItems: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // Set Title
        title = "To Do"

        let item1 = ToDo(name: "Buy Milk", done: false)

        // Populate Items
//        items = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
        items += [item1]

        // Load State
//        loadItems()
        loadCheckedItems()

        // Register Class for Cell Reuse
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemViewController" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
    }

    private func loadCheckedItems() {
        let userDefaults = UserDefaults.standard

        if let checkedItems = userDefaults.object(forKey: "checkedItems") as? [String] {
            self.checkedItems = checkedItems
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Fetch Item
        let item = items[indexPath.row]
        
        // Dequeue Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        // Configure Cell
        cell.textLabel?.text = item.name
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Update Items
            items.remove(at: indexPath.row)
            
            // Update Table View
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    // MARK: - Table View Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Fetch Item
        let item = items[indexPath.row]
        
        // Fetch Cell
        let cell = tableView.cellForRow(at: indexPath)

        // Update Cell
        cell?.accessoryType = item.done ? .checkmark : .none
        
//        // Find Index of Item
//        let index = checkedItems.index(of: item)
//
//        if let index = index {
//            checkedItems.remove(at: index)
//            cell?.accessoryType = .none
//        } else {
//            checkedItems.append(item)
//            cell?.accessoryType = .checkmark
//        }
    }
    
    // MARK: Add Item View Controller Delegate Methods
    func saveItem(_ controller: AddItemViewController, didAddItem: ToDo) {
        // Update Data Source
        items.append(didAddItem)
        
        // Reload Table View
        tableView.reloadData()
        
        // Dismiss Add Item View Controller
        dismiss(animated: true, completion: nil)
    }
    
    func cancelItem(_ controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
}

