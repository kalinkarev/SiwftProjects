//
//  ViewController.swift
//  TestingApplication
//
//  Created by Kalin Karev on 9/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Extension for UITableView delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"

        guard let cell = userTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problem with the cell in the table view")
        }

        cell.inputTextField.placeholder = "Enter name for cell \(indexPath.row)"

        return cell
    }
}
