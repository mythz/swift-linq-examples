//
//  conversion.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let conversions = [linq54, linq55, linq56, linq57]

func linq54(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let sortedDoubles = doubles.sorted().reversed()
    
    let doublesArray = sortedDoubles.toArray()
    
    print("Every other double from highest to lowest:")
    var d = 0
    while d < doublesArray.count {
        print(doublesArray[d])
        d += 2
    } 
}

func linq55(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = words.sorted()
    
    let wordList = sortedWords
    
    print("The sorted word list:")
    wordList.forEach { print($0) }
}

func linq56(){
    let scoreRecords = [
        ( Name: "Alice", Score: 50),
        ( Name: "Bob", Score: 40),
        ( Name: "Cathy", Score: 45),
    ]
    
    let scoreRecordsDict = scoreRecords.toDictionary {
        (x:(Name:String,Score:Int)) in x.Name
    }
    
    let bobsScore = scoreRecordsDict["Bob"]!
    print("Bob's score: \(bobsScore)")
}

func linq57(){
    let numbers = [ nil as Any?, 1.0, "two", 3, "four", 5, "six", 7.0 ]
    
    let doubles = numbers.filter { $0 is Double }.map { $0! }
    
    print("Numbers stored as doubles:")
    doubles.forEach { print($0) }
}
