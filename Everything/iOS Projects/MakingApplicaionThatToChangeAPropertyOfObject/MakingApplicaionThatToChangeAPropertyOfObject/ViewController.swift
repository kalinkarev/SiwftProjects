//
//  ViewController.swift
//  MakingApplicaionThatToChangeAPropertyOfObject
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var numberOfHoles: Int = 0

    var manageObjects = ManageObjects()
    
    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        showActionSheet()
    }

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
            let addItemViewController = navigationController?.topViewController as? AddViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self

                viewController.numberHoles = numberOfHoles
            }
        }
        
        if segue.identifier == "editItem" {
            print("Hello from editting object")
            
            let navigationController = segue.destination as? UINavigationController
            let editItemViewController = navigationController?.topViewController as? AddViewController
            
            if let viewController = editItemViewController {
                viewController.delegate = self
                
                viewController.objectEdit = sender as? Object
            }
        }
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let oneButton = UIAlertAction(title: "One", style: .default, handler: {
            (action) -> Void in
            print("One button pressed")
            self.numberOfHoles = 1
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        let twoButton = UIAlertAction(title: "Two", style: .default, handler: {
            (action) -> Void in
            print("Two buttons pressed")
            self.numberOfHoles = 2
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button pressed")
        })
        alertController.addAction(oneButton)
        alertController.addAction(twoButton)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: AddViewControllerDelegate {
    func controllerDidCancel(_ controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
    func controllerDidSave(_ controller: AddViewController, didSave: Object) {
        manageObjects.addObject(didSave)
        userTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

// MARK: TableView Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageObjects.countObjects()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("The dequed is not an instance of MainScreenTableViewCell identifier")
        }
        
        // Fetch item
        let object = manageObjects.objects[indexPath.row]
        // Configure cell
        cell.nameLabel.text = object.title

        return cell
    }
    
    // Delete object
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let object = Object(id: indexPath.row, title: indexPath.description)
            manageObjects.deleteObject(object)
            userTableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}
