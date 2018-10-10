//: Playground - noun: a place where people can play

import UIKit
import Foundation

//enum ColorName: String {
//    case black, silver, gray, white, marron, red, purple, fuchsia, green, lime, yellow, navy, blue, teal, aqua
//}

//let fill = ColorName.grey



//let fill = ColorName.green

enum CSSColor {
    case named(ColorName)
    case rgb(UInt8, UInt8, UInt8)
}

extension CSSColor {
    enum ColorName: String {
        case black, silver, gray, white, marron, red, purple, fuchsia, green, lime, yellow, navy, blue, teal, aqua
    }
}

extension CSSColor: CustomStringConvertible {
    var description: String {
        switch self {
        case .named(let colorName):
            return colorName.rawValue
        case .rgb(let red, let green, let blue):
            return String(format: "#%02X%02X%02X", red, green, blue)
        }
    }
}

let color1 = CSSColor.named(.red)
let color2 = CSSColor.rgb(0xAA, 0xAA, 0xAA)
print("color1 = \(color1), color2 = \(color2)")

extension CSSColor {
    init(gray: UInt8) {
        self = .rgb(gray, gray, gray)
    }
}
let color3 = CSSColor(gray: 0xaa)
print(color3)

enum Math {
    static let phi = 1.6180
}



protocol Drawable {
    func draw(with context: DrawingContext)
}
protocol DrawingContext {
    func draw(_ circle: Circle)
    func rectangle(_ rectengle: Rectangle)
}
struct Circle: Drawable {
    // grouping together stored properties
    var strokeWidth = 5
    var strokeColor = CSSColor.named(.red)
    var fillColor = CSSColor.named(.yellow)
    var center = (x: 80.0, y: 160.0)
    var radius = 60.0
    
    func draw(with context: DrawingContext) {
        context.draw(self)
    }
}
struct Rectangle: Drawable {
    var strokeWidth = 5
    var strokeColor = CSSColor.named(.teal)
    var fillColor = CSSColor.named(.aqua)
    var origin = (x: 110.0, y: 10.0)
    var size = (width: 100.0, height: 130.0)
    func draw(with context: DrawingContext) {
        context.rectangle(self)
    }
}










