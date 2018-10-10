//
//  TableViewCell.swift
//  GettingInputForEachCell
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var TextFiled1: UITextField!
    @IBOutlet weak var TextFiled2: UITextField!
    @IBOutlet weak var TextFiled3: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
