//
//  ViewController.swift
//  TestingTableViewWithXButton
//
//  Created by Kalin Karev on 10/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flags: [Bool] = Array(repeating: false, count: 5)

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeArraysElement(arr: [Bool], element: Bool, position: Int) -> [Bool] {
        var array = arr
        
        array.remove(at: position)
        array.insert(element, at: position)
        
        return array
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Problems with the cell")
        }
        
        cell.holeLabel.text = "Enter"
        
        return cell
    }
}
