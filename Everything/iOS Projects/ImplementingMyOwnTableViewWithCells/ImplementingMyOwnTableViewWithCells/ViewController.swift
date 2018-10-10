//
//  ViewController.swift
//  ImplementingMyOwnTableViewWithCells
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    
    private let sections: NSArray = ["fruit", "vegitable"]
    private let fruit: NSArray = ["apple", "orange", "banana", "strawberry", "lemon"]
    private let vegitable: NSArray = ["carrots", "avocado", "potato", "onion"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // get width and height of View
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.size.height
//        let navigationBarHeight: CGFloat = (self.navigationController?.navigationBar.frame.size.height)!
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - (barHeight)))
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        // Auto-set the UITableViewCells height
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.estimatedRowHeight = 44
        
        self.view.addSubview(myTableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // return the number of sections
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
        } else if indexPath.section == 1 {
            print("Value: \(vegitable[indexPath.row])")
        }
    }
    
    // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return fruit.count
        } else if section == 1 {
            return vegitable.count
        } else {
            return 0
        }
    }
    
    // return cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        if indexPath.section == 0 {
            cell.labUserName.text = "\(fruit[indexPath.row])"
            cell.labMessage.text = "Message \(indexPath.row)"
        } else if indexPath.section == 1 {
            cell.labUserName.text = "\(vegitable[indexPath.row])"
            cell.labMessage.text = "Message \(indexPath.row)"
        }
        
        return cell
    }

}

