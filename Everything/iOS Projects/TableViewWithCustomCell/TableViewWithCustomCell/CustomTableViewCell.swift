//
//  CustomTableViewCell.swift
//  TableViewWithCustomCell
//
//  Created by Kalin Karev on 8/7/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var labelHoles = UILabel()
    var textFieldPoints = UITextField()
    var buttonEntry = UIButton()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        labelHoles.translatesAutoresizingMaskIntoConstraints = false
        textFieldPoints.translatesAutoresizingMaskIntoConstraints = false
        buttonEntry.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(labelHoles)
        contentView.addSubview(textFieldPoints)
        contentView.addSubview(buttonEntry)

        let viewDict = [
            "holes" : labelHoles,
            "points" : textFieldPoints,
            "button" : buttonEntry
        ] as [String : Any]

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[holes]-[points]-[button]-|", options: [], metrics: nil, views: viewDict))
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
