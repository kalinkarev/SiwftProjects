//
//  ViewController.swift
//  EnablingButtonFromTextFields
//
//  Created by Kalin Karev on 9/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var userTableView: UITableView!

    var userInput = ""

    var numberOfRows = 2
    
//    var arrayWithPoints = [Int]()
//    var allCellsText = [String?]()

    var arrayWithPoints = [Int]()
    var allCellsText = [Int?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        btn.isEnabled = false
        inputTextField.delegate = self
        
        allCellsText = [Int?](repeating: 0, count: numberOfRows)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        userInput = inputTextField.text!
        print("The user has inputted: \(userInput)")
        
        if userInput.isEmpty {
            btn.isEnabled = false
        } else {
            btn.isEnabled = true
        }

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
//        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")

//        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
//        arrayWithPoints = allCellsText.map { Int($0) ?? 0 }
        print("The aray of points is: \(arrayWithPoints)")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Error with the cell")
        }
        
        cell.pointsTextField.addDoneButtonToKeyboard(myAction: #selector(cell.pointsTextField.resignFirstResponder))
        
        cell.pointsTextField.placeholder = "Entr points for hole: \(indexPath.row+1)"
//        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self
        
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
