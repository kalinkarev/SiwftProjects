//: Playground - noun: a place where people can play

import UIKit

//func insertionSort( array: inout [Int]) {
//    let n = array.count
//
//    for i in 1...n {
//        let key = array[i]
//        var j = i - 1
//
//        while (j >= 0 && array[j] > key) {
//            array[j+1] = array[j]
//            j = j - 1
//        }
//        array[j+1] = key
//    }
//}
//var array = [1, 3, 2, 5, 4]


func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}
var array = [1, 3, 2, 5, 4]
insertionSort(array)

func newInsertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y - 1] {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}
var newArray = [8, 3, 5, 4, 6]
newInsertionSort(newArray)


//func quickSort(array: [Int]) -> [Int] {
//    if array.isEmpty {
//        return []
//    }
//    let first = array.first
//    let smallerOfEqual = array.dropFirst().filter {$0 <= first}
//    let larger = array.dropFirst().filer {$0 > first}
//
//    return quickSort(smallerOfEqual) + [first] + quickSort(larger)
//}
//var arrayQuickSort = [6, 4, 7, 9, 22, 78, 11, 1, 0, 234]
//quickSort(array: arrayQuickSort)


let arrayToSort = [10, 22, 50, 9, 33, 41, 21, 40, 80, 60, 26]

func performQuickSort(arrayToSort: [Int]) -> [Int] {
    if arrayToSort.count == 1 {
        return arrayToSort
    }
    
    let pivotIndex: Int = arrayToSort.count - 1
    var leftArray: [Int] = []
    var rightArray: [Int] = []
    
    for var i in 0..<pivotIndex {
        if arrayToSort[i] < arrayToSort[pivotIndex] {
            leftArray.append(arrayToSort[i])
        } else if arrayToSort[i] > arrayToSort[pivotIndex] {
            rightArray.append(arrayToSort[i])
        }
    }

    print("leftArray: " + String(describing: leftArray))
    print("rightArray: " + String(describing: rightArray))
    
    var leftSortedArray: [Int]
    
    if leftArray.count > 1 {
        leftSortedArray = performQuickSort(arrayToSort: leftArray)
    } else {
        leftSortedArray = leftArray
    }
    
    var rightSortedArray: [Int]
    if rightArray.count > 1 {
        rightSortedArray = performQuickSort(arrayToSort: rightArray)
    } else {
        rightSortedArray = rightArray
    }
    
    let resultArray = concatenateArrays(leftSortedArray: leftSortedArray, rightSortedArray: rightSortedArray, pivotElement: arrayToSort[pivotIndex])
    print(resultArray)
    return resultArray
}

func concatenateArrays(leftSortedArray: [Int], rightSortedArray: [Int], pivotElement: Int) -> [Int] {
    var resultArray:[Int] = []
    for var n in leftSortedArray {
        resultArray.append(n)
    }
    
    resultArray.append(pivotElement)
    for var k in rightSortedArray {
        resultArray.append(k)
    }
    return resultArray
}

let solutionArray = performQuickSort(arrayToSort: arrayToSort)
print(solutionArray)


// Find nth element from last in the linked list
/* The Linked List starts with 0 like the arrays */
class Node {
    var value: Int
    var next: Node?
    
    public init(newVal: Int) {
        self.value = newVal
    }
}

class LinkedList {
    var head: Node?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        if var currentNode = head {
            while var nextNode = currentNode.next {
                currentNode = nextNode
            }
            return currentNode
        } else {
            return nil
        }
    }
    
    func append(_ newElement: Int) {
        let newNode = Node(newVal: newElement)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func numberOfElements() -> Int {
        var num = 0
        
        if var currentNode = head {
            num += 1
            while let nextNode = currentNode.next {
                currentNode = nextNode
                num += 1
            }
        }
        return num
    }
    
    func getNthFromLast(n: Int) -> Int {
        guard numberOfElements()-n >= 0 else {
            return -1
        }
        
        let numFromFirst = numberOfElements()-n
        var responseNode = head
        var counter = 1
        while counter < numFromFirst {
            responseNode = responseNode?.next
            counter += 1
        }
        return (responseNode?.value)!
    }
}

let linkedList = LinkedList()
linkedList.append(10)
linkedList.append(15)
linkedList.append(20)
linkedList.append(25)
linkedList.append(30)
linkedList.append(35)
linkedList.append(40)
linkedList.append(45)
linkedList.append(50)
linkedList.append(55)
linkedList.append(60)
linkedList.append(65)
linkedList.append(70)
linkedList.append(75)
linkedList.append(80)
linkedList.last?.value
linkedList.first?.value
linkedList.getNthFromLast(n: 5)
linkedList.numberOfElements()






var fj = "Hello, World"































