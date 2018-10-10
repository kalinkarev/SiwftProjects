//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let aString = "This is :) my string :) \n :)"
let newString = aString.replacingOccurrences(of: ":)", with: "+")

let multiLineString = """
                            Line one :)
                            Line two :)
                            Line three :)
                            """

print("The multi line message is: \(multiLineString)")

let changedString = multiLineString.replacingOccurrences(of: ":)", with: "!!")

print("The changed multiline message is: \(changedString)")


var s = "The Pep :) Boys:) are :) :)"
var replaceString = " !!"
while let r = s.range(of: " :)") {
    s.replaceSubrange(r, with: replaceString)
}
print("The new array is: \(s)")


let str = "sunday, monday, happy days"
for char in str {
    print("Found character: \(char)")
}







