//
//  conversion.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let conversions = [linq54, linq55, linq56, linq57, linq58, linq59, linq61, linq62, linq64]

func linq54(){
    var doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    var sortedDoubles = sort(doubles).reverse()
    
    var doublesArray = sortedDoubles
    
    println("Every other double from highest to lowest:")
    var d = 0
    while d < doublesArray.count {
        println(doublesArray[d])
        d += 2
    } 
}

func linq55(){
    var words = [ "cherry", "apple", "blueberry" ]
    
    var sortedWords = sort(words)
    
    var wordList = sortedWords
    
    println("The sorted word list:")
    wordList.each(println)
}

func linq56(){
    var scoreRecords = [
        ( Name: "Alice", Score: 50),
        ( Name: "Bob", Score: 40),
        ( Name: "Cathy", Score: 45),
    ]
    
    var scoreRecordsDict = scoreRecords.toDictionary {
        (x:(Name:String,Score:Int)) in x.Name
    }
    
    var bobsScore = scoreRecordsDict["Bob"]!
    println("Bob's score: \(bobsScore)")
}

func linq57(){
    var numbers = [ nil as Any, 1.0, "two", 3, "four", 5, "six", 7.0 ]
    
    var doubles = numbers.find { $0 is Double }
    
    println("Numbers stored as doubles:")
    doubles.each(println)
}

func linq58(){
    var products = productsList()
    
    var product12 = products.find { $0.productId == 12 }[0]
    
    println(product12)
}

func linq59(){
    var strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    var startsWithO = strings.firstWhere { $0.charAt(0) == "o" }
    
    println("A string starting with 'o': \(startsWithO)")
}

func linq61(){
    var numbers:Int[] = []
    
    var firstNumOrDefault = numbers.firstWhere({ n in true }, orElse: { 0 })
    
    println(firstNumOrDefault)
}

func linq62(){
    var products = productsList()
    
    var product789 = products.firstWhere { (p:Product) in p.productId == 789 }
    
    println("Product 789 exists: \(product789 != nil)")
}

func linq64(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var fourthLowNum = numbers.find { $0 > 5 }[1]
    
    println("Second number > 5: \(fourthLowNum)")
}

