//
//  ProgramllyTableViewCell.swift
//  MakingTheOrder
//
//  Created by Kalin Karev on 8/1/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class ProgramllyTableViewCell: UITableViewCell {

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

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[message]-|", options: [], metrics: nil, views: viewDict))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        labName.translatesAutoresizingMaskIntoConstraints = false
//        txtPole.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(labName)
//        contentView.addSubview(txtPole)
//
//        let viewDict = [
//            "name": ""
//        ]
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createLabel() {
        let myLabel = UILabel()
        myLabel.textAlignment = NSTextAlignment.center
        myLabel.font = myLabel.font.withSize(15)
        myLabel.text = "I am a test label"
    }
    
}
