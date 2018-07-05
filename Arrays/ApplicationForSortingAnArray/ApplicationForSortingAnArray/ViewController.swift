//
//  ViewController.swift
//  ApplicationForSortingAnArray
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var numberTableView: UITableView!
    
    var array = [10,7,11,4,3,12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private Methods
    func bubbleSort(_ input:[Int]) -> [Int] {
        guard input.count > 1 else {
            return input
        }
        
        var result = input
        let count = result.count
        
        var isSwapped = false
        
        repeat {
            isSwapped = false
            for index in 1..<count {
                if result[index] < result[index - 1] {
                    result.swapAt(index - 1, index)
                    isSwapped = true
                }
            }
        } while isSwapped
        return result
    }
    
    // MARK: Actions
    @IBAction func sortButton(_ sender: UIBarButtonItem) {
        print("You have pressed the sort button")
        array = bubbleSort(array)
        print("The sorted array is: \(array)")
        self.numberTableView.reloadData()
    }
}

// MARK: TableViewDelegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "numberCellIdentifier"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellTableViewCell else {
            fatalError("The dequed isnot an instance of CellTableViewIdentifier")
        }
        
        // Fetch item
        let number = array[indexPath.row]
        
        // Configure cell
        cell.nameLabel.text = String(number)
        
        return cell
    }
}
