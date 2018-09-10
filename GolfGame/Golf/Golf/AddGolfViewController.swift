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
    // function used for editing a game
    func controllerDidEdit(_ controller: AddGolfViewController, didEdit: GolfGame)
}

class AddGolfViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var numberHolesTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!

    var selectedGame: GolfGame?

    var manageGolfGame = ManageGolfGame()

    var numberHoles: Int = 0

    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()

    var dictionaryHolePoints: [Int : Int] = [:]

    var arrayWithHoles: [Int] = []

    var arrayDictValues: [Int] = []

    var sumOfPoints: Int = 0

    weak var delegate: AddGolfViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        numberHolesTableView.register(AddGolfTableViewCell.self, forCellReuseIdentifier: "cellAdd")

        numberHolesTableView.rowHeight = UITableViewAutomaticDimension
        numberHolesTableView.estimatedRowHeight = 44

        if let game = selectedGame {
            title = "Editing a game"

            let idOfSelectedGame = game.id
            print("The id of the selected game is: \(idOfSelectedGame)")
            let nameOfSelectedGame = game.name
            print("The name of the selected game is: \(nameOfSelectedGame)")
            let pointsScoredOfSelectedGame = game.pointsScored
            print("The scored points of the selected game is: \(pointsScoredOfSelectedGame)")
            let dictionaryHolePointsOfSelectedGame = game.dictHolePoints
            print("The hole with points of the selected game is: \(dictionaryHolePointsOfSelectedGame)")

            nameTextField.text = nameOfSelectedGame

            let sortedDictionary = dictionaryHolePointsOfSelectedGame.sorted { $0.key < $1.key }

            var arrayKeys: [Int] = []
            var arrayValues: [Int] = []

            for (key, value) in sortedDictionary {
                arrayKeys.append(key)
                arrayValues.append(value)
            }

            for i in 1...arrayKeys.count {
                arrayWithHoles.append(i)
            }

            arrayDictValues = arrayValues

            let arrayOfOptionalDictionaryValues = arrayDictValues.map {
                Optional(String($0))
            }
            allCellsText = arrayOfOptionalDictionaryValues

            btnSave.isEnabled = false
        } else {
            prepopulateTableView()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddGameMode = presentingViewController is UINavigationController

        if isPresentingInAddGameMode {
           delegate?.controllerDidCancel(self)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddGolfViewController is not inside navigationController.")
        }
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddGameMode = presentingViewController is UINavigationController

        if isPresentingInAddGameMode {
            var newID: Int
            if manageGolfGame.games.isEmpty {
                newID = 0
            } else {
                newID = (manageGolfGame.games.last?.id)!
                newID = newID + 1
            }
            let newGame = GolfGame(id: newID, name: nameTextField.text ?? "", pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)

            print("The new game has id: \(String(describing: newGame?.id)), name: \(String(describing: newGame?.name)), pointsScored: \(String(describing: newGame?.pointsScored)), hole-points: \(String(describing: newGame?.dictHolePoints.sorted(by: >)))")

            if let addGame = newGame {
                delegate?.controllerDidSave(self, didSave: addGame)
            }

            for (key, value) in dictionaryHolePoints.sorted(by: >) {
                print("The key of the dicitonary: \(key) has value: \(value)")
            }
        } else if let owningNavigationController = navigationController {
            let gameEditID = selectedGame?.id
            print("The id of the selected game is: \(String(describing: gameEditID))")
            let gameEditName = selectedGame?.name
            print("The name of the selected game is: \(String(describing: gameEditName))")

            if let editGameID = gameEditID {
                let editGame = GolfGame(id: editGameID, name: nameTextField.text ?? "", pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)

                if let newGameAfterEdit = editGame {
                    delegate?.controllerDidEdit(self, didEdit: newGameAfterEdit)
                }
            }

            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The AddGolfViewController is not inside a navigationcontroller.")
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

        for i in 1...numberHoles {
            arrayWithHoles.append(i)
        }

        for j in 0..<arrayWithHoles.count {
            dictionaryHolePoints[j] = j
        }
    }
}

// MARK: TableView Delegates
extension AddGolfViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayWithHoles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdd", for: indexPath as IndexPath) as! AddGolfTableViewCell

        cell.labHoles.text = "Hole: \(arrayWithHoles[indexPath.row])"
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

        if let userInput = nameTextField.text {
            if !(userInput.isEmpty) {
                btnSave.isEnabled = true
            } else {
                btnSave.isEnabled = false
            }
        }

        return true
    }
}
