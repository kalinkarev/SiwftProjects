//
//  MainScreenTableViewCell.swift
//  RemovingTheWhiteSpacesOnTheScreen
//
//  Created by Kalin Karev on 9/25/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
