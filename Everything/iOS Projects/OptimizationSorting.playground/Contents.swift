//: Playground - noun: a place where people can play

import UIKit

//func bubbleSort(inputData: inout [Int]) {
//    var inputDataLength = inputData.count
//
//    while inputDataLength != 0 {
//        var newn = 0
//        for forwardPointer in 1...inputDataLength - 1 {
//            if (inputData[forwardPointer - 1] > inputData[forwardPointer]) {
//                let tmp = inputData[forwardPointer - 1]
//                inputData[forwardPointer - 1] = inputData[forwardPointer]
//                inputData[forwardPointer] = tmp
//                newn = forwardPointer
//            }
//        }
//        inputDataLength = newn
//    }
//}
//var array = [3, 10, 2, 5, 1, 4]
//bubbleSort(inputData: &array)


var array = [5, 3, 4, 6, 8, 2, 9, 1, 7, 10, 11]
var sortedArray = NSMutableArray(array: array)
var sortedAboveIndex = array.count
var swaps = 0

repeat {
    var lastSwapIndex = 0
    
    for i in 1..<sortedAboveIndex {
        if (sortedArray[i - 1] as! Int) > (sortedArray[i] as! Int) {
            sortedArray.exchangeObject(at: i, withObjectAt: i - 1)
            lastSwapIndex = i
            swaps += 1
        }
    }
    sortedAboveIndex = lastSwapIndex
} while (sortedAboveIndex != 0)

print(array)
print(sortedArray as Array)
print("Array is sorted in \(swaps) swaps.")


