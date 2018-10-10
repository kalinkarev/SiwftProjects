//
//  SwiftyTableViewCell.swift
//  TestingTheDelegations
//
//  Created by Kalin Karev on 2/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class SwiftyTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBOutlet weak var trashButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
