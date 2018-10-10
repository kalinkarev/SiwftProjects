//
//  ViewController.swift
//  ImplementingMyOwnTableViewWithElements
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var nameTableView: UITableView!

    var numberOfSections: Int = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfSections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        var counter: Int = 0
        switch indexPath.row {
        case 0:
            counter = 1
        case 1:
            counter = 2
        case 2:
            counter = 3
        case 3:
            counter = 4
        case 4:
            counter = 5
        case 5:
            counter = 6
        case 6:
            counter = 7
        default:
            counter = 0
        }
        
        cell.labHoles.text = "I am label \(counter)"
        cell.txtPoint.text = "I am text field \(counter)"
        
        return cell
    }

}
