//
//  TableViewController.swift
//  GettingInputForEachCell
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ArrayOfCell:[TableViewCell] = []
    var TextFiled1Array:[String] = []
    var TextFiled2Array:[String] = []
    var TextFiled3Array:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        ArrayOfCell.append(cell)
        return cell
    }
    
    // MARK: Actions
    @IBAction func submit(_ sender: UIButton) {
        ArrayOfCell.forEach { cell in
            TextFiled1Array.append(cell.TextFiled1.text!)
            TextFiled2Array.append(cell.TextFiled2.text!)
            TextFiled3Array.append(cell.TextFiled3.text!)
        }
        print(TextFiled1Array)
        print(TextFiled2Array)
        print(TextFiled3Array)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
