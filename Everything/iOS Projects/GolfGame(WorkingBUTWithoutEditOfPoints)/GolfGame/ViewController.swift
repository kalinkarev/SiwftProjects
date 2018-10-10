//
//  ViewController.swift
//  GolfGame
//
//  Created by Kalin Karev on 8/22/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var games = [Game]()
    
    var numberOfHoles: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        loadSampleGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "addItem" {
            print("You are adding game")
            
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddItemViewController
            
            if let viewController = addItemViewController {
                viewController.numberHoles = numberOfHoles
            }
        }
        
        if segue.identifier == "showDetail" {
            guard let gameDetailViewController = segue.destination as? AddItemViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedGameCell = sender as? MainScreenTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedGameCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedGame = games[indexPath.row]
            gameDetailViewController.game = selectedGame
        }
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)
        
        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("You have selected to play game with nine holes")
            
            self.numberOfHoles = 9
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("You have selected to play game with eighteen holes")
            
            self.numberOfHoles = 18
            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (action) -> Void in
            print("You have pressed the cancel button")
        })

        alertController.addAction(nineButton)
        alertController.addAction(eighteenButton)
        alertController.addAction(cancelButton)

        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        showActionSheet()
    }
    
    @IBAction func unwindToGameList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddItemViewController, let game = sourceViewController.game {
            if let selectedIndexPath = userTableView.indexPathForSelectedRow {
                // Update an existing game.
                games[selectedIndexPath.row] = game
                userTableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new game.
                let newIndexPath = IndexPath(row: games.count, section: 0)
                
                games.append(game)
                
                userTableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    
    // MARK: Private Methods
    private func loadSampleGames() {
        guard let game1 = Game(name: "First", pointsScored: 20, dictHolePoints: [1 : 10, 2 : 10]) else {
            fatalError("Unable to instantiate game1")
        }
        guard let game2 = Game(name: "Second", pointsScored: 45, dictHolePoints: [1 : 1, 2 : 2, 3 : 3, 4 : 4, 5 : 5, 6 : 6, 7 : 7, 8 : 8, 9 : 9]) else {
            fatalError("Unable to instantiate game2")
        }
        guard let game3 = Game(name: "Third", pointsScored: 66, dictHolePoints: [1 : 1, 2 : 2, 3 : 3, 4 : 4, 5 : 5, 6 : 6, 7 : 7, 8 : 8, 9 : 9, 10 : 10, 11 : 11]) else {
            fatalError("Unable to instantiate game3")
        }
        
        games += [game1, game2, game3]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
