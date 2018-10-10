//
//  NotesManager.swift
//  NotesOriginal
//
//  Created by Kalin Karev on 2/12/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

protocol NotesManager {
    
    func addItem(_ controller: NoteViewController, didAddNote: Note)
    
}
