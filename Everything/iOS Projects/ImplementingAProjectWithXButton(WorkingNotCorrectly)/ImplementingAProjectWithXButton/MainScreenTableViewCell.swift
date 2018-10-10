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
}

class MainScreenTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    weak var delegateCell: MainScreenTableViewCellDelegate?

    // MARK: Actions
    @IBAction func xButtonPressed(_ sender: UIButton) {
        print("You have pressed the x button on the cell")
        pointsTextField.text = "X"
        btnX.isHidden = true
        delegateCell?.didTapButton(self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
