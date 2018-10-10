//
//  MainScreenTableViewCell.swift
//  FixingTheSizeOfElementsInTableView
//
//  Created by Kalin Karev on 9/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var holeLabel: UILabel!
    @IBOutlet weak var pointsTextField: UITextField!
    // MARK: Actions
    @IBAction func xButton(_ sender: UIButton) {
        print("You have pressed the X button")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = UITableViewCellSelectionStyle.none
    }
}
