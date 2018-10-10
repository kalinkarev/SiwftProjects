//: Playground - noun: a place where people can play

import UIKit

//protocol classa {
//    var marks: Int { get set } // property variables
//    var result: Bool { get }
//
//    func attendance() -> String
//    func markssecured() -> String
//}
//
//protocol classb: classa {
//    var present: Bool { get set }
//    var subject: String { get set }
//    var stname: String { get set }
//}
//
//class classc: classb {
//    var present: Bool = false
//
//    var subject: String = "Swift 4 Protocols"
//
//    var stname: String = "Protocols"
//
//    var marks: Int = 96
//
//    var result: Bool = true
//
//    func attendance() -> String {
//        return "The \(stname) has secured 99% attendance"
//    }
//
//    func markssecured() -> String {
//        return "\(stname) has scored \(marks)"
//    }
//
//}
//
//let studdet = classc()
//studdet.stname = "Swift 4"
//studdet.marks = 98
//studdet.markssecured()
//
//print(studdet.marks)
//print(studdet.result)
//print(studdet.present)
//print(studdet.subject)
//print(studdet.stname)
//
//
//// Mutating method requirements
//protocol daysOfWeek {
//    mutating func print()
//}
//
//enum days: daysOfWeek {
//    case sun, mon, tue, wed, thurs, fri, sat
//
//    mutating func print() {
//        switch self {
//        case .sun:
//            self = .sun
//            Swift.print("Sunday")
//        case .mon:
//            self = .mon
//            Swift.print("Monday")
//        case .tue:
//            self = .tue
//            Swift.print("Tuesday")
//        case .wed:
//            self = .wed
//            Swift.print("Wednesday")
//        case .thurs:
//            self = .thurs
//            Swift.print("Thursday")
//        case .fri:
//            self = .fri
//            Swift.print("Friday")
//        case .sat:
//            self = .sat
//            Swift.print("Saturday")
//        default:
//            Swift.print("No such day")
//        }
//    }
//}
//
//var res = days.tue
//res.print()
//
//// Designated or convenience initializer allows the user to initialize a protocol to conform its standard by the reserved 'required' keyword.
////class SomeClass: SomeProtocol {
////    required init(someParameter: Int) {
////        // initializer implementation statements
////    }
////}
//
//protocol tcpProtocol {
//    init(no1: Int)
//}
//
//class tcpClass: tcpProtocol {
//    required init(no1 aprot: Int) {
//
//    }
//}
//
//class mainClass {
//    var no1: Int
//    init(no1: Int) {
//        self.no1 = no1
//    }
//}
//
//class subClass: mainClass, tcpProtocol {
//    var no2: Int
//    init(no1: Int, no2: Int) {
//        self.no2 = no2
//        super.init(no1: no1)
//    }
//
//    // Requires only one parameter for convenient method
//    required override convenience init(no1: Int) {
//        self.init(no1: no1, no2: 0)
//    }
//}
//
//let result = mainClass(no1: 20)
//let print = subClass(no1: 30, no2: 50)

//print("result is: \(result.no1)")
//print("result is: \(print.no1)")
//print("result is: \(print.no2)")

//protocol Generator {
//    associatedtype memebers
//    func next() -> memebers?
//}
//
//var items = [10, 20, 30].makeIterator()
//while let x = items.next() {
//    print(x)
//}
//
//for lists in map([1,2,3], {i in i*5}) {
//    print(lists)
//}
//
////for lists in map([1,2,3], {i in i*5}) {
////    print(lists)
////}
//
//print([100, 200, 300])
////print(map([1,2,3], {i in i*10}))

//protocol AgeClasificationProtocol {
//    var age: Int { get }
//    func ageType() -> String
//}
//
//class Person {
//    let firstName: String
//    let lastName: String
//    var age: Int
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.age = 10
//    }
//}
//
//extension Person: AgeClasificationProtocol {
//    func fullName() -> String {
//        var c: String
//        c = firstName + " " + lastName
//        return c
//    }
//
//    func ageType() -> String {
//        switch age {
//        case 0...2:
//            return "Baby"
//        case 2...12:
//            return "Child"
//        case 13...19:
//            return "Teenager"
//        case let x where x > 65:
//            return "Elderly"
//        default:
//            return "Normal"
//        }
//    }
//}
//
//var per = Person(firstName: "Kalin", lastName: "Karev")
//per.age = 20
//print("The person is: \(per.ageType())")

