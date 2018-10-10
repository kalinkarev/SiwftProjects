//
//  ViewController.swift
//  CountingTheNumberOfPoints
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ScCode = [String]()
//    var noOfPatience = [String]()
    var CollectionOfCell = [CustomTableViewCell]()

    // MARK: Properties
    @IBOutlet weak var nameTableView: UITableView!

    var allCellsText = [String]()

    var numberOfSections: Int = 4

//    var inputString: String = ""

//    var dictionaryHolesPoints:[Int:String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func submitButton(_ sender: UIButton) {
        CollectionOfCell.forEach { cell in
//            ScCode.append(cell.nameLabel.text!)
            ScCode.append(cell.nameLabel.text!)
        }
        print("The string is: \(ScCode)")
    }

    //MARK: Actions
//    @IBAction func submitButton(_ sender: UIButton) {
//        print("The result is: \(allCellsText)")
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        cell.pointTextField.delegate = self as? UITextFieldDelegate
        cell.pointTextField.text = "Test"

        return cell
    }

    func textFieldDidEndEditing(textField: UITextField) {
        allCellsText.append(textField.text!)
        print(allCellsText)
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
//        CollectionOfCell.append(cell)
//        return cell
//    }

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return numberOfSections
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

//        cell.nameLabel.text = "Hole: \(indexPath.row)"

//        for j in 0..<numberOfSections {
//            print("J is: \(j)")
//            dictionaryHolesPoints[j] = cell.pointTextField.text
//        }

//        for i in 0..<numberOfSections {
//            inputString += cell.pointTextField.text!
//        }
//        print("The final string is: \(inputString)")

//        getTextFromFields(input: cell.pointTextField)

//        print("The dictionary is: \(dictionaryHolesPoints.sorted(by: >))")

//        return cell
//    }

//    func getTextFromFields(input: UITextField) {
//        for i in 0..<numberOfSections {
//            inputString += input.text!
//        }
//        print("The final string is: \(inputString)")
//    }
}
