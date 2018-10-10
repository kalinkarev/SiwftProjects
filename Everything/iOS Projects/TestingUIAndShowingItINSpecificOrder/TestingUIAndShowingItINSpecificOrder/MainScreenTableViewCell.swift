//
//  MainScreenTableViewCell.swift
//  TestingUIAndShowingItINSpecificOrder
//
//  Created by Kalin Karev on 9/18/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

protocol MainScreenTableViewCellDelegate: AnyObject {
    func getCell(_ cell: MainScreenTableViewCell)
}

class MainScreenTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var holeTextField: UITextField!

    weak var delegate: MainScreenTableViewCellDelegate?

    // MARK: Actions
    @IBAction func xButton(_ sender: UIButton) {
        print("You have pressed the X button")
        delegate?.getCell(self)
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
