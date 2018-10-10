//
//  NotesManagerDelegate.swift
//  NotesApplicationWithDelegates
//
//  Created by Kalin Karev on 2/20/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

protocol NotesManagerDelegate {
    
    func userDidEnterNote(_ data: String)
    
}
