//
//  ViewController.swift
//  MakingTheOrder
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var nameTableView: UITableView!
    
    private let sections: NSArray = ["fruit", "vagitables"]
    private let fruit: NSArray = ["apple", "orange", "banana", "strawberry", "lemon"]
    private let vegetable: NSArray = ["carrots", "avocado", "potato", "onion"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTableView.register(ProgramllyTableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // return the number of secions
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    // return the title of sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section] as? String
    }
    
    // called when the cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        if indexPath.section == 0 {
            print("Value: \(fruit[indexPath.row])")
        } else if indexPath.row == 1 {
            print("Value: \(vegetable[indexPath.row])")
        }
    }
    
    // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruit.count
        } else if section == 1 {
            return vegetable.count
        } else {
            return 0
        }
    }
    
    // return cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProgramllyTableViewCell
        
        if indexPath.section == 0 {
            cell.labName.text = "\(fruit[indexPath.row])"
            cell.txtPole.text = "Message \(indexPath.row)"
        } else if indexPath.section == 1 {
            cell.labName.text = "\(vegetable[indexPath.row])"
            cell.txtPole.text = "Message \(indexPath.row)"
        }
        
        return cell
    }
}
