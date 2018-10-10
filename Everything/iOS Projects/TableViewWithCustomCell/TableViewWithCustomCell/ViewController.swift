//
//  ViewController.swift
//  TableViewWithCustomCell
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var numberOfSections: Int = 5

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "mainCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! CustomTableViewCell

        cell.labelHoles.text = "Hole: \(indexPath.row)"

        cell.textFieldPoints.placeholder = "Enter points for hole: \(indexPath.row)"

        cell.buttonEntry.setTitle("Press", for: .normal)
        cell.buttonEntry.setTitleColor(UIColor.blue, for: .normal)

        cell.buttonEntry.addTarget(self, action: Selector(("buttonClicked")), for: .touchUpInside)
        
//        var textIntextField = cell.textFieldPoints.text
//        print("The text in the textField is: \(textIntextField)")

        return cell
    }

    func buttonClicked(_ sender: AnyObject?) {
        print("The text is: ...")
    }
    
}

