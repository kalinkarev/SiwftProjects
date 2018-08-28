//
//  ViewController.swift
//  Golf
//
//  Created by Kalin Karev on 7/30/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var nameTableView: UITableView!

    var manageGame = ManageGolfGame()

    var numberOfHoles: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        manageGame.loadGames()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch segue.identifier {
        case "addItem"?:
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddGolfViewController

            if let viewController = addItemViewController {
                viewController.delegate = self
                viewController.numberHoles = numberOfHoles
            }
        case "editItem"?:
            guard let gameDetailViewController = segue.destination as? AddGolfViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedGameCell = sender as? GolfTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = nameTableView.indexPath(for: selectedGameCell) else {
                fatalError("The selected call is not being displayed bythe table")
            }

            let selectedGame = manageGame.games[indexPath.row]
            gameDetailViewController.selectedGame = selectedGame
            gameDetailViewController.delegate = self
        default:
            print("There is not such operation, that you can do?")
        }
    }

    // MARK: Actions
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        showActionSheet()
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose how many holes do you want the game to have", message: nil, preferredStyle: .actionSheet)

        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the nine button")

            self.numberOfHoles = 9

            self.performSegue(withIdentifier: "addItem", sender: self)
        })
        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
            (action) -> Void in
            print("You have pressed the eighteen button")

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
}

// MARK: TableView Delegates
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manageGame.countGames()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GolfTableViewCell else {
            fatalError("The dequed is not an instance of GolfTableViewCell identifier")
        }

        // Fetch item
        let game = manageGame.games[indexPath.row]
        // Configure cell
        cell.nameLabel.text = game.name

        return cell
    }

    // Delete game
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let game = GolfGame(id: indexPath.row, name: indexPath.description, pointsScored: indexPath.row, dictHolePoints: [indexPath.row : indexPath.row])

            manageGame.deleteGame(game!)

            nameTableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}

// MARK: Delegates (Implemented)
extension ViewController: AddGolfViewControllerDelegate {
    func controllerDidCancel(_ controller: AddGolfViewController) {
        dismiss(animated: true, completion: nil)
    }

    func controllerDidSave(_ controller: AddGolfViewController, didSave: GolfGame) {
        manageGame.addGame(didSave)

        nameTableView.reloadData()

        dismiss(animated: true, completion: nil)
    }

    func controllerDidEdit(_ controller: AddGolfViewController, didEdit: GolfGame) {
        manageGame.editGame(didEdit)

        nameTableView.reloadData()
    }
}
