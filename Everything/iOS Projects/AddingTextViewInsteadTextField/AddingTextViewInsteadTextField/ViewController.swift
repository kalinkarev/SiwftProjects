//
//  ViewController.swift
//  AddingTextViewInsteadTextField
//
//  Created by Kalin Karev on 9/13/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userTableView: UITableView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var doneBtn: UIBarButtonItem!

    var allCellsText = [String?]()
    var arrayWithPoints = [Int]()
    var able = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        allCellsText = [String?](repeating: nil, count: 10)
        print("The array of cells text is: \(allCellsText)")

        inputTextView.text = "Enter text"
        inputTextView.delegate = self

        doneBtn.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problems with the cell")
        }

        cell.pointsTextField.placeholder = "Enter points for hole: \(indexPath.row)"
        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self

        return cell
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        print("The array without optionals is: \(arrayWithoutOptionals)")
        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")

        let result = arrayWithPoints.all { $0 > 0 }
        print("The result is: \(result)")

        able = result
        print("The varialbe able has value: \(able)")

        print("The user has entered: \(inputTextView.text)")

        if result == true {
            if !(inputTextView.text.isEmpty) {
                doneBtn.isEnabled = true
            } else {
                doneBtn.isEnabled = false
            }
        } else {
            doneBtn.isEnabled = false
        }

        var sumOfCellsInput: Int = 0

        for i in arrayWithPoints {
            print("The points are: \(i)")
            sumOfCellsInput += i
        }

        print("The sum of cells text fields are: \(sumOfCellsInput)")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Enter text") {
            textView.text = ""
        }
        textView.becomeFirstResponder()
        textView.textColor = UIColor.black
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Enter text"
            textView.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()

        if (textView.text == "Enter text") {
            outputLabel.text = ""
        } else {
            outputLabel.text = textView.text
        }

        print("The able is: \(able)")

        if !((outputLabel.text?.isEmpty)!) {
            if able == true {
                doneBtn.isEnabled = true
            } else {
                doneBtn.isEnabled = false
            }
        } else {
            doneBtn.isEnabled = false
        }
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        print("chars \(textView.text.count) \(text)")

        if (textView.text.count > 20 && range.length == 0) {
            print("Please summarize in 20 characters or less")
            return false
        }

        if (text == "\n") {
            textView.resignFirstResponder()

            if (textView.text == "Enter text") {
                outputLabel.text = ""
            } else {
                outputLabel.text = textView.text
            }
            return false
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
