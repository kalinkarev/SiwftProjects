//
//  MyOwnTableViewCell.swift
//  TestingButtonPressProgrammly
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MyOwnTableViewCell: UITableViewCell {

    var myTxtField = UITextField()
    var myButton = UIButton()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myTxtField.translatesAutoresizingMaskIntoConstraints = false
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(myTxtField)
        contentView.addSubview(myButton)
        
        let viewDictionary = [
            "textField": myTxtField,
            "Mbutton": myButton
        ] as [String: Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[textField]-[Mbutton]-|", options: [], metrics: nil, views: viewDictionary))
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
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
