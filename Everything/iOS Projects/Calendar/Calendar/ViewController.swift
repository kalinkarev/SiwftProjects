//
//  ViewController.swift
//  Calendar
//
//  Created by Kalin Karev on 1/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

//var event = [String()]

var event = ["work", "sleep", "go outside"]

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableCalendar: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return event.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel?.text = event[indexPath.row]
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

