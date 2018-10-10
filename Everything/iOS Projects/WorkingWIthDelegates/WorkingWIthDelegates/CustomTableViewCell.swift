//
//  CustomTableViewCell.swift
//  WorkingWIthDelegates
//
//  Created by Kalin Karev on 8/2/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        // This line of code is used when the user click a cell in the table view not to be marked in gray
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
