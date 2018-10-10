//
//  NoteCellTableViewCell.swift
//  ApplicationForEditingAnObject
//
//  Created by Kalin Karev on 5/16/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class NoteCellTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var titleNote: UILabel!
    
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
