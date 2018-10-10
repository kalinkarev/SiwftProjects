//
//  MainScreenTableViewCell.swift
//  TestingTableViewWithXButton
//
//  Created by Kalin Karev on 10/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func didTapButton(_ cell: MainScreenTableViewCell)
}

class MainScreenTableViewCell: UITableViewCell {

    weak var delegateCell: MainScreenTableViewCellDelegate?

    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var btnX: UIButton!

    // MARK: Actions
    @IBAction func xButtonPressed(_ sender: UIButton) {
        print("You have pressed the X button on the cell")
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
