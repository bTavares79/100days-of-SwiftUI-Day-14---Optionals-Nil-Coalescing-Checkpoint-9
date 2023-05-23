import UIKit

func myFunc(_ array: [Int]?) -> Int {
    
    // This reads if the array doesn't have anything in it return a random number
    // between the values of 1 and 100
    array?.randomElement() ?? Int.random(in: 1...100)
}

var checkpoint = myFunc([])
print(checkpoint)
