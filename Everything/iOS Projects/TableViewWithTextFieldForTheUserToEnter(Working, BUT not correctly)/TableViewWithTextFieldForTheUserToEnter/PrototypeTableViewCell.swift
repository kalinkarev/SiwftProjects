//
//  PrototypeTableViewCell.swift
//  TableViewWithTextFieldForTheUserToEnter
//
//  Created by Kalin Karev on 8/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class PrototypeTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
