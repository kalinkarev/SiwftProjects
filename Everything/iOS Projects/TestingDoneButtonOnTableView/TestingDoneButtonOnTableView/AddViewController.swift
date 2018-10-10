//
//  AddViewController.swift
//  TestingDoneButtonOnTableView
//
//  Created by Kalin Karev on 9/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var userInputNameTextField: UITextField!
    @IBOutlet weak var userTableView: UITableView!

    var inputTableView: [String] = ["hello", "nice", "to"]
    
    var allCellsText = [String?]()
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have pressed the cancel button")
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.isEnabled = false
        
        // for toolbar
        let keyBoard = UIToolbar()
        // fit to keyboard
        keyBoard.sizeToFit()
        // createuibarbutton
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClick))
        // putting with keyboard
        keyBoard.items = [doneButton]
        // numpad keyboard in inputaccessoryView
        userInputNameTextField.inputAccessoryView = keyBoard
        
        allCellsText = [String?](repeating: nil, count: inputTableView.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func doneClick() {
        // hide keyboard
        self.view.endEditing(true)
    }
}

extension AddViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputTableView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "addScreenCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AddScreenTableViewCell else {
            fatalError("No such cell in the table view")
        }

        cell.pointsTextField.placeholder = "Enter points for hole: \(indexPath.row)"

        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self

        // for toolbar
        let keyBoardNumberPad = UIToolbar()
        // fit to keyboard
        keyBoardNumberPad.sizeToFit()
        // createuibarbutton
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneClick))
        // putting with keyboard
        keyBoardNumberPad.items = [doneButton]
        // numpad keyboard in inputaccessoryView
        cell.pointsTextField.inputAccessoryView = keyBoardNumberPad

        return cell
    }
}

extension AddViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The allCellsText array is: \(allCellsText)")

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        let arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")

        let result = arrayWithPoints.all { $0 > 0 }
        print("The result is: \(result)")

        print("The user input is: \(String(describing: userInputNameTextField.text?.isEmpty))")

        if userInputNameTextField.text?.isEmpty == false && result == true {
            print("The user has entered something")
            btnSave.isEnabled = true
        } else {
            btnSave.isEnabled = false
        }


//        if result == true {
//            if userInputNameTextField.text != "" {
//                btnSave.isEnabled = true
//            }
////            btnSave.isEnabled = true
//        } else {
//            btnSave.isEnabled = false
//        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if (userInputNameTextField.text?.isEmpty)! {
            btnSave.isEnabled = false
        } else {
            btnSave.isEnabled = true
        }

        return true
    }
}

extension Collection {
    func all(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
        for item in self {
            let result = try predicate(item)

            if !result {
                return false
            }
        }
        return true
    }
}








