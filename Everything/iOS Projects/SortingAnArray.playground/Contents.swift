//: Playground - noun: a place where people can play
//
import UIKit

//func bubbleSort(_ input:[Int]) -> [Int] {
//    guard input.count>1 else {
//        return input
//    }
//
//    var result = input
//    let count = result.count
////    var swapIn: Int
//
//    var isSwapped = false
//
//    repeat {
//        isSwapped = false
//        for index in 1..<count {
//            if result[index] < result[index - 1] {
//                result.swapAt(index - 1, index)
////                swapIn = result[index]
////                result[index] = result[index + 1]
////                result[index + 1] = swapIn
//                isSwapped = true
//            }
//        }
//    } while isSwapped
//
//    return result
//}
//
//var array = [3,2,7,5]
//
//bubbleSort(array)



func bubbleSort(_ input:[Int]) -> [Int] {
    guard input.count>1 else {
        return input
    }

    var result = input
    let count = result.count
//    var swapIn: Int
//    var c: Int
    
    var isSwapped = false

    repeat {
        isSwapped = false
        for index in 1..<count {
            if result[index] < result[index - 1] {
                result.swapAt(index - 1, index)
                
//            c = result[index]
//            result[index] = result[index + 1]
//            result[index + 1] = c

//                swapIn = result[index]
//                result[index] = result[index + 1]
//                result[index + 1] = swapIn
                isSwapped = true
            }
        }
    } while isSwapped

    return result
}

var array = [3,2,7,5]

//bubbleSort(array)



//func sortBubble(_ input:[Int]) -> [Int] {
//    guard input.count>1 else {
//        return input
//    }
//
//    var result = input
//    let count = result.count
//    //    var swapIn: Int
//    var c: Int
//
//    var isSwapped = false
//
//    repeat {
//        isSwapped = false
//        for index in 1..<count {
//
//            if result[index] > result[index + 1] {
//                c = result[index]
//                result[index] = result[index + 1]
//                result[index + 1] = c
//                isSwapped = true
//            }
//
////            if result[index] < result[index - 1] {
////                result.swapAt(index - 1, index)
//
//                //            c = result[index]
//                //            result[index] = result[index + 1]
//                //            result[index + 1] = c
//
//                //                swapIn = result[index]
//                //                result[index] = result[index + 1]
//                //                result[index + 1] = swapIn
////                isSwapped = true
////            }
//        }
//    } while isSwapped
//
//    return result
//}
//
//var arrayForSorting = [10, 7, 11, 4, 3, 12]
//print("The array is: \(arrayForSorting)")
//
//print("The sorted array is: \(sortBubble(arrayForSorting))")



//func bubble(_ input:[Int]) -> [Int] {
//    guard input.count > 1 else {
//        return input
//    }
//
//    var result = input
//    let arrayCount = result.count
//
//    var isSwapped = false
//
//        for index in 0...arrayCount-1 {
//            for value in 0...arrayCount - index - 1 {
//                if result[value] > result[value + 1] {
//                    let largeValue = result[value]
//                    result[value] = result[value + 1]
//                    result[value + 1] = largeValue
//                    isSwapped = true
//                }
//            }
//        }
//    return result
//}
//
//
//var someArray = [10, 7, 11, 4, 3, 12]
////bubbleSort(someArray)
//bubble(someArray)


