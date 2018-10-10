//
//  ViewController.swift
//  ProjectForEdtitingAnArrayObject
//
//  Created by Kalin Karev on 8/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    
    var manageCars = WorkWithCars()
    
    var arrayCars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        manageCars.loadCars()
        manageCars.showArray()
        arrayCars = manageCars.arrCars
        print("The array named arrayCars is: \(arrayCars)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "cellIdentifier" {
            print("You are editing an object")
            
            let navigationController = segue.destination as? UINavigationController
            let secondController = navigationController?.topViewController as? SecondViewController
            
            guard let selectedCarCell = sender as? MainScreenTableViewCell else {
                fatalError("Not known sender: \(String(describing: sender))")
            }
            
            guard let indexPath = userTableView.indexPath(for: selectedCarCell) else {
                fatalError("The cell is not in the table view")
            }

            let selectedCar = manageCars.arrCars[indexPath.row]

            if let viewController = secondController {
                viewController.delegate = self

                viewController.selectedCar = selectedCar
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayCars.count
        return manageCars.arrCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mainScreenCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MainScreenTableViewCell else {
            fatalError("Not correct cell")
        }
        
        let car = manageCars.arrCars[indexPath.row]
//        let car = arrayCars[indexPath.row]
        cell.nameLabel.text = car.title
        
        return cell
    }
}

extension ViewController: SecondViewControllerDelegate {
    func controllerDidEdit(_ controller: SecondViewController, didEdit: Car) {
        manageCars.editCar(selectedCar: didEdit)
        
        userTableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func controllerDidCancel(_ controller: SecondViewController) {
        dismiss(animated: true, completion: nil)
    }
}
