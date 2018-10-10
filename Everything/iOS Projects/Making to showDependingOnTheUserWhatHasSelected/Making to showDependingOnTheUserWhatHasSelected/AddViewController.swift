//
//  AddViewController.swift
//  Making to showDependingOnTheUserWhatHasSelected
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var holesTableView: UITableView!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        holesTableView.register(AddTableViewCell.self, forCellReuseIdentifier: "cellAdd")
        holesTableView.isHidden = true
        
        showActionSheet()
    }
    
    func showTableView() {
        holesTableView.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Send now", style: .default, handler: {
            (action) -> Void in
            print("Send")
            self.number += 1
            self.prepopulateTableView()
        })
        
        let deleteButton = UIAlertAction(title: "Delete now", style: .destructive, handler: {
            (action) -> Void in
            print("Delete")
            self.number += 2
            self.prepopulateTableView()
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel")
            self.number += 3
            self.prepopulateTableView()
        })
        
        alertController.addAction(sendButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func printTheNumber() {
        print("The number value is equal to: \(self.number)")
    }
    
    // MARK: Actions
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
    }
    
    func prepopulateTableView() {
        printTheNumber()
        showTableView()
        self.holesTableView.reloadData()
    }
    
    // return the number of cells each section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAdd", for: indexPath) as! AddTableViewCell
        
        cell.labName.text = "I am label"
        cell.txtPole.text = "I am text field"
        
        return cell
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
