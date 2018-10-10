//
//  AddViewController.swift
//  MakingApplicaionThatToChangeAPropertyOfObject
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: AddViewController)
    func controllerDidSave(_ controller: AddViewController, didSave: Object)
}

class AddViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var holePointsInputTableView: UITableView!

    weak var delegate: AddViewControllerDelegate?

    var numberHoles: Int = 0

    var manageObjects = ManageObjects()

    var objectEdit: Object?

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the SAVE button")
        var newID: Int
        if manageObjects.objects.isEmpty {
            newID = 0
        } else {
            newID = (manageObjects.objects.last?.id)!
            newID = newID + 1
        }
        let newObject  = Object(id: newID, title: nameTextField.text ?? "")

        print("The new object has id: \(newObject.id), name: \(newObject.title)")

        delegate?.controllerDidSave(self, didSave: newObject)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("The number of holes is: \(numberHoles)")
        nameTextField.placeholder = "Enter the name of the object"

        nameTextField.text = objectEdit?.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
