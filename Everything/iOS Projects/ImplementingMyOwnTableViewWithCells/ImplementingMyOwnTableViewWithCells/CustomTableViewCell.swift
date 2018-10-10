//
//  CustomTableViewCell.swift
//  ImplementingMyOwnTableViewWithCells
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var labUserName = UILabel()
    var labMessage = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labUserName.translatesAutoresizingMaskIntoConstraints = false
        labMessage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labUserName)
        contentView.addSubview(labMessage)
        
        let viewDict = [
            "username" : labUserName,
            "message" : labMessage
            ] as [String : Any]

//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(10)]", options: [], metrics: nil, views: viewDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[labTime]-|", options: [], metrics: nil, views: viewDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[username]-[message]-|", options: [], metrics: nil, views: viewDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[username]-[image(10)]-|", options: [], metrics: nil, views: viewDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[message]-[labTime]-|", options: [], metrics: nil, views: viewDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
