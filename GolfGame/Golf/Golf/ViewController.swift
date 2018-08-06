//
//  ViewController.swift
//  Golf
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sections: Int = 5
    
    // MARK: Properties
    @IBOutlet weak var nameTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddGolfViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
    }

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
    }
}

// TableViewDelegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GolfTableViewCell else {
            fatalError("The dequed is not an instance of GolfTableViewCell identifier")
        }
        
        cell.nameLabel.text = "The number is \(indexPath.row + 1)"
        
        return cell
    }
}

// MARK: Delegates(Use the delegate to pass data between the views)
extension ViewController: AddGolfViewControllerDelegate {
    func controllerDidCancel(_ controller: AddGolfViewController) {
        dismiss(animated: true, completion: nil)
    }

    func controllerDidSave(_ controller: AddGolfViewController, didSave: GolfGame) {
        dismiss(animated: true, completion: nil)
    }
}