//protocol classA {
//    var no1: Int { get set }
//    func calc(sum: Int)
//}
//
//protocol result {
//    func print(target: classA)
//}
//
//class student2: result {
//    func print(target: classA) {
//        target.calc(sum: 1)
//    }
//}
//
//class classB: result {
//    func print(target: classA) {
//        target.calc(sum: 5)
//    }
//}
//
//class student: classA {
//    var no1: Int = 10
//
//    func calc(sum: Int) {
//        no1 -= sum
//        print("Student attempted \(sum) times to pass")
//
//        if no1 <= 0 {
//            print("Student is absent for exam")
//        }
//    }
//}
//
//class Player {
//    var stmark: result!
//
//    init(stmark: result) {
//        self.stmark = stmark
//    }
//
//    func print(target: classA) {
//        stmark.print(target: target)
//    }
//}
//
//var marks = Player(stmark: student2())
//var marksec = student()
//
//marks.print(target: marksec)
//marks.print(target: marksec)
//marks.print(target: marksec)
//marks.stmark = classB()
//marks.print(target: marksec)
//marks.print(target: marksec)
//marks.print(target: marksec)

//protocol tcpProtocol {
//    init(no1: Int)
//}
//
//class mainClass {
//    var no1: Int // local storage
//    init(no1: Int) {
//        self.no1 = no1 // initialization
//    }
//}
//
//class subClass: mainClass, tcpProtocol {
//    var no2: Int
//    init(no1: Int, no2: Int) {
//        self.no2 = no2
//        super.init(no1: no1)
//    }
//
//    // Requires only one parameter for convenient method
//    required override convenience init(no1: Int) {
//        self.init(no1: no1, no2: 0)
//    }
//}
//
//let res = mainClass(no1: 20)
//let print = subClass(no1: 30, no2: 50)

protocol stname {
    var name: String { get }
}

protocol stage {
    var age: Int { get }
}

struct Person: stname, stage {
    var name: String
    
    var age: Int
}

func print(celebrator: stname & stage) {
    print("\(celebrator.name) is \(celebrator.age) years old.")
}

let studname = Person(name: "Priya", age: 21)
print(studname)

let stud = Person(name: "Reban", age: 29)
print(stud)

let student = Person(name: "roshan", age: 19)
print(student)

@objc protocol rectangle {
    var area: Double { get }
}

class Circle: rectangle {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) {
        self.radius = radius
    }
}

class result: rectangle {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class sides {
    var rectsides: Int
    init(rectsides: Int) {
        self.rectsides = rectsides
    }
}

//let objects: [AnyObject] = [Circle(radius: 2.0), result(area: 198), sides(rectsides: 4)]

let objects: [AnyObject] = [Circle(radius: 2.0), result(area: 198), sides(rectsides: 4)]

for object in objects {
    if let objectWithArea = object as? rectangle {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Rectangle area is not defined")
    }
}

struct Fahrenheit {
    var temperature: Double
    init(temperature: Double) {
        self.temperature = temperature
    }
}

var f = Fahrenheit(temperature: 32.0)
print("The default temperature is \(f.temperature) Farenheit.")

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahenheit: 212.0)
print(boilingPointOfWater)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater)

struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
print(magenta)
let halfGray = Color(white: 0.5)
print(halfGray)

let veryGreen = Color(red: 0.0, green: 1.0, blue: 0.0)

let bodyTemparetute = Celsius(37.0)
print("The body temperatue is: \(bodyTemparetute)")

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    func asnswer() {
        print(response!)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
print("The response is: \(String(describing: cheeseQuestion.response))")

cheeseQuestion.response = "Yes, I do like cheese."
print("The response is: \(String(describing: cheeseQuestion.response))")
cheeseQuestion.asnswer()

let beetQuestion = SurveyQuestion(text: "How about beets?")
beetQuestion.ask()
beetQuestion.response = "I also like beets. (But not with cheese.)"

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() {
        
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

class Animal {
    var name: String?
}

var anim = Animal()

if anim.name != nil {
    print("Yes")
} else {
    print("no")
}

anim.name ?? 

