//
//  ViewController.swift
//  AppWithActionSheetAndGettingTheContextOfCell
//
//  Created by Kalin Karev on 8/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    var numberOfHoles: Int = 0

    var animals = [String]()

    var dictionaryHolePoints: [Int:Int] = [:]

    var arrayWithPoints = [Int]()

    var sumPoints: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var allCellsText = [String?]()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        showActionSheet()

        userTableView.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showActionSheet() {
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .actionSheet)

        let oneHole = UIAlertAction(title: "One hole", style: .default, handler: {
            (action) -> Void in
            print("One hole")
            self.numberOfHoles = 1
            self.prepopulateTableView()
        })

        let twoHole = UIAlertAction(title: "Two holes", style: .default, handler: {
            (action) -> Void in
            print("Two holes")
            self.numberOfHoles = 2
            self.prepopulateTableView()
        })

        let threeHole = UIAlertAction(title: "Three holes", style: .default, handler: {
            (action) -> Void in
            print("Three holes")
            self.numberOfHoles = 3
            self.prepopulateTableView()
        })

        let fourHole = UIAlertAction(title: "Four holes", style: .default, handler: {
            (action) -> Void in
            print("Four holes")
            self.numberOfHoles = 4
            self.prepopulateTableView()
        })

        let fiveHole = UIAlertAction(title: "Five holes", style: .default, handler: {
            (action) -> Void in
            print("Five holes")
            self.numberOfHoles = 5
            self.prepopulateTableView()
        })

        let sixHole = UIAlertAction(title: "Six holes", style: .default, handler : {
            (action) -> Void in
            print("Six holes")
            self.numberOfHoles = 6
            self.prepopulateTableView()
        })

        let sevenHole = UIAlertAction(title: "Seven holes", style: .default, handler: {
            (action) -> Void in
            print("Seven holes")
            self.numberOfHoles = 7
            self.prepopulateTableView()
        })

        let eightHole = UIAlertAction(title: "Eight holes", style: .default, handler: {
            (action) -> Void in
            print("Eight holes")
            self.numberOfHoles = 8
            self.prepopulateTableView()
        })

        let nineHole = UIAlertAction(title: "Nine holes", style: .default, handler: {
            (action) -> Void in
            print("Nine holes")
            self.numberOfHoles = 9
            self.prepopulateTableView()
        })

        let tenHole = UIAlertAction(title: "Ten holes", style: .default, handler: {
            (action) -> Void in
            print("Ten holes")
            self.numberOfHoles = 10
            self.prepopulateTableView()
        })

        let elevenHole = UIAlertAction(title: "Eleven holes", style: .default, handler: {
            (action) -> Void in
            self.numberOfHoles = 11
            self.prepopulateTableView()
        })

        let twelveHole = UIAlertAction(title: "Twelve holes", style: .default, handler: {
            (action) -> Void in
            self.numberOfHoles = 12
            self.prepopulateTableView()
        })

        let thirteenHole = UIAlertAction(title: "Thirteen holes", style: .default, handler: {
            (action) -> Void in
            self.numberOfHoles = 13
            self.prepopulateTableView()
        })

        let fourteenHole = UIAlertAction(title: "Fourteen holes", style: .default, handler: {
            (action) -> Void in
            self.numberOfHoles = 14
            self.prepopulateTableView()
        })

        let fifteenHole = UIAlertAction(title: "Fifteen holes", style: .default, handler: {
            (action) -> Void in
            self.numberOfHoles = 15
            self.prepopulateTableView()
        })

        let cancelButton = UIAlertAction(title: "Cancel action", style: .cancel, handler: {
            (action) -> Void in
            print("Cancel button tapped")
        })

        alertController.addAction(oneHole)
        alertController.addAction(twoHole)
        alertController.addAction(threeHole)
        alertController.addAction(fourHole)
        alertController.addAction(fiveHole)
        alertController.addAction(sixHole)
        alertController.addAction(sevenHole)
        alertController.addAction(eightHole)
        alertController.addAction(nineHole)
        alertController.addAction(tenHole)
        alertController.addAction(elevenHole)
        alertController.addAction(twelveHole)
        alertController.addAction(thirteenHole)
        alertController.addAction(fourteenHole)
        alertController.addAction(fifteenHole)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }

    func prepopulateTableView() {
        userTableView.isHidden = false
        self.userTableView.reloadData()

        initializeArrays()
    }

    func initializeArrays() {
        animals = [String](repeating: "hello", count: numberOfHoles)
        print("The animal array is: \(animals)")
        allCellsText = [String?](repeating: nil, count: numberOfHoles)
        print("The allCellsText array is: \(allCellsText)")
    }

    // MARK: Actions
    @IBAction func showButton(_ sender: UIButton) {
        print("The number of holes is: \(numberOfHoles)")
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfHoles
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as! CustomTableViewCell

        cell.nameLabel.text = "Hole \(indexPath.row)"

        cell.pointsTextField?.delegate = self

        cell.pointsTextField?.text = ""

        cell.pointsTextField?.placeholder = "Enter for hole: \(indexPath.row)"

        animals[indexPath.row] = (cell.pointsTextField?.placeholder)!

        cell.pointsTextField?.autocorrectionType = UITextAutocorrectionType.no

        cell.pointsTextField?.autocapitalizationType = UITextAutocapitalizationType.none

        cell.pointsTextField?.adjustsFontSizeToFitWidth = true;

        return cell
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        let indexOf = animals.index(of: textField.placeholder!)
        print("Teh index of the entered text field is: \(String(describing: indexOf))")

        if (textField.placeholder! == animals[indexOf!]) {
            if (indexOf! <= (allCellsText.count - 1)) {
                allCellsText.remove(at: indexOf!)
            }

            allCellsText.insert(textField.text!, at: indexOf!)
            print("The array with points is: \(allCellsText)")
        }

        let arrayWithoutOptionals: [String] = allCellsText.map { $0 ?? "" }

        arrayWithPoints = arrayWithoutOptionals.map { Int($0) ?? 0 }
        print("The points are: \(arrayWithPoints)")

        for i in 0..<arrayWithPoints.count {
            dictionaryHolePoints[i] = arrayWithPoints[i]
        }

        var sum: Int = 0
        for j in 0..<arrayWithPoints.count {
            sum += arrayWithPoints[j]
        }

        print("The sum is: \(sum)")

        sumPoints = sum

        print("The sum of the points that the user has scored is: \(sumPoints)")

        for (key, value) in dictionaryHolePoints.sorted(by: <) {
            print("The key: \(key) has value: \(value)")
        }
    }

    // delegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
