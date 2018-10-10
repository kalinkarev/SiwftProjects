//
//  MainScreenTableViewCell.swift
//  ApplicationForEditingAnArrayObject
//
//  Created by Kalin Karev on 8/24/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
