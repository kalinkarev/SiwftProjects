//
//  MainScreenTableViewCell.swift
//  ImplementingAProjectWithXButton
//
//  Created by Kalin Karev on 9/27/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func didTapButton(_ cell: MainScreenTableViewCell)
    func didEnterTextField(_ cell: MainScreenTableViewCell)
}

class MainScreenTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    weak var delegateCell: MainScreenTableViewCellDelegate?

    // MARK: Actions
    @IBAction func xButtonPressed(_ sender: UIButton) {
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

extension MainScreenTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("You have end editing the textfield cell")
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        delegateCell?.didEnterTextField(self)
    }
}
