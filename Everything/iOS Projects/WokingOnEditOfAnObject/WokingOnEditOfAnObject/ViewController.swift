//
//  ViewController.swift
//  WokingOnEditOfAnObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTableView: UITableView!

    var games: [Game] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let game1 = Game(id: 0, name: "game1")
        let game2 = Game(id: 1, name: "game2")
        
        games += [game1, game2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch segue.identifier {
        case "addItem"?:
            print("You are adding a game")
            
//            let navigationController = segue.description as? UINavigationController
//            let addItemViewController = navigationController?.topViewController as? SecondViewController
//            
//            if let viewController = addItemViewController {
//            }
        case "editItem"?:
            print("You are editing a game")
            
            guard let gameDetailViewController = segue.destination as? SecondViewController else {
                fatalError("Unexpected destintion: \(segue.destination)")
            }
            guard let selectedGameCell = sender as? MainScreenTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = userTableView.indexPath(for: selectedGameCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedGame = games[indexPath.row]
            gameDetailViewController.selectedGame = selectedGame
            gameDetailViewController.arrayOfGames = games
            
        default:
            print("There is no such operation that you can do with the game")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Unable to instantiate the cell")
        }
        
        let game = games[indexPath.row]
        cell.nameLabel.text = game.name
        
        return cell
    }
}
