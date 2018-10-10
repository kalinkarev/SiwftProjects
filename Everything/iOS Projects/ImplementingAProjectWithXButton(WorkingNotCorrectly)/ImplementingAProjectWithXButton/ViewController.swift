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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("The array of flags is: \(flags)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func changeAnArraysElement(arr: [Bool], element: Bool, position: Int) -> [Bool] {
        var array = arr
        print("The array is: \(array)")

        array.remove(at: position)
        print("The array is: \(array)")

        array.insert(element, at: position)
        print("Th array is: \(array)")

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
        }

        print("The cell x array is: \(flags)")

//        var holeFlag: [Int : Bool] = [:]
//
//        for (key, value) in holeFlag {
//            print("The key1 \(key) has value1 \(value)")
//        }

        for i in flags {
            print("The i value is \(i)")
            print("The number of cells is: \(flags.count)")
//            holeFlag[flags.count] = i
        }

//        for (key, value) in holeFlag {
//            print("The key \(key) has value: \(value)")
//        }

//        for i in flags {
//            if i == true {
//                print("Cell \(i.hashValue) is with pressed x button")
//                cell.btnX.isHidden = true
//                cell.pointsTextField.text = "X"
//            }
//        }

//        for i in 0..<flags.count {
//            for j in flags {
//                if j == true {
//                    print("Cell \(i) is with pressed x button")
//                } else {
//                    print("Cell \(i) not pressed x button")
//                }
//            }
//        }

//        for j in flags {
//            if j == true {
//                print("Cell with pressed x button")
//                cell.btnX.isHidden = true
//                cell.pointsTextField.text = "X"
//            } else {
//                print("Cell with not pressed x button")
//            }
//        }
//
//        if (cell.pointsTextField.text == "") {
//            cell.btnX.isHidden = false
//        }

//        for i in flags {
//            if i == true {
//                print("Cell with x button pressed")
//                cell.btnX.isHidden = true
//                cell.pointsTextField.text = "X"
//            } else {
//                print("Cell with x button not pressed")
//            }
//        }

    }
}
