//
//  ViewController.swift
//  TableViewThatToShowDictionary
//
//  Created by Kalin Karev on 8/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properies
    @IBOutlet weak var numberHolesTableView: UITableView!
    
    var dictHolePoints:[Int : Int] = [
        1 : 10,
        2 : 11,
        3 : 12,
        4 : 13,
        5 : 14,
        6 : 15,
        7 : 16,
        8 : 17,
        9 : 18,
        10 : 19,
        11 : 20,
        12 : 21,
        13 : 22
        ]

    var arrayDictKeys:[Int] = []
    var arrayDictValues:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        arrayDictKeys = Array(dictHolePoints.keys.sorted())
        print("The array of keys is: \(arrayDictKeys)")
        arrayDictValues = Array(dictHolePoints.values.sorted())
        print("The array of values is: \(arrayDictValues)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictHolePoints.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainCellIdentifier"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PrototypeTableViewCell else {
            fatalError("The dequed is not an instance of PrototypeTableViewCell identifier")
        }

        // Fetch item
        let hole = arrayDictKeys[indexPath.row]
        let points = arrayDictValues[indexPath.row]
        // Configure cell
        cell.holeLabel.text = String(hole)
        cell.pointsTextField.text = String(points)

        return cell
    }
}
