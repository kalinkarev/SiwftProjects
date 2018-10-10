//
//  AddGolfViewController.swift
//  Golf
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddGolfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var numberHolesTableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var numberHoles: Int = 0
    
//    var sessionNumber: Int = 0
//    var sections: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numberHolesTableView.register(AddGolfTableViewCell.self, forCellReuseIdentifier: "cellAdd")
        
        numberHolesTableView.isHidden = true
        
        showActionSheet()
    }
    
    func showTableView() {
        numberHolesTableView.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have presed the cancel button")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose how many holes do you want to play with", message: nil, preferredStyle: .actionSheet)
        
        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("Nine holes")
            self.numberHoles = 9
            self.prepopulateTableView()
        })
        let tenButton = UIAlertAction(title: "Ten holes", style: .default, handler: {
            (action) -> Void in
            print("Ten holes")
            self.numberHoles = 10
            self.prepopulateTableView()
        })
        let elevenButton = UIAlertAction(title: "Eleven holes", style: .default, handler: {
            (action) -> Void in
            print("Eleven holes")
            self.numberHoles = 11
            self.prepopulateTableView()
        })
        let twelveButton = UIAlertAction(title: "Twelve holes", style: .default, handler: {
            (action) -> Void in
            print("Twelve holes")
            self.numberHoles = 12
            self.prepopulateTableView()
        })
        let thirteenButton = UIAlertAction(title: "Thirteen holes", style: .default, handler: {
            (action) -> Void in
            print("Thirteen holes")
            self.numberHoles = 13
            self.prepopulateTableView()
        })
        let fourteenButton = UIAlertAction(title: "Fourteen holes", style: .default, handler: {
            (action) -> Void in
            print("Fourteen holes")
            self.numberHoles = 14
            self.prepopulateTableView()
        })
        let fifteenButton = UIAlertAction(title: "Fifteen holes", style: .default, handler: {
            (action) -> Void in
            print("Fifteen holes")
            self.numberHoles = 15
            self.prepopulateTableView()
        })
        let sixteenButton = UIAlertAction(title: "Sixteen holes", style: .default, handler: {
            (action) -> Void in
            print("Sixteen holes")
            self.numberHoles = 16
            self.prepopulateTableView()
        })
        let seventeenButton = UIAlertAction(title: "Seventeen holes", style: .default, handler: {
            (action) -> Void in
            print("Seventeen holes")
            self.numberHoles = 17
            self.prepopulateTableView()
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("Eighteen holes")
            self.numberHoles = 18
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
    
    func printTheNumber() {
        print("The number of holes is equal to: \(self.numberHoles)")
    }
    
    func prepopulateTableView() {
        printTheNumber()
        showTableView()
        self.numberHolesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberHoles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdd", for: indexPath) as! AddGolfTableViewCell

        var result = UITableViewCell()

//        switch numberHoles {
//        case 9:
//            holes = 1
//        case 10:
//            holes = 2
//        case 11:
//            holes = 3
//        case 12:
//            holes = 4
//        case 13:
//            holes = 5
//        case 14:
//            holes = 6
//        case 15:
//            holes = 7
//        case 16:
//            holes = 8
//        case 17:
//            holes = 9
//        case 18:
//            holes = 10
//        default:
//            holes = 0
//        }
        
//        print("The numeber of holes is: \(holes)")

        cell.labHoles.text = "I am label"
        cell.txtPoint.text = "I am text field"
        
        result = cell

        var i = 0
        
        repeat {
            i += 1
            cell.labHoles.text = "I am label \(i)"
            cell.txtPoint.text = "I am text field \(i)"
            
            print("The i element is: \(i)")
            
            return result
        } while (i < numberHoles)
        
//        return result
//        var i: Int = 1
//
//        while i < numberHoles {
//            print("The element is: \(i)")
//
//            i += 1
//
//            cell.labHoles.text = "I am label \(i)"
//            cell.txtPoint.text = "I am text field \(i)"
//
//            result = cell
//        }
        
//        while (i <= numberHoles) {
//            print(i)
//
//            i += 1
//
//            cell.labHoles.text = "\(i)"
//            cell.txtPoint.text = "\(i)"
//
//            return cell
//        }
        
//        while i < numberHoles {
//
//            cell.labHoles.text = "I am label \(i + 1)"
//            cell.txtPoint.text = "I am text field \(i + 1)"
//
//            i += 1
//
//            print("The counter is: \(i + 1)")
//
//            return cell
//        }
        
//        return cell
//        return cell
//        return result
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
