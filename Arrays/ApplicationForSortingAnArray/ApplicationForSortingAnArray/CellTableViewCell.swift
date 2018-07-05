//
//  CellTableViewCell.swift
//  ApplicationForSortingAnArray
//
//  Created by Kalin Karev on 7/4/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
