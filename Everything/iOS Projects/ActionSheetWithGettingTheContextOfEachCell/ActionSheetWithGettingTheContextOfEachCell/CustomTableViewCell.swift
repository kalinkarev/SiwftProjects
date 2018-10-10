//
//  CustomTableViewCell.swift
//  ActionSheetWithGettingTheContextOfEachCell
//
//  Created by Kalin Karev on 8/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UITextFieldDelegate {

    var mainScreen = ViewController()
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Reset the cell for new row`s data
//        self.inputTextField.isHidden = false
//        self.inputTextField.placeholder = "Enter points"
//        self.inputTextField.text = nil
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        mainScreen.arrayInput.append(inputTextField.text!)
    }
    
}
