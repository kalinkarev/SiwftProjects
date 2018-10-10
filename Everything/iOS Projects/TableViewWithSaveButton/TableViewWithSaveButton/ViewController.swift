//
//  ViewController.swift
//  TableViewWithSaveButton
//
//  Created by Kalin Karev on 9/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var inputTextField: UITextField!

    var allCellsText = [String?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        saveBtn.isEnabled = false

        allCellsText = [String?](repeating: nil, count: 3)

        inputTextField.delegate = self
        inputTextField.addDoneButtonToKeyboard(myAction: #selector(self.inputTextField.resignFirstResponder))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Not found such a cell")
        }
        
        cell.nameLabel.text = "Holes: \(indexPath.row)"
        cell.pointsTextField.placeholder = "Points for: \(indexPath.row)"
        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self
        
        cell.pointsTextField.addDoneButtonToKeyboard(myAction: #selector(cell.pointsTextField.resignFirstResponder))
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")

        let arrayWithOutOptionals: [String] = allCellsText.map { $0 ?? "" }
        let arrayWithPoints = arrayWithOutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")

        let result = arrayWithPoints.all { $0 > 0 }
        print("The result value is: \(result)")

        if !((inputTextField.text?.isEmpty)!) {
            saveBtn.isEnabled = true
        } else {
            saveBtn.isEnabled = false
        }

//        if !(inputTextField.text?.isEmpty)! {
//
//            if (result == true) {
//                saveBtn.isEnabled = true
//            } else {
//                saveBtn.isEnabled = false
//            }
//
////            saveBtn.isEnabled = true
//        } else {
//            saveBtn.isEnabled = false
//        }
        
//        if result == true && !(inputTextField.text?.isEmpty)! {
////            if (inputTextField.text?.isEmpty)! {
////                print("The table view is filled, but the textfield is not")
////            } else {
//                saveBtn.isEnabled = true
////            }
//        } else {
//            saveBtn.isEnabled = false
//        }
    }

/*
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
*/
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
