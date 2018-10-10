import UIKit

func calculateStatistics(_ scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if (score > max) {
            max = score
        } else if (score < min) {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let theArray = [5, 1, 100, 3, 9]
let statistics = calculateStatistics(theArray)
print(statistics.min)
print(statistics.max)
print(statistics.sum)


enum Rank: Int {
    case One = 1
    case Two = 2
    case Three = 3
}

let card1 = Rank.One.rawValue
let card2 = Rank.Two.rawValue

var card3: Rank = .One
var card4: Rank = .Three

if card3 == card4 {
    print("match")
} else {
    print("not a match")
}

enum Rank1: Int {
    case Ace = -5, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
}

let card = Rank1.King
print(card.rawValue)




