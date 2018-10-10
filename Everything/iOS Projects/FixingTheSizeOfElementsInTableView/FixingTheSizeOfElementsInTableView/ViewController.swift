//
//  ViewController.swift
//  FixingTheSizeOfElementsInTableView
//
//  Created by Kalin Karev on 9/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeTheSize() {
        var frame = userTableView.frame

        let h = frame.height
        print("The height of the table view is: \(h)")

        let withKeyboard = (h * 40) / 100
        print("The height with keyboard is: \(withKeyboard)")

        frame.size.height = h - withKeyboard

        userTableView.frame = frame
        print("The table view is with dimensions: \(userTableView.frame.height) and \(userTableView.frame.width)")
    }
}

// MARK: UITableView Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problem with the cell in the talbe view")
        }

        cell.holeLabel.text = "Hole \(indexPath.row)"
        cell.pointsTextField.placeholder = "Points for hole \(indexPath.row)"

//        cell.pointsTextField.delegate = self

        return cell
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        print("The user has started inputting in the text field of the cell")
//        changeTheSize()
//    }
//}
