//
//  ViewController.swift
//  ProjectTableViewCellWithXButton
//
//  Created by Kalin Karev on 10/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problems with the table view cell")
        }
        
        cell.holeLabel.text = "Hole \(indexPath.row)"
        cell.pointsTextField.placeholder = "Points for hole \(indexPath.row)"
        
        cell.delegateCell = self
        
        return cell
    }
}

extension ViewController: MainScreenTableViewCellDelegate {
    func didTapButton(_ cell: MainScreenTableViewCell) {
        let indexOfXButtonCell = self.userTableView.indexPath(for: cell)

        if let indexCell = indexOfXButtonCell {
            print("The user has clicked the X butto for cell: \(indexCell[1])")
        }
    }
}

