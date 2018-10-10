//
//  DataSentDelegate.swift
//  TestingTheDelegations
//
//  Created by Kalin Karev on 2/11/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

protocol DataSentDelegate {
    
    func userDidEnterData(data: String)
    
}

// delegate that send text ot any view controller that implement it.
