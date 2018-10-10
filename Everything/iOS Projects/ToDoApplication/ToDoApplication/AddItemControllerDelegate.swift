//
//  AddItemControllerDelegate.swift
//  ToDoApplication
//
//  Created by Kalin Karev on 3/5/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemControllerDelegate {
    func controller(_ controller: AddItemViewController, didAddItem: String)
}
