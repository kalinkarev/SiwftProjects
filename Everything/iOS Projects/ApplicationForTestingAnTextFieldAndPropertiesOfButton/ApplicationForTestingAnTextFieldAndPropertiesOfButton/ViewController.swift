//
//  ViewController.swift
//  ApplicationForTestingAnTextFieldAndPropertiesOfButton
//
//  Created by Kalin Karev on 9/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var userTableView: UITableView!

    var numberOfRows: [Int] = [1, 2, 3, 4, 5]

    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextField.delegate = self

        saveBtn.isEnabled = false

//        inputTextField.addDoneButtonToKeyboard(myAction: #selector(self.inputTextField.resignFirstResponder))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if let userInput = inputTextField.text {
            if !(userInput.isEmpty) {
                saveBtn.isEnabled = true
            } else {
                saveBtn.isEnabled = false
            }
        }

        return true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("No such cell found")
        }

        cell.pointsTextField.addDoneButtonToKeyboard(myAction: #selector(cell.pointsTextField.resignFirstResponder))

        return cell
    }
}

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
