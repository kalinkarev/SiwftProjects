//
//  ViewController.swift
//  ActionSheetWithGettingTheContextOfEachCell
//
//  Created by Kalin Karev on 8/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var numberOfHoles: Int = 0

    var arrayOfCell:[CustomTableViewCell] = []
    var textFieldArray: [String] = []

    var pointsArray: [Int] = []
    
    var arrayInput: [String] = []

    var dictionaryHolesPoints: [Int: Int] = [:]
    var dict: [Int : String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        hideElementOnTheScreen()

        showActionSheet()
    }

    func hideElementOnTheScreen() {
        userTableView.isHidden = true
    }
    
    func showElementOnTheScreen() {
        userTableView.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func saveButton(_ sender: UIBarButtonItem) {

        print(arrayInput)
        
        for j in 0..<numberOfHoles {
            print("The j variable is: \(j + 1)")
        }

        print("The number of holes is: \(numberOfHoles)")

//        for cell in arrayOfCell {
//            textFieldArray.append(cell.inputTextField.text!)
//        }

//        for element in arrayOfCell {
//            if (element.inputTextField.text?.isEmpty)! {
//                textFieldArray.append("0")
//            } else {
//                textFieldArray.append(element.inputTextField.text!)
//            }
//        }

        arrayOfCell.forEach { cell in
            if (cell.inputTextField.text?.isEmpty)! {
                textFieldArray.append("0")
            } else {
                textFieldArray.append(cell.inputTextField.text!)
            }
        }
        print(textFieldArray)

        print("The user has entered: \(textFieldArray.count) items.")

//        pointsArray = textFieldArray.map {
//            Int($0) ?? 0
//        }
//
//        print(pointsArray)

//        for i in 0..<pointsArray.count {
//            print("The hole: \(i + 1) has points: \(pointsArray[i])")
//        }

    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Shoose how many holes do you want to play with", message: nil, preferredStyle: .actionSheet)
        
        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("Nine holes")
            self.numberOfHoles = 9
            self.prepopulateTableView()
        })
        let tenButton = UIAlertAction(title: "Ten holes", style: .default, handler: {
            (action) -> Void in
            print("Ten holes")
            self.numberOfHoles = 10
            self.prepopulateTableView()
        })
        let elevenButton = UIAlertAction(title: "Eleven holes", style: .default, handler: {
            (action) -> Void in
            print("Eleven holes")
            self.numberOfHoles = 11
            self.prepopulateTableView()
        })
        let twelveButton = UIAlertAction(title: "Twelve holes", style: .default, handler: {
            (action) -> Void in
            print("Twelve holes")
            self.numberOfHoles = 12
            self.prepopulateTableView()
        })
        let thirteenButton = UIAlertAction(title: "Thirteen holes", style: .default, handler: {
            (action) -> Void in
            print("Thirteen holes")
            self.numberOfHoles = 13
            self.prepopulateTableView()
        })
        let fourteenButton = UIAlertAction(title: "Fourteen holes", style: .default, handler: {
            (action) -> Void in
            print("Fourteen holes")
            self.numberOfHoles = 14
            self.prepopulateTableView()
        })
        let fifteenButton = UIAlertAction(title: "Fifteen holes", style: .default, handler: {
            (action) -> Void in
            print("Fifteen holes")
            self.numberOfHoles = 15
            self.prepopulateTableView()
        })
        let sixteenButton = UIAlertAction(title: "Sixteen holes", style: .default, handler: {
            (action) -> Void in
            print("Sixteen holes")
            self.numberOfHoles = 16
            self.prepopulateTableView()
        })
        let seventeenButton = UIAlertAction(title: "Seventeen holes", style: .default, handler: {
            (action) -> Void in
            print("Seventeen holes")
            self.numberOfHoles = 17
            self.prepopulateTableView()
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("Eighteen holes")
            self.numberOfHoles = 18
            self.prepopulateTableView()
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(nineButton)
        alertController.addAction(tenButton)
        alertController.addAction(elevenButton)
        alertController.addAction(twelveButton)
        alertController.addAction(thirteenButton)
        alertController.addAction(fourteenButton)
        alertController.addAction(fifteenButton)
        alertController.addAction(sixteenButton)
        alertController.addAction(seventeenButton)
        alertController.addAction(eighteenButton)
        alertController.addAction(cancelButton)

        self.present(alertController, animated: true, completion: nil)
    }

    func prepopulateTableView() {
        showElementOnTheScreen()
        self.userTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfHoles
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
//
//        var scoreArray: [String] = []
//
//        scoreArray.insert(cell.inputTextField.text!, at: indexPath.row)
//    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.cellForRow(at: indexPath) as? CustomTableViewCell
//
//        arrayInput.insert((cell?.inputTextField.text!)!, at: indexPath.row)
//
//        return cell!
//    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CustomTableViewCell

//        arrayInput.insert(cell.inputTextField.text!, at: indexPath.row)

        arrayInput.append(cell.inputTextField.text!)

        return cell
    }

//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell  = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CustomTableViewCell
//
////        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "tableViewCell") as! CustomTableViewCell
//
////        arrayOfCell.append(cell)
//
//        cell.nameLabel.text = "Hole number \(indexPath.row + 1)"
//        cell.inputTextField.placeholder = "Enter the points"
//
//        return cell
//    }
}
