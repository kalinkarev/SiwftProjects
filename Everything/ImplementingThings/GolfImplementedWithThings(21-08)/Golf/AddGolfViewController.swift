//
//  AddGolfViewController.swift
//  Golf
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddGolfViewControllerDelegate: AnyObject {
    // function used for cancelling the save of new game
    func controllerDidCancel(_ controller: AddGolfViewController)
    // function used for saving the new game
    func controllerDidSave(_ controller: AddGolfViewController, didSave: GolfGame)
}

class AddGolfViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var numberHolesTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!

    var manageGolfGame = ManageGolfGame()

    var numberHoles: Int = 0

    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()

    var dictionaryHolePoints: [Int : Int] = [:]

    var arrayDictKeys: [Int] = []
    var arrayDictValues: [Int] = []

    var sumOfPoints: Int = 0

    weak var delegate: AddGolfViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        numberHolesTableView.register(AddGolfTableViewCell.self, forCellReuseIdentifier: "cellAdd")

        numberHolesTableView.rowHeight = UITableViewAutomaticDimension
        numberHolesTableView.estimatedRowHeight = 44

        prepopulateTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        var newID: Int
        if manageGolfGame.games.isEmpty {
            newID = 0
        } else {
            newID = (manageGolfGame.games.last?.id)!
            newID = newID + 1
        }
        let newGame = GolfGame(id: newID, name: nameTextField.text ?? "", pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)

        print("The new game has id: \(String(describing: newGame?.id)), name: \(String(describing: newGame?.name)), pointsScored: \(String(describing: newGame?.pointsScored)), hole-points: \(String(describing: newGame?.dictHolePoints.sorted(by: >)))")

        delegate?.controllerDidSave(self, didSave: newGame!)

        for (key, value) in dictionaryHolePoints.sorted(by: >) {
            print("The key of the dicitonary: \(key) has value: \(value)")
        }
    }

    func printTheNumberOfHoles() {
        print("The number of holes is equal to: \(self.numberHoles)")
    }

    func prepopulateTableView() {
        printTheNumberOfHoles()
        initializeArrays()
        btnSave.isEnabled = false
    }

    func initializeArrays() {
        allCellsText = [String?](repeating: nil, count: numberHoles)
        print("The array of cells text is: \(allCellsText)")
    }
}

// MARK: TableView Delegates
extension AddGolfViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberHoles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdd", for: indexPath as IndexPath) as! AddGolfTableViewCell

        cell.labHoles.text = "Hole: \(indexPath.row + 1)"
        cell.txtPoint.placeholder = "Enter points for hole: \(indexPath.row + 1)"

        cell.txtPoint.text = allCellsText[indexPath.row]
        cell.txtPoint.tag = indexPath.row
        cell.txtPoint.delegate = self

        return cell
    }
}

// MARK: TextField Delegates
extension AddGolfViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")

        var sum: Int = 0

        for i in 0..<arrayWithPoints.count {
            print("The position:\(i) has value: \(arrayWithPoints[i])")
            dictionaryHolePoints[i] = arrayWithPoints[i]
            arrayDictKeys = Array(dictionaryHolePoints.keys.sorted())
            print("The array of keys is: \(arrayDictKeys)")
            arrayDictValues = Array(dictionaryHolePoints.values.sorted())
            print("The array of values is: \(arrayDictValues)")
            sum += arrayWithPoints[i]
        }

        sumOfPoints = sum
        print("The sum of the games points are: \(sumOfPoints)")

        for (key, value) in dictionaryHolePoints.sorted(by: <) {
            print("Hole number \(key + 1) has \(value) scored points")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if !(nameTextField.text!.isEmpty) {
            btnSave.isEnabled = true
        } else {
            btnSave.isEnabled = false
        }

        return true
    }
}
