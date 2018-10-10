//
//  AddScreenTableViewCell.swift
//  MakingApplicaionThatToChangeAPropertyOfObject
//
//  Created by Kalin Karev on 8/17/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddScreenTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointTextField: UITextField!
    
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
