//
//  ordering.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let ordering = [linq28, linq29, linq30, linq31, linq32, linq33, linq34, linq35, linq36, linq37, linq38, linq39]

func linq28(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = words.sort()
    
    print("The sorted list of words:")
    sortedWords.forEach { print($0) }
}

func linq29(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = words.sort { $0.length < $1.length }
    
    print("The sorted list of words (by length):")
    sortedWords.forEach { print($0) }
}

func linq30(){
    let products = productsList()
    
    let sortedProducts = products.sort { $0.productName < $1.productName }
    
    sortedProducts.forEach { print($0) }
}

func linq31(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = words.sort(caseInsensitiveComparer)
    
    sortedWords.forEach { print($0) }
}

func linq32(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let sortedDoubles = doubles.sort().reverse()
    
    print("The doubles from highest to lowest:")
    sortedDoubles.forEach { print($0) }
}

func linq33(){
    let products = productsList()
    
    let sortedProducts = products.sort { $0.unitsInStock < $1.unitsInStock }.reverse()
    
    sortedProducts.forEach { print($0) }
}

func linq34(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = words.sort(caseInsensitiveComparer).reverse()
    
    sortedWords.forEach { print($0) }
}

func linq35(){
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let sortedDigits = digits.sort { $0 < $1 }.sort { $0.length < $1.length }
    
    print("Sorted digits:")
    sortedDigits.forEach { print($0) }
}

func linq36(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = words.sort(caseInsensitiveComparer).sort { $0.length < $1.length }
    
    sortedWords.forEach { print($0) }
}

func linq37(){
    let products = productsList()
    
    let sortedProducts = products.sortBy(
        { compare($0.category, $1.category) },
        { compare($1.unitPrice, $0.unitPrice) }
    )
    sortedProducts.forEach { print($0) }
}

func linq38(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = words.sortBy(
        { compare($0.length,$1.length) },
        { compareIgnoreCase($0,$1) }
    )
    
    sortedWords.forEach { print($0) }
}

func linq39(){
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let reversedIDigits = digits
        .filter { $0.charAt(1) == "i" }
        .reverse()
    
    print("A backwards list of the digits with a second character of 'i':")
    reversedIDigits.forEach { print($0) }
}
