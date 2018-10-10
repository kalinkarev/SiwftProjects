//
//  ViewController.swift
//  ProjectWithXButtonInCell
//
//  Created by Kalin Karev on 10/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    var flags: [Bool] = Array(repeating: false, count: 5)

    var dictHoleXButton: [Int : Bool] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeAnArraysElement(arr: [Bool], element: Bool, position: Int) -> [Bool] {
        var array = arr
        array.remove(at: position)
        array.insert(element, at: position)
        return array
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ViewControllerTableViewCell else {
            fatalError("Problems with the cell")
        }

        cell.holeLabel.text = "Hole \(indexPath.row)"
        cell.pointsTextField.placeholder = "Enter points for hole \(indexPath.row)"

        cell.pointsTextField.tag = indexPath.row

        cell.pointsTextField.delegate = self

        cell.delegateCell = self

        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("You have end editing the textfield cell (from ViewController.swift)")
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        let index = IndexPath(row: textField.tag, section: 0)
        print("The index of the end edited cell`s text field is: \(index[1])")
        let cell: ViewControllerTableViewCell = self.userTableView.cellForRow(at: index) as! ViewControllerTableViewCell
        print("The cell that has end editing is: \(cell)")

        let indexOfCellTextFieldCell = self.userTableView.indexPath(for: cell)

        if let indexCell = indexOfCellTextFieldCell {
            print("The user has end editing the textfield for cell: \(indexCell[1])")

            flags = changeAnArraysElement(arr: flags, element: false, position: indexCell[1])
        }

        print("The array of flags is: \(flags)")

        for i in 0..<flags.count {
            print("The position \(i) has value: \(flags[i])")

            if flags[i] == false {
                if cell.btnX == nil {
                    print("The btnX is NILL value")
                } else {
                    print("The btnX is correct")
                }
            }
        }

        cell.btnX.isHidden = false
    }

//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        let index = IndexPath(row: textField.tag, section: 0)
//        print("The index of the text field in cell is: \(index)")
//        print("The index of the started editing cell`s text field is: \(index[1])")
//        let cell: ViewControllerTableViewCell = self.userTableView.cellForRow(at: index) as! ViewControllerTableViewCell
//        print("The cell that has end editing is: \(cell)")
//    }

//    func textFieldDidEndEditing(_ textField: UITextField) {
//        delegateCell?.didEnterTextField(self)
//    }
}

extension ViewController: ViewControllerTableViewCellDelegate {
    func didTapButton(_ cell: ViewControllerTableViewCell) {
        let indexOfXButtonCell = self.userTableView.indexPath(for: cell)
        // Changing the elements of the flag`s array, when the user click the X button, need to set the button X to be hidden
        flags = changeAnArraysElement(arr: flags, element: true, position: indexOfXButtonCell![1])

        print("The array of flags is: \(flags)")

        cell.pointsTextField.text = "X"
        cell.btnX.isHidden = true

        print("The cell X array is: \(flags)")

        for i in 0..<flags.count {
            print("The position \(i) has value: \(flags[i])")
            dictHoleXButton[i] = flags[i]
        }

        for (key, value) in dictHoleXButton {
            print("The key \(key) has value: \(value)")
        }
    }

    func didEnterTextField(_ cell: ViewControllerTableViewCell) {
        let indexOfTextFieldCell = self.userTableView.indexPath(for: cell)

        if let indexCell = indexOfTextFieldCell {
            print("The user has end editing the textfield for cell: \(indexCell[1])")

            // Changing the elements of the flag`s array, when the user enter something and need to set the button X to be visible
            flags = changeAnArraysElement(arr: flags, element: false, position: indexCell[1])
        }

        print("The array of flags is: \(flags)")

        for i in 0..<flags.count {
            print("The positon \(i) has value: \(flags[i])")

            if flags[i] == false {
                //                cell.btnX.isHidden = false
                if cell.btnX == nil {
                    print("The btnX is NILL value")
                } else {
                    print("The btnX is correct")
                }
            }
        }

        cell.btnX.isHidden = false
    }
}

// Hello!
// Nice to meet you
// What are you working?
// What have you graduated?
// From how long have you worked as
// We are going to work as a team. You don`t mined it, do you?
