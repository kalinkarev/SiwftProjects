//
//  AddGolfTableViewCell.swift
//  Golf
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol AddGolfTableViewCellDelegate: AnyObject {
    func didTapButton(_ cell: AddGolfTableViewCell)
//    func didEnterTextField(_ cell: AddGolfTableViewCell)
}

class AddGolfTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var nameLabelAddScreen: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    weak var delegateCell: AddGolfTableViewCellDelegate?
    
    // MARK: Actions
    @IBAction func xButton(_ sender: UIButton) {
//        print("You have pressed the X Button")
        delegateCell?.didTapButton(self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        pointsTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}

//extension AddGolfTableViewCell: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("You have end editing the textfield")
//        textField.resignFirstResponder()
//        return true
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        delegateCell?.didEnterTextField(self)
//    }
//}

