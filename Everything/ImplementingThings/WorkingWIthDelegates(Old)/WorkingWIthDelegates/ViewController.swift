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

    var items = ["Hello", "Nice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    
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

        cell.nameLabel.text = items[indexPath.row]

        return cell
    }
}

// MARK: Add Item View Controller Delegate Methods
extension ViewController: AddViewControllerDelegate {
    func controller(_ controller: AddViewController, didAddItem: String) {
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
