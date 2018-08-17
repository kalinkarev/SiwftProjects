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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func goToNextScreen(segue: UIStoryboardSegue, passNumber: Int) {
//        let navVC = segue.destination as! UINavigationController
//        let addVC = navVC.viewControllers.first as! AddGolfViewController
//
//        addVC.numberHoles = numberOfHoles
//        self.present(navVC, animated: true, completion: nil)
//    }
    
//    func showActionSheet(segue: UIStoryboardSegue) {
//        let alertController = UIAlertController(title: "Choose how many holes do you want the game to have", message: nil, preferredStyle: .actionSheet)
//
//        let nineButton = UIAlertAction(title: "Nine holes", style: .default, handler: {
//            (action) -> Void in
//            print("Nine holes")
//
//            self.numberOfHoles = 9
//            self.goToNextScreen(segue: segue, passNumber: self.numberOfHoles)
//        })
//        let eighteenButton = UIAlertAction(title: "Eighteen holes", style: .default, handler: {
//            (action) -> Void in
//            print("Eighteen holes")
//
//            self.numberOfHoles = 18
//            self.goToNextScreen(segue: segue, passNumber: self.numberOfHoles)
//        })
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {
//            (action) -> Void in
//            print("Cancel button tapped")
//        })
//
//        alertController.addAction(nineButton)
//        alertController.addAction(eighteenButton)
//        alertController.addAction(cancelButton)
//
//        self.present(alertController, animated: true, completion: nil)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem" {
            let navigationController = segue.destination as? UINavigationController
            let addItemViewController = navigationController?.topViewController as? AddGolfViewController
            
            if let viewController = addItemViewController {
                viewController.delegate = self

                viewController.numberHoles = numberOfHoles
            }
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
}
