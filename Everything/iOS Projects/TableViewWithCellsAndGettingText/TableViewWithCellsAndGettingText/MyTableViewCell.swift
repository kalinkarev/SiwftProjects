//
//  MyTableViewCell.swift
//  TableViewWithCellsAndGettingText
//
//  Created by Kalin Karev on 8/8/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        nameTextField.text = nil
    }

}
