//
//  AddNoteViewControllerDelegate.swift
//  NotesApplication
//
//  Created by Kalin Karev on 3/6/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

protocol AddNoteViewControllerDelegate {
    
    func contoller(_ controller: AddNoteViewController, didAddNote: Note)
    
}
