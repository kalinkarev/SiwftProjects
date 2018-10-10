//
//  LabelTableViewCell.swift
//  FormattingCustomLabels
//
//  Created by Kalin Karev on 7/31/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    
    let labUserName = UILabel()
    let labMessage = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        labUserName.translatesAutoresizingMaskIntoConstraints = false
        labMessage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labUserName)
        contentView.addSubview(labMessage)
        
        let viewsDict = [
            "username":labUserName,
            "message": labMessage
        ]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func createLabel() {
//        let m: Int = 10
//        var n: Int = 100
//        var i: Int = 0
//
//        let myLabel = UILabel(frame: CGRect(x: m, y: n, width: 150, height: 35))
//        myLabel.textAlignment = NSTextAlignment.center
//        myLabel.font = myLabel.font.withSize(15)
//        myLabel.text = "I am test label"
//
//    }

}
