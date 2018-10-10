//
//  ViewController.swift
//  FormattingCustomLabels
//
//  Created by Kalin Karev on 7/31/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    @IBOutlet weak var labelsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        labelsTableView.rowHeight = UITableViewAutomaticDimension
        labelsTableView.estimatedRowHeight = 44
        
//        createLabel(number: 5)
//        createTextField(number: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = labelsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LabelTableViewCell
        
        cell.labUserName.text = "Name"
        cell.labMessage.text = "Message \(indexPath.row)"
        
        return cell
    }
    
    func createLabel( number: Int) {
        let m: Int = 10
        var n: Int = 100
        var i: Int = 0
        
        while i < number {
            let myLabel = UILabel(frame:CGRect(x: m, y: n, width: 150, height: 35))
            myLabel.textAlignment = NSTextAlignment.center
            myLabel.font = myLabel.font.withSize(15)
            myLabel.text = "I am test label \(i + 1)"
            self.view.addSubview(myLabel)
            
            i += 1
            n += 20
        }
    }
    
    func createTextField( number: Int) {
        let m: Int = 150
        var n: Int = 100
        var j: Int = 0
        
        while j < number {
            let myTextField = UITextField(frame: CGRect(x: m, y: n, width: 150, height: 35))
            myTextField.textAlignment = NSTextAlignment.center
            myTextField.text = "The points are: \(j + 1)"
            self.view.addSubview(myTextField)
            
            j += 1
            n += 20
        }
    }
}

