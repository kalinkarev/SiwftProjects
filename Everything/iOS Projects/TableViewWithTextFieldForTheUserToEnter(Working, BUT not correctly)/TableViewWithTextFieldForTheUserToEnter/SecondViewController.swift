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
}

class SecondViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var holesPointsTableView: UITableView!

    weak var delegate: SecondViewControllerDelegate?
    
    var numberOfHoles: Int = 0
    
    var arrayHoles: [String] = []
    var arrayWithPoints = [Int]()
    var allCellsText = [String?]()
    
    var dictHolePoint: [Int : Int] = [:]
    
    var arrayDictKeys:[Int] = []
    var arrayDictValues:[Int] = []
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepopulateTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        arrayDictValues = UserDefaults.standard.array(forKey: "arrayDictKeys") as! [Int]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        holesPointsTableView.reloadData()
    }

    func prepopulateTableView() {
//        self.holesPointsTableView.reloadData()
        initializeArrays()
    }

    func initializeArrays() {
        arrayHoles = [String](repeating: "hello", count: numberOfHoles)
        print("The array of holes is: \(arrayHoles)")
        allCellsText = [String?](repeating: nil, count: numberOfHoles)
        print("The array of cells text is: \(allCellsText)")
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfHoles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "holePointCell", for: indexPath as IndexPath) as! PrototypeTableViewCell

            cell.holeLabel.text = "Hole: \(indexPath.row + 1)"

            cell.pointsTextField.delegate = self
            cell.pointsTextField.text = ""
            cell.pointsTextField.placeholder = "Enter points for hole: \(indexPath.row + 1)"
            arrayHoles[indexPath.row] = cell.pointsTextField.placeholder!

//            for i in 0..<arrayDictKeys.count {
//                cell.pointsTextField.text = String(arrayDictValues[i])
//            }
        
            return cell
    }
}

extension SecondViewController: UITextFieldDelegate {
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
                
                let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }
                arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
                print("The array of points is: \(arrayWithPoints)")

                for i in 0..<arrayWithPoints.count {
                    print("The position:\(i) has value:\(arrayWithPoints[i])")
                    dictHolePoint[i] = arrayWithPoints[i]
                    arrayDictKeys = Array(dictHolePoint.keys.sorted())
                    print("The array of keys is: \(arrayDictKeys)")
                    arrayDictValues = Array(dictHolePoint.values.sorted())
                    print("The array of values is: \(arrayDictValues)")
                }
            }
        }
        print("The dictionary is: \(dictHolePoint.sorted(by: <))")
    }
    
    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
