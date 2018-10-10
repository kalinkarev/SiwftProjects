//
//  ViewControllerTableViewCell.swift
//  ProjectWithXButtonInCell
//
//  Created by Kalin Karev on 10/9/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol ViewControllerTableViewCellDelegate: AnyObject {
    func didTapButton(_ cell: ViewControllerTableViewCell)
    func didEnterTextField(_ cell: ViewControllerTableViewCell)
}

class ViewControllerTableViewCell: UITableViewCell {

    weak var delegateCell: ViewControllerTableViewCellDelegate?

    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    // MARK: Actions
    @IBAction func xButton(_ sender: UIButton) {
        print("You have pressed the X button")
        delegateCell?.didTapButton(self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pointsTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}

extension ViewControllerTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("You have end editing the textfield cell")
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegateCell?.didEnterTextField(self)
    }
}

// Hello,
// Nice to meet you.
// How are you going?
// Do you need some help with the work?
// What is your job in this office?
// I want to make a test drive with the car?
// What is your favorite make of car models?
// New for you
// Free to do what you want!
// Be carefull with the work.
// Have to buy new jacket, my old one has problems with the zip
// I am second year university student in Tehnical University-Sofia
// The practice is the best study, because you see the things in real life as they are.
