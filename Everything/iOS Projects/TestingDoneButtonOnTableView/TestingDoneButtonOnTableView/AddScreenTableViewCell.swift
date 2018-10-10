//
//  AddScreenTableViewCell.swift
//  TestingDoneButtonOnTableView
//
//  Created by Kalin Karev on 9/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddScreenTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
