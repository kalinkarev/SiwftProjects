//
//  ReceivingViewController.swift
//  DelegateTestExample
//
//  Created by Kalin Karev on 2/14/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ReceivingViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var receivingTextField: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingViewController" {
            let sendingViewController: SendingViewController = segue.destination as! SendingViewController
            sendingViewController.delegate = self
        }
    }
    
}


// MARK: Delegate
extension ReceivingViewController: DataSentDelegate {
    func userDidEnterData(data: String) {
        receivingTextField.text = data
        
        list += [data]
        
        print(list)
    }
}


// MARK: TableView
extension ReceivingViewController: UITableViewDataSource, UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ListTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ListTableViewCell else {
            fatalError("The dequeued cell is not an instance of ListTableViewCell")
        }
        
        // Fetches the appropriate note for the data source layout.
        let note = list[indexPath.row]
        
        // Configure the cell...
        
        cell.nameLabel.text = note
        
        return cell
        
    }
}
