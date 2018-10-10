//
//  ViewController.swift
//  TestingDoneButtonOnKeyboard
//
//  Created by Kalin Karev on 9/13/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var showInputLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!
    
    var numberOfRowsInTableView: Int = 3
    
    var userText: String = ""
    
    var allCellsText = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        addDoneButtonToKeyboard(chooseTextField: inputTextField)
//        inputTextField.addDoneButtonToKeyboard()
        
        inputTextField.delegate = self

        allCellsText = [String?](repeating: nil, count: 3)
        
//        inputTextField.delegate = self
//        addButton(chooseTextField: inputTextField)
        
        
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneAction))
//        toolbar.items = [doneButton]
//        inputTextField.inputAccessoryView = toolbar
    }

//    func addDoneButtonToKeyboard(chooseTextField: UITextField) {
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: nil)
//        toolbar.items = [doneButton]
//        chooseTextField.inputAccessoryView = toolbar
//    }
//
//    @objc func doneAction() {
//        inputTextField.resignFirstResponder()
//        print("Have pressed DONE button")
//        showInputLabel.text = inputTextField.text
////        showInputLabel.text = inputTextField.text
//    }
    
    @objc func pressedDone(selectedTextField: UITextField) {
        selectedTextField.resignFirstResponder()
        print("You have pressed the DONE button")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        showInputLabel.text = textField.text
        return true
    }
}

extension UITextField {
    func addDoneButtonToKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action:
            #selector(doneAction))
        toolbar.items = [doneButton]
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneAction() {
        self.resignFirstResponder()
        print("Have pressed DONE button")
        print("The user has entered: \(String(describing: self.text))")

        let viewController = ViewController()
        print("The array of cells is: \(viewController.allCellsText)")
        
        viewController.allCellsText[self.tag] = self.text
        print("The array of cells is: \(viewController.allCellsText)")
        
//        let viewController = ViewController()
//        viewController.allCellsText[self.tag] = self.text
//        print("The array of cells is: \(viewController.allCellsText)")
    }
    
    func giveTheInput() -> String {
        print("The user show: \(String(describing: self.text))")
        return self.text!
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as? MainScreenTableViewCell else {
            fatalError("The cell is not inside the table view")
        }
        
        cell.nameLabel.text = "Enter text for \(indexPath.row) cell"
        cell.userTextField.placeholder = "Enter points"
        
        cell.userTextField.text = allCellsText[indexPath.row]
        cell.userTextField.tag = indexPath.row
        
        cell.userTextField.addDoneButtonToKeyboard()
        
        cell.userTextField.delegate = self
        
        return cell
    }
}
