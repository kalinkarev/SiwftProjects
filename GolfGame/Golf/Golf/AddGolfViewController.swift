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
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var btnSave: UIBarButtonItem!

    var selectedGame: GolfGame?

    var manageGolfGame = ManageGolfGame()

    var numberHoles: Int = 0

    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()

    var able = false

    var dictionaryHolePoints: [Int : Int] = [:]

    var arrayWithHoles: [Int] = []

    var arrayDictValues: [Int] = []

    var sumOfPoints: Int = 0

    weak var delegate: AddGolfViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        inputTextView.text = "Enter name of the game"
        inputTextView.textColor = UIColor.lightGray
        inputTextView.delegate = self

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

            inputTextView.text = nameOfSelectedGame
            inputTextView.textColor = UIColor.black

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
            let newGame = GolfGame(id: newID, name: inputTextView.text ?? "", pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)

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
                let editGame = GolfGame(id: editGameID, name: inputTextView.text ?? "", pointsScored: sumOfPoints, dictHolePoints: dictionaryHolePoints)

                print("The edited game has id: \(String(describing: editGame?.id)), name: \(String(describing: editGame?.name)), points scored: \(String(describing: editGame?.pointsScored)), hole-points: \(String(describing: editGame?.dictHolePoints))")

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

        cell.nameLabelAddScreen.text = "Hole: \(arrayWithHoles[indexPath.row])"
        cell.pointsTexField.placeholder = "Enter points for hole: \(indexPath.row + 1)"

        cell.pointsTexField.text = allCellsText[indexPath.row]
        cell.pointsTexField.tag = indexPath.row
        cell.pointsTexField.delegate = self

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

        let result = arrayWithPoints.all { $0 > 0 }
        print("The result is: \(result)")

        able = result
        print("The variable able has value: \(able)")

        print("The user has entered: \(inputTextView.text)")

        if result == true {
            if !(inputTextView.text.isEmpty) {
                if !(inputTextView.text == "Enter name of the game") {
                    btnSave.isEnabled = true
                } else {
                    btnSave.isEnabled = false
                }
            } else {
                btnSave.isEnabled = false
            }
        } else {
            btnSave.isEnabled = false
        }
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

extension AddGolfViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (textView.text == "Enter name of the game") {
            textView.text = ""
        }
        textView.becomeFirstResponder()
        textView.textColor = UIColor.black
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = "Enter name of the game"
            textView.textColor = UIColor.lightGray
        }
        textView.resignFirstResponder()

        print("The able is: \(able)")

        if !(inputTextView.text.isEmpty) {
            if !(inputTextView.text == "Enter name of the game") {
                if able == true {
                    btnSave.isEnabled = true
                } else {
                    btnSave.isEnabled = false
                }
            } else {
                btnSave.isEnabled = false
            }
        } else {
            btnSave.isEnabled = false
        }

//        if !(inputTextView.text.isEmpty) {
//            if able == true {
//                btnSave.isEnabled = true
//            } else {
//                btnSave.isEnabled = false
//            }
//        } else {
//            btnSave.isEnabled = false
//        }
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
