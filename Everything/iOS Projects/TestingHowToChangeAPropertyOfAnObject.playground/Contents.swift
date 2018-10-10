//: Playground - noun: a place where people can play

import UIKit
import os.log

struct Object {
    var id: Int
    var name: String
    // Initializer
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

var objects: [Object] = []
var object1 = Object(id: 0, name: "sleep")
var object2 = Object(id: 1, name: "train")

objects += [object1, object2]
print("The array of objects is: \(objects)")

func editObject(_ objectEdit: Object) {
    if let index = objects.index(where:{$0.id == objectEdit.id}) {
        objects[index].name = "relax"
    }
}

editObject(object2)
print("The array of objects after changes is: \(objects)")
