//
//  CustomTableViewCell.swift
//  CreatingCustomTableViewWithCell
//
//  Created by Kalin Karev on 7/31/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let labUserName = UILabel()
    let labMessage = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        labUserName.translatesAutoresizingMaskIntoConstraints = false
        labMessage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labUserName)
        contentView.addSubview(labMessage)
        
//        let viewDict = [
//            "username" : labUserName,
//            "message" : labMessage
//        ]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