func sortB(_ input:[Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    
    var isSwapped = false
    
    repeat {
        isSwapped = false
        for index in 1..<count {
            if result[index] < result[index - 1] {
                result.swapAt(index - 1, index)
                isSwapped = true
            }
        }
    } while isSwapped
    return result
}

func bSort(_ input:[Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var result = input
    let count = result.count
    var isSwapped = false
    
    for index in 0...count-1 {
        for value in 0...count-index-1 {
            if result[value] > result[value + 1] {
                let largeValue = result[value]
                result[value] = result[value + 1]
                result[value + 1] = largeValue
                isSwapped = true
            }
        }
    }
    return result
}
var test = [10, 7, 11, 4, 3, 12]
//print("The sorted array is: \(bSort(test))")


func correctOne(array: inout [Int]) {
    let arrayCount = array.count

    for index in 0...arrayCount-1 {
        for value in 0...arrayCount - index - 1 {
            if array[value] > array[value + 1] {
                let largeValue = array[value]
                array[value] = array[value + 1]
                array[value + 1] = largeValue
            }
        }
    }
}
//correctOne(array: &test)



//func sort( array: inout [Int]) {
//    let arrayCount = array.count
//    for index in 0...arrayCount {
//        for value in 0...arrayCount-index-1 {
//            if array[value - 1] > array[value] {
//                let largeValue = array[value - 1]
//                array[value - 1] = array[value]
//                array[value] = largeValue
//            }
//        }
//    }
//}

//var arrayTest = [10, 7, 11, 4, 3, 12]
//sort(array: &arrayTest)

















//func bubbleWhile(arr: inout [Int]) {
//    var i = arr.count - 1
//    while (i > 0) {
//        var j = 0
//        while (j < i) {
//            if (arr[j] > arr[j+1]) {
//                arr.swapAt(j, j + 1)
//            }
//            j += 1
//        }
//        i -= 1
//    }
//}
//
//var array = [10, 7, 11, 4, 3, 12]
//print("The sorted array is: \(bubbleWhile(arr: &array))")




func sortingWithBubble( array: inout [Int]) {
    let arrayCount = array.count
    
    for index in 0...arrayCount {
        for value in 1...arrayCount-2 {
            if array[value - 1] > array[value] {
                let largeValue = array[value - 1]
                array[value - 1] = array[value]
                array[value] = largeValue
            }
        }
    }
}
var sampleArray = [9, 81, 0, 0, 5, 7, 27, 12, 46]
sortingWithBubble(array: &sampleArray)


func newTypeOfSorting( array: inout [Int]) {
    let arrayCount = array.count
    
    for index in 0...arrayCount {
        for value in 1...arrayCount-1 {
            if array[value-1] > array[value] {
                let largeValue = array[value - 1]
                array[value - 1] = array[value]
                array[value] = largeValue
            }
        }
    }
}
var testArray = [100, 110, 20, 4, 25, 1]
newTypeOfSorting(array: &testArray)


func sortingUsingBubble( array: inout [Int]) {
    let arrayLenght = array.count
    for index in 0...arrayLenght {
        for value in 1...arrayLenght-1 {
            if (array[value-1] > array[value]) {
                let largestValue = array[value-1]
                array[value-1] = array[value]
                array[value] = largestValue
            }
        }
    }
}
var arrayForTest = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
sortingUsingBubble(array: &arrayForTest)


func sortingInAscendingOrder( array: inout [Int]) {
    let arrayLength = array.count
    for index in 0...arrayLength {
        for value in 1...arrayLength-1 {
            if (array[value-1] < array[value]) {
                let largestValue = array[value-1]
                array[value-1] = array[value]
                array[value] = largestValue
            }
        }
    }
}
var arrayInAcsending = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sortingInAscendingOrder(array: &arrayInAcsending)


func sortingInAscendingOrderNewWay( array: inout [Int]) {
    let arrayLength = array.count
    for index in 0...arrayLength {
        for value in 1...arrayLength-1 {
            if (array[value-1] < array[value]) {
                let largestValue = array[value-1]
                array[value-1] = array[value]
                array[value] = largestValue
            }
        }
    }
}
var arrayReorder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
sortingInAscendingOrderNewWay(array: &array)




//func sortInCStyle( array: inout [Int]) {
//    let arrayCount = array.count
//
//    for c in 0...arrayCount {
//        for d in 1...arrayCount-1 {
//            if array[d] < array[d-1] {
//                let p = array[d]
//                array[d] = array[d+1]
//                array[d+1] = p
//            }
//        }
//    }
//}
//var objectArray = [100, 110, 20, 4, 25, 1]
//sortInCStyle(array: &objectArray)












