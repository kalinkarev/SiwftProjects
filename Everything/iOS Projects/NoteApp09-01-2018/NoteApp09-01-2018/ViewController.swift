//
//  ViewController.swift
//  NoteApp09-01-2018
//
//  Created by Kalin Karev on 1/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

var list = [""]//["breakfast", "lunch", "dinner"]

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableViewNotes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return (cell)
    }
    
    // remove an item by slipping left
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            list.remove(at: indexPath.row)
            tableViewNotes.reloadData()
        }
    }
}
