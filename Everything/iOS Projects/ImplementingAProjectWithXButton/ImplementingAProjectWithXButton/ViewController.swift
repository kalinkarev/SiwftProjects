//
//  ViewController.swift
//  ImplementingAProjectWithXButton
//
//  Created by Kalin Karev on 9/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var flags: [Bool] = Array(repeating: false, count: 5)

    var dictHoleXButton: [Int : Bool] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        print("The array of flags is: \(flags)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeAnArraysElement(arr: [Bool], element: Bool, position: Int) -> [Bool] {
        var array = arr
//        print("The array is: \(array)")

        array.remove(at: position)
//        print("The array is: \(array)")

        array.insert(element, at: position)
//        print("The array is: \(array)")

        return array
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problems with the cell in the table view")
        }

        cell.holeLabel.text = "Hole \(indexPath.row)"
        cell.pointsTextField.placeholder = "Points for \(indexPath.row) hole"

        cell.delegateCell = self

        return cell
    }
}

extension ViewController: MainScreenTableViewCellDelegate {
    func didTapButton(_ cell: MainScreenTableViewCell) {

        let indexOfXButtonCell = self.userTableView.indexPath(for: cell)

        if let indexCell = indexOfXButtonCell {
            print("The user has clicked the X button for cell: \(indexCell[1])")

            flags = changeAnArraysElement(arr: flags, element: true, position: indexCell[1])

            cell.pointsTextField.text = "X"
            cell.btnX.isHidden = true
        }

//        print("The cell x array is: \(flags)")

        for i in 0..<flags.count {
            print("The position:\(i) has value: \(flags[i])")

            dictHoleXButton[i] = flags[i]
        }

        for (key, value) in dictHoleXButton {
            print("The key: \(key) has value: \(value)")
        }

    }
}
