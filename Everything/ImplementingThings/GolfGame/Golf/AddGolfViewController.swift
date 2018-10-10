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

    var manageGolfGame = ManageGolfGame()
    
    var numberHoles: Int = 0

    weak var delegate: AddGolfViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        numberHolesTableView.register(AddGolfTableViewCell.self, forCellReuseIdentifier: "cellAdd")

        hideElementOnTheScreen()
        showActionSheet()
    }

    func hideElementOnTheScreen() {
        numberHolesTableView.isHidden = true
        nameTextField.isHidden = true
    }

    func showElementsOnTheScreen() {
        numberHolesTableView.isHidden = false
        nameTextField.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        print("You have pressed the cancel button")
        delegate?.controllerDidCancel(self)
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        print("You have pressed the save button")

        var newID: Int
        if manageGolfGame.games.isEmpty {
            newID = 0
        } else {
            newID = (manageGolfGame.games.last?.id)!
            newID = newID + 1
        }
        print("The new id is: \(newID)")
        let newGame = GolfGame(id: newID, name: nameTextField.text!, numberOfHoles: numberHoles)
        delegate?.controllerDidSave(self, didSave: newGame!)
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
        showElementsOnTheScreen()
        self.numberHolesTableView.reloadData()
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

// TableView Delegates
extension AddGolfViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberHoles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdd", for: indexPath) as! AddGolfTableViewCell

        var counter: Int = 1
        for c in 0..<indexPath.row {
            counter = c
            counter = indexPath.row + 1
        }

        cell.labHoles.text = "Hole: \(counter)"
//        cell.txtPoint.text = "Enter number for hole: \(counter)"

        return cell
    }
}
