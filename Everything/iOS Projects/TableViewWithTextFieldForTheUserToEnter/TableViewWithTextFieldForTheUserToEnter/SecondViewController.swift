//
//  SecondViewController.swift
//  TableViewWithTextFieldForTheUserToEnter
//
//  Created by Kalin Karev on 8/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func controllerDidCancel(_ controller: SecondViewController)
    func controllerDidSave(_ controller: SecondViewController)
}

class SecondViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var holesPointsTableView: UITableView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var inputTextField: UITextField!

    weak var delegate: SecondViewControllerDelegate?

    var numberOfHoles: Int = 0

    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()

    var dictHolePoint: [Int : Int] = [:]

    var arrayDictKeys:[Int] = []
    var arrayDictValues:[Int] = []

    var sumPointsForGame: Int = 0

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidSave(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        prepopulateTableView()

        inputTextField.placeholder = "Enter a name of the game"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func prepopulateTableView() {
        initializeArrays()
        saveBtn.isEnabled = false
    }

    func initializeArrays() {
        allCellsText = [String?](repeating: nil, count: numberOfHoles)
        print("The array of cells text is: \(allCellsText)")
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfHoles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holePointCell", for: indexPath) as! PrototypeTableViewCell

        cell.holeLabel.text = "Hole: \(indexPath.row + 1)"
        cell.pointsTextField.placeholder = "Enter points for hole:\(indexPath.row + 1)"

        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self

        return cell
    }
}

extension SecondViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")

        var sum: Int = 0

        for i in 0..<arrayWithPoints.count {
            print("The position:\(i) has value: \(arrayWithPoints[i])")
            dictHolePoint[i] = arrayWithPoints[i]
            arrayDictKeys = Array(dictHolePoint.keys.sorted())
            print("The array of keys is: \(arrayDictKeys)")
            arrayDictValues = Array(dictHolePoint.values.sorted())
            print("The array of values is: \(arrayDictValues)")
            sum += arrayWithPoints[i]
        }

        sumPointsForGame = sum
        print("The sum of the games points are: \(sumPointsForGame)")

        for (key, value) in dictHolePoint.sorted(by: <) {
            print("Hole number \(key + 1) has \(value) scored points")
        }
    }

    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if !((inputTextField.text?.isEmpty)!) {
            saveBtn.isEnabled = true
        } else {
            saveBtn.isEnabled = false
        }

        return true
    }
}
