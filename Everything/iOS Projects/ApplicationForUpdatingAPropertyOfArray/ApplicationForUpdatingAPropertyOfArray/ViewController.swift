//
//  ViewController.swift
//  ApplicationForUpdatingAPropertyOfArray
//
//  Created by Kalin Karev on 8/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    var manageItems = ManageItems()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        manageItems.addItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUpdateScreen" {
            print("You have changed the scene")
            let updateScene = segue.destination as? UpdateViewController

//            guard let updateScene = segue.destination as? UpdateViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
            guard let selectedItemCell = sender as? CustomTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            let selectedItem = manageItems.items[indexPath.row]
            updateScene?.item?.title = selectedItem.title
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageItems.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell

        // Fetch item
//        let item = items[indexPath.row]
        let item = manageItems.items[indexPath.row]

        // Configure cell
        cell.nameLabel.text = item.title

        return cell
    }
}
