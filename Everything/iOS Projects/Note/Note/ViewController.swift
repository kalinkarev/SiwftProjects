//
//  ViewController.swift
//  Note
//
//  Created by Kalin Karev on 12/28/17.
//  Copyright © 2017 Kalin Karev. All rights reserved.
//

import UIKit

// variable for the note
//var note = [String()]

var note = ["hello", "there", "how", "are", "you"]

class ViewController: UIViewController{ //, UITableViewDelegate {

    @IBOutlet weak var tableViewNotes: UITableView!
    
    // define how many rows do we need in our tableview
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return note.count
//    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
//        
//        cell.textLabel?.text = note[indexPath.row]
//        return cell
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

