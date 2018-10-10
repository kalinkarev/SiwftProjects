//
//  ViewController.swift
//  ReplacingReturnButtonWithAnother
//
//  Created by Kalin Karev on 9/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var showInputLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        addButtonToTheKeyboard()
//        inputTextField.addButtonToKeyBoard(myAction: #selector(self.doneAction))
//        addButtonToTheKeyboard(userTextField: inputTextField)
//        inputTextField.addButtonToTheKeyboard(myAction: #selector(doneAction))
//        addButtonToTheKeyboard(userTextField: inputTextField)
//        inputTextField.delegate = self
//        addButtonToTheKeyboard(userTextField: inputTextField)
//        inputTextField.delegate = self
        
        addButtonToTheKeyboard(userTextField: inputTextField)
    }

    func addButtonToTheKeyboard(userTextField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneAction))
        toolbar.items = [doneButton]
        userTextField.inputAccessoryView = toolbar
    }

    @objc func doneAction() {
        
        inputTextField.resignFirstResponder()
        
        print("Have pressed the DONE button")
        
        showInputLabel.text = inputTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
}

extension UITextField {
    func addButtonToTheKeyboard(myAction: Selector?) {
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: myAction)
//        toolbar.items = [doneButton]
//        self.inputAccessoryView = toolbar

        print("The selector is: \(String(describing: myAction))")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MianScreenTableViewCell else {
            fatalError("Problem")
        }

        cell.enterTextField.placeholder = "Enter..."
        addButtonToTheKeyboard(userTextField: cell.enterTextField)

        return cell
    }
}

/*
extension UITextField {
    func addDoneButtonToKeyboard(myAction: Selector?) {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: myAction)
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
}
*/
