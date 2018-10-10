//
//  ViewController.swift
//  ToDoApplication
//
//  Created by Kalin Karev on 3/5/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Notes"
        
        // Populate Items
        items = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
        
        // Register Class for Cell Reuse
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemViewController" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self as AddItemControllerDelegate
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ItemTableViewCell"
        
                // Deque Cell
        //        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ViewTableViewCell else {
                    fatalError("The dequed cell is not an instance of ViewTableViewCell")
                }
        
                // Fetch item
                let item = items[indexPath.row]
        
        
                // Configure Cell
                cell.nameLabel.text = item
        
                return cell
    }
    
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Update Items.
            items.remove(at: indexPath.row)
            
            // Update Table View
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
    
}


extension ViewController: AddItemControllerDelegate {
    func controller(_ controller: AddItemViewController, didAddItem: String) {
        // Update the Data Source
        items.append(didAddItem)
        
        // Reload Table View
        tableView.reloadData()
        
        // Dismiss Add Item View Controller
        dismiss(animated: true, completion: nil)
    }
}
