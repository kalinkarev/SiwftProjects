//
//  ViewController.swift
//  TestingGettingDataFromTableView
//
//  Created by Kalin Karev on 8/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var userTableView: UITableView!
    
    let animals: [String] = ["Test1", "Test2", "Test3", "Test4", "Test5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var allCellsText = [String?](repeating: nil, count: 5)

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell
        
        cell.textLab?.delegate = self
        
        cell.textLab?.text = ""
        
        cell.textLab?.placeholder = animals[indexPath.row]
        
        cell.textLab?.autocorrectionType = UITextAutocorrectionType.no
        
        cell.textLab?.autocapitalizationType = UITextAutocapitalizationType.none
        
        cell.textLab?.adjustsFontSizeToFitWidth = true;
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = animals.index(of: textField.placeholder!)
        
        print(indexOf)
        
        if (textField.placeholder! == animals[indexOf!]) {
            if (indexOf! <= (allCellsText.count - 1)) {
                allCellsText.remove(at: indexOf!)
            }
            
            allCellsText.insert(textField.text!, at: indexOf!)
            print(allCellsText)
        }
    }
    
    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
