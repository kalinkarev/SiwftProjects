//
//  ViewTableViewCell.swift
//  ToDoApplication
//
//  Created by Kalin Karev on 3/5/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ViewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
