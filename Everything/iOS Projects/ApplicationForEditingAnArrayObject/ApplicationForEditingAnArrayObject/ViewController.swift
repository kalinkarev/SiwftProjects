//
//  ViewController.swift
//  ApplicationForEditingAnArrayObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var games:[Game] = []
    
    var secondScreen = AddViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addItem" {
            print("You are adding an item")
            
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self
            }
        }
        
        if segue.identifier == "editItem" {
            print("You are editing an item")
            
            guard let gameDetailViewController = segue.destination as? AddViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedGameCell = sender as? MainScreenTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedGameCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedGame = games[indexPath.row]
            gameDetailViewController.selectedGame = selectedGame
        }
        
    }
}

extension ViewController: AddViewControllerDelegate {
    func controllerDidCancel(_ controller: AddViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func controllerDidSave(_ controller: AddViewController, didSave: [Game]) {
        games = didSave
        userTableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("The dequeued cell is not an instance of MainScreenTableViewCell")
        }
        
        let game = games[indexPath.row]
        cell.nameLabel.text = game.name
        
        return cell
    }
}
