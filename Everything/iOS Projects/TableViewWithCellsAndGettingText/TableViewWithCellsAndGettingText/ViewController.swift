//
//  ViewController.swift
//  TableViewWithCellsAndGettingText
//
//  Created by Kalin Karev on 8/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var numberOfRows: Int = 15
    
    var userInput: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    @IBAction func showResultButton(_ sender: UIButton) {
        print("You have pressed the show button")

        print("The lenght of the array is: \(userInput.count)")

        print("The user input is: \(userInput)")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyTableViewCell

        cell.nameTextField.placeholder = "Enter"

        userInput.insert(cell.nameTextField.text!, at: indexPath.row)

        print("The user input is: \(userInput)")

        return cell
    }
}
