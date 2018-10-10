//
//  ViewController.swift
//  ApplicationWithActionSheetAndTableView
//
//  Created by Kalin Karev on 8/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var userTableView: UITableView!
    
    var numberOfHoles: Int = 0
    
    let animal: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTableView.isHidden = true
        self.showActionSheet()
    }

//    var allCellsText = [String?](repeating: nil, count: numberOfHoles)
    var numberCells = [String?]()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showActionSheet() {
//        print("Showing")
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let oneButton = UIAlertAction(title: "One hole", style: .default, handler: {
            (action) -> Void in
            print("One hole")
            self.numberOfHoles = 1
        })
        let twoButon = UIAlertAction(title: "Two", style: .default, handler: {
            (action) -> Void in
            print("Two holes")
            self.numberOfHoles = 2
        })
        let threeButton = UIAlertAction(title: "Three", style: .default, handler: {
            (action) -> Void in
            print("Three holes")
            self.numberOfHoles = 3
        })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(oneButton)
        alertController.addAction(twoButon)
        alertController.addAction(threeButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
//    func showActionSheet() {
//            let alertController = UIAlertController(title: "Shoose how many holes do you want to play with", message: nil, preferredStyle: .actionSheet)
//
//            let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
//                (action) -> Void in
//                print("Nine holes")
//                self.numberOfHoles = 9
//                self.prepopulateTableView()
//            })
//            let tenButton = UIAlertAction(title: "Ten holes", style: .default, handler: {
//                (action) -> Void in
//                print("Ten holes")
//                self.numberOfHoles = 10
//                self.prepopulateTableView()
//            })
//            let elevenButton = UIAlertAction(title: "Eleven holes", style: .default, handler: {
//                (action) -> Void in
//                print("Eleven holes")
//                self.numberOfHoles = 11
//                self.prepopulateTableView()
//            })
//            let twelveButton = UIAlertAction(title: "Twelve holes", style: .default, handler: {
//                (action) -> Void in
//                print("Twelve holes")
//                self.numberOfHoles = 12
//                self.prepopulateTableView()
//            })
//            let thirteenButton = UIAlertAction(title: "Thirteen holes", style: .default, handler: {
//                (action) -> Void in
//                print("Thirteen holes")
//                self.numberOfHoles = 13
//                self.prepopulateTableView()
//            })
//            let fourteenButton = UIAlertAction(title: "Fourteen holes", style: .default, handler: {
//                (action) -> Void in
//                print("Fourteen holes")
//                self.numberOfHoles = 14
//                self.prepopulateTableView()
//            })
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
//            (action) -> Void in
//            print("Cancel button tapped")
//        })
//
//        var allCellsText = [String?](repeating: nil, count: self.numberOfHoles)
//
//        numberCells = allCellsText
//
//        alertController.addAction(nineButton)
//        alertController.addAction(tenButton)
//        alertController.addAction(elevenButton)
//        alertController.addAction(twelveButton)
//        alertController.addAction(thirteenButton)
//        alertController.addAction(fourteenButton)
//        alertController.addAction(cancelButton)
//
//        self.present(alertController, animated: true, completion: nil)
//    }
    
    func prepopulateTableView() {
        userTableView.isHidden = false
        self.userTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfHoles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = "Hole: \(indexPath)"
        
        cell.pointsTextField.delegate = self
        
        cell.pointsTextField.text = ""
        
        cell.pointsTextField.placeholder = animal[indexPath.row]
        
        cell.pointsTextField.autocorrectionType = UITextAutocorrectionType.no
        
        cell.pointsTextField.autocapitalizationType = UITextAutocapitalizationType.none
        
        cell.pointsTextField.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = animal.index(of: textField.placeholder!)
        
        print(indexOf!)
        
        if (textField.placeholder! == animal[indexOf!]) {
            if (indexOf! <= (numberCells.count - 1)) {
                numberCells.remove(at: indexOf!)
            }
            
            numberCells.insert(textField.text!, at: indexOf!)
            print(numberCells)
        }
    }
    
    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
