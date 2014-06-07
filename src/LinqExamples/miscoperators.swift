//
//  miscoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/7/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let miscoperators = [linq97]

func linq94(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let allNumbers = numbersA + numbersB
    
    println("All numbers from both arrays:")
    allNumbers.each(println)
}

func linq95(){
    let customers = customersList()
    let products = productsList()
    
    let customerNames = customers.map { $0.companyName }
    let productNames = products.map { $0.productName }
    
    let allNames = customerNames + productNames
    
    println("Customer and product names:")
    allNames.each(println)
}

func linq96(){
    let wordsA = [ "cherry", "apple", "blueberry" ]
    let wordsB = [ "cherry", "apple", "blueberry" ]
    
    let match = wordsA == wordsB
    
    println("The sequences match: \(match)")
}

func linq97(){
    let wordsA = [ "cherry", "apple", "blueberry" ]
    let wordsB = [ "apple", "blueberry", "cherry" ]
    
    let match = wordsA == wordsB
    
    println("The sequences match: \(match)")
}