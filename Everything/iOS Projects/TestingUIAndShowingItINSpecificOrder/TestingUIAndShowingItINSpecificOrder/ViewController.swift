//
//  ViewController.swift
//  TestingUIAndShowingItINSpecificOrder
//
//  Created by Kalin Karev on 9/18/18.
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
}

// MARK: UITableView Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problem with the cell")
        }

        cell.holeLabel.text = "Hole \(indexPath.row + 1)"
        cell.holeTextField.placeholder = "Points for hole \(indexPath.row + 1)"

        cell.delegate = self

        return cell
    }
}

// MARK: Extension -> MainScreenTableViewCell Delegates
extension ViewController: MainScreenTableViewCellDelegate {
    func getCell(_ cell: MainScreenTableViewCell) {
        let indexOfXButtonCell = self.userTableView.indexPath(for: cell)

        if let indexCell = indexOfXButtonCell {
            print("You have cliked cell \(indexCell[1] + 1)")
        }
    }
}
