//
//  AddItemViewController.swift
//  GolfGame
//
//  Created by Kalin Karev on 8/22/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var saveButton: UIBarButtonItem!

    @IBOutlet weak var gameTableView: UITableView!

    var game: Game?

    var numberHoles: Int = 0
    
    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()
    
    var dictionaryHolePoints: [Int : Int] = [:]
    
    var arrayDictKeys: [Int] = []
    var arrayDictValues: [Int] = []
    
    var sumOfPoints: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        if let game = game {
            nameTextField.text = game.name

//            let cellLabel = game.dictionaryHolePoints.keys.sorted()
//            let cellTextField = game.dictionaryHolePoints.values.sorted()
//
//            print("The label of cells is: \(cellLabel)")
//            print("The text field of cell is: \(cellTextField)")
//
//            let result = gameTableView.dequeueReusableCell(withIdentifier: "addScreenCell") as! AddScreenTableViewCell
//            result.holeLabel.text = String(describing: cellLabel)
//            result.pointsTextField.text = String(describing: cellTextField)

            let numberOfCells = game.dictionaryHolePoints.keys.count
            
            let n = tableView(gameTableView, numberOfRowsInSection: numberOfCells)
            print("The variable n is: \(n)")
            let m = gameTableView.dequeueReusableCell(withIdentifier: "addScreenCell") as! AddScreenTableViewCell
            print("The variable m is: \(m)")
            
/*
            //            let cell = gameTableView.dequeueReusableCell(withIdentifier: "addScreenCell") as! AddScreenTableViewCell
            
            let numberHoleOfGame = game.dictionaryHolePoints.keys.count
            print("The number of holes is: \(numberHoleOfGame)")

//            tableView(gameTableView, numberOfRowsInSection: game.dictionaryHolePoints.keys.count)
            var result = tableView(gameTableView, numberOfRowsInSection: numberHoleOfGame)

            print("The holes label is: \(game.dictionaryHolePoints.keys.sorted())")
            print("The ponts text field is: \(game.dictionaryHolePoints.values.sorted())")

            let cell = gameTableView.dequeueReusableCell(withIdentifier: "addScreenCell") as! AddScreenTableViewCell

            cell.holeLabel.text = String(describing: game.dictionaryHolePoints.keys.sorted())
            cell.pointsTextField.text = String(describing: game.dictionaryHolePoints.values.sorted())

//            cell.holeLabel.text = String(describing: game.dictionaryHolePoints.keys)
//            cell.pointsTextField.text = String(describing: game.dictionaryHolePoints.values)
*/
        }
        
        prepopulateTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepopulateTableView() {
        initializeArrays()
//        saveButton.isEnabled = false
    }
    
    func initializeArrays() {
        allCellsText = [String?](repeating: nil, count: numberHoles)
        print("The array of cells text is: \(allCellsText)")
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddGameMode = presentingViewController is UINavigationController
        
        if (isPresentingInAddGameMode) {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddItemViewController is not insode navigaition controller.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            fatalError("The save button was not pressed, cancelling")
        }

        let name = nameTextField.text ?? ""

        game = Game(name: name, pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)
    }
}

extension AddItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberHoles
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addScreenCell", for: indexPath as IndexPath) as! AddScreenTableViewCell

        cell.holeLabel.text = "Hole: \(indexPath.row + 1)"
        cell.pointsTextField.placeholder = "Enter points for hole: \(indexPath.row + 1)"

        cell.pointsTextField.text = allCellsText[indexPath.row]
        cell.pointsTextField.tag = indexPath.row
        cell.pointsTextField.delegate = self

        return cell
    }
}

extension AddItemViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        allCellsText[textField.tag] = textField.text
        print("The array is: \(allCellsText)")
        
        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The array of points is: \(arrayWithPoints)")
        
        var sum: Int = 0
        
        for i in 0..<arrayWithPoints.count {
            print("The position: \(i) has value: \(arrayWithPoints[i])")
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
            print("Hole number \(key) has \(value) scored points.")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if !(nameTextField.text!.isEmpty) {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }

        return true
    }
}
