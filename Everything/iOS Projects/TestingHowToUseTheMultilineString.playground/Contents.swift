//: Playground - noun: a place where people can play

import UIKit

var inputString = """
Line one :)
Line two :)
:)Line three
"""

let inputSeparatedByEnter = inputString.components(separatedBy: "\n")

let changeSymbol = ":)"

let numberOfLinesUserEnter = inputSeparatedByEnter.count

for i in 0..<numberOfLinesUserEnter {
    var linesInput = inputSeparatedByEnter[i].components(separatedBy: " ")
    let count = linesInput.count
    for j in 0..<count {
        if (linesInput[j] == changeSymbol) {
            linesInput[j] = "!!"
        }
    }
    
    print("The changed sentence is: \(linesInput)")
    
    var numberOfLinesAfterChange = linesInput.count
    
    for k in 0..<numberOfLinesAfterChange {
        linesInput[k].append(contentsOf: linesInput[k+1])
    }
    print()
    
}


