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
    
    var arrayHoles: [String] = []
    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()
    
    var dictionaryHolePoints: [Int : Int] = [:]
    
    var sumOfPoints: Int = 0
    
    weak var delegate: AddGolfViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numberHolesTableView.register(AddGolfTableViewCell.self, forCellReuseIdentifier: "cellAdd")
        
        btnSave.isEnabled = false
        
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
        let newGame = GolfGame(id: newID, name: nameTextField.text ?? "", pointsScored: sumOfPoints)
        
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
        self.numberHolesTableView.reloadData()
        
        initializeArrays()
    }

    func initializeArrays() {
        arrayHoles = [String](repeating: "hello", count: numberHoles)
        print("The array of holes is: \(arrayHoles)")
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
        
        cell.txtPoint.delegate = self
        cell.txtPoint.text = ""
        cell.txtPoint.placeholder = "Enter for hole: \(indexPath.row + 1)"
        arrayHoles[indexPath.row] = cell.txtPoint.placeholder!
        cell.txtPoint.autocorrectionType = UITextAutocorrectionType.no
        cell.txtPoint.autocapitalizationType = UITextAutocapitalizationType.none
        cell.txtPoint.adjustsFontSizeToFitWidth = true
        
        return cell
    }
}

// MARK: TextField Delegates
extension AddGolfViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = arrayHoles.index(of: textField.placeholder ?? "")
        
        if let indexWithoutOptional = indexOf {
            print("The index of the entered text field is: \(indexWithoutOptional)")
            
            if (textField.placeholder ?? "" == arrayHoles[indexWithoutOptional]) {
                if (indexWithoutOptional <= (allCellsText.count - 1)) {
                    allCellsText.remove(at: indexWithoutOptional)
                }
                
                allCellsText.insert(textField.text ?? "", at: indexWithoutOptional)
                print("The array with points is: \(allCellsText)")
            }
        }

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
        
        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The points are: \(arrayWithPoints)")
        
        var sum: Int = 0
        for i in 0..<arrayWithPoints.count {
            dictionaryHolePoints[i] = arrayWithPoints[i]
            sum += arrayWithPoints[i]
        }
        
        sumOfPoints = sum
        print("The sum of points that the user has scored: \(sumOfPoints)")
    }
    
    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if !(nameTextField.text?.isEmpty)! {
            btnSave.isEnabled = true
        } else {
            btnSave.isEnabled = false
        }
    }
}
