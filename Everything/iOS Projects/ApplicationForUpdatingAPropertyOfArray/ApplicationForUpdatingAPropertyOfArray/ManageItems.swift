//
//  ManageItems.swift
//  ApplicationForUpdatingAPropertyOfArray
//
//  Created by Kalin Karev on 8/10/18.
//  Copyright © 2018 Kalin Karev. All rights reserved.
//

import Foundation

struct ManageItems {
    var items: [Items] = []

    mutating func addItems() {
        let item1 = Items(id: 0, title: "item1")
        let item2 = Items(id: 1, title: "item2")

        items += [item1, item2]
    }
    
    mutating func updateProperty(newItem: Items) -> [Items] {
        items = items.map {
            var mutatingItem = $0
            if $0.id == newItem.id {
                mutatingItem.title = newItem.title
            }
            return mutatingItem
        }
        return items
    }
    
}
