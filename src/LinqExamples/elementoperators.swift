//
//  elementoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/7/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let elementoperators = [linq58, linq59, linq61, linq62, linq64]

func linq58(){
    let products = productsList()
    
    let product12 = products.filter { $0.productId == 12 }[0]
    
    print(product12)
}

func linq59(){
    let strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let startsWithO = strings.firstWhere { $0.charAt(0) == "o" }
    
    print("A string starting with 'o': \(startsWithO)")
}

func linq61(){
    let numbers:[Int] = []
    
    let firstNumOrDefault = numbers.firstWhere({ n in true }, orElse: { 0 })
    
    print(firstNumOrDefault)
}

func linq62(){
    let products = productsList()
    
    let product789 = products.firstWhere { (p:Product) in p.productId == 789 }
    
    print("Product 789 exists: \(product789 != nil)")
}

func linq64(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let fourthLowNum = numbers.filter { $0 > 5 }[1]
    
    print("Second number > 5: \(fourthLowNum)")
}
