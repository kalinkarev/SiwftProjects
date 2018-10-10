//: Playground - noun: a place where people can play

import UIKit

struct Images {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

var arrayImages = [Images]()
arrayImages.append(Images(id: 0, name: "image1"))
arrayImages.append(Images(id: 1, name: "image2"))

arrayImages.forEach { image in
    print(image.name)
}
print("")
var changeName: String = "img"
arrayImages = arrayImages.map {
    var mutableImage = $0
    if $0.id == 0 {
        mutableImage.name = changeName
    }
    return mutableImage
}

arrayImages.forEach { image in
    print(image.name)
}

struct Book {
    let id: Int
    var title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

var arrayBook = [Book]()
arrayBook.append(Book(id: 0, title: "book1"))
arrayBook.append(Book(id: 1, title: "book2"))

arrayBook.forEach { book in
    print(book.title)
}

print("")

arrayBook = arrayBook.map {
    var mutableBook = $0
    if $0.id == 1 {
        mutableBook.title = "modified"
    }
    return mutableBook
}

arrayBook.forEach { book in
    print(book.title)
}


//protocol classa {
//    var marks: Int { get set }
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
//    var present: Bool
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
//}
//
//let studdet = classc.self
//studdet.stname = "Swift 4"
//studdet.marks = 98
//studdet.markssecured()
//
//print(studdet.marks)
//print(studdet.result)
//print(studdet.present)
//print(studdet.subject)
//print(studdet.stname)

protocol daysOfWeek {
    mutating func print()
}

enum days: daysOfWeek {
    case sun, mon, tue, wed, thurs, fri, sat
    
    mutating func print() {
        switch self {
        case .sun:
            self = .sun
            Swift.print("Sunday")
        case .mon:
            self = .mon
            Swift.print("Monday")
        case .tue:
            self = .tue
            Swift.print("Tuesday")
        case .wed:
            self = .wed
            Swift.print("Wednesday")
        case .thurs:
            self = .thurs
            Swift.print("Thursday")
        case .fri:
            self = .fri
            Swift.print("Friday")
        case .sat:
            self = .sat
            Swift.print("Suaturday")
        default:
            Swift.print("No Such Day in the week")
        }
    }
}

var res = days.thurs
res.print()


protocol tcpprotocol {
    init(aprot: Int)
}

class tcpClass: tcpprotocol {
    required init(aprot: Int) {
        
    }
}

protocol tcpProtocol {
    init(no1: Int)
}

class mainClass {
    var no1: Int
    init(no1: Int) {
        self.no1 = no1
    }
}

class subClass: mainClass, tcpProtocol {
    var no2: Int
    init(no1: Int, no2: Int) {
        self.no2 = no2
        super.init(no1: no1)
    }
    // Requires only one parameter for convenientmethod
    required override convenience init(no1: Int) {
        self.init(no1: no1, no2: 0)
    }
}

let result = mainClass(no1: 20)
let newPrint = subClass(no1: 30, no2: 50)

print("result is: \(result.no1)")
print("result is: \(newPrint.no1)")
print("result is: \(newPrint.no2)")


protocol Generator {
    associatedtype members
    func next() -> members?
}

var items = [10,20,30].makeIterator()
while let x = items.next() {
    print(x)
}

//for lists in map([1,2,3], {i in i*5}) {
//    print(lists)
//}
//
//print([100,200,300])
//print(map([1,2,3], {i in i*10}))


protocol AgeClasificationProtocol {
    var age: Int { get }
    func agetype() -> String
}

class Person {
    let firstName: String
    let lastName: String
    var age: Int
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = 10
    }
}

extension Person: AgeClasificationProtocol {
    func fullName() -> String {
        var c: String
        c = firstName + " " + lastName
        return c
    }

    func agetype() -> String {
        switch age {
        case 0...2:
            return "Baby"
        case 2...12:
            return "Child"
        case 13...19:
            return "Teenager"
        case let x where x > 65:
            return "Elderly"
        default:
            return "Normal"
        }
    }
}


protocol classA {
    var no1: Int { get set }
    func calc(sum: Int)
}

protocol Result {
    func print(target: classA)
}

class student2: Result {
    func print(target: classA) {
        target.calc(sum: 1)
    }
}

class classB: Result {
    func print(target: classA) {
        target.calc(sum: 5)
    }
}

class Student: classA {
    var no1: Int = 10
    
    func calc(sum: Int) {
        no1 -= sum
        print("Student attempted \(sum) times to pass")
        
        if no1 <= 0 {
            print("Student is absent for exam")
        }
    }
}

class Player {
    var stmark: Result!
    
    init(stmark: Result) {
        self.stmark = stmark
    }
    func print(target: classA) {
        stmark.print(target: target)
    }
}

var marks = Player(stmark: student2())
var marksec = Student()

marks.print(target: marksec)
marks.print(target: marksec)
marks.print(target: marksec)
marks.stmark = classB()
marks.print(target: marksec)
marks.print(target: marksec)
marks.print(target: marksec)


protocol stname {
    var name: String { get }
}
protocol stage {
    var age: Int { get }
}
struct Women: stname, stage {
    var name: String
    var age: Int
}
func print(celebrator: stname & stage) {
    print("\(celebrator.name) is \(celebrator.age) years old")
}
let studname = Women(name: "Priya", age: 21)
print(studname)

let stud = Women(name: "Rehan", age: 29)
print(stud)

let student = Women(name: "Rohan", age: 19)
print(student)


@objc protocol rectangle {
    var area: Double { get }
}
class Circle: rectangle {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class output: rectangle {
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
let objects: [AnyObject] = [Circle(radius: 2.0),output(area: 198),sides(rectsides: 4)]

for object in objects {
    if let objectWithArea = object as? rectangle {
        print("Area is: \(objectWithArea.area)")
    } else {
        print("Rectangle area is not defined")
    }
}
