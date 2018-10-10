//
//  AddTableViewCell.swift
//  Making to showDependingOnTheUserWhatHasSelected
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    var labName = UILabel()
    var txtPole = UITextField()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labName.translatesAutoresizingMaskIntoConstraints = false
        txtPole.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labName)
        contentView.addSubview(txtPole)
        
        let viewDict = [
            "name" : labName,
            "message" : txtPole
        ] as [String : Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[name]-[message]-|", options: [], metrics: nil, views: viewDict))
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
