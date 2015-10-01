//
//  setoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let setoperators = [linq46, linq47, linq48, linq49, linq50, linq51, linq52, linq53]

func linq46(){
    let factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    let uniqueFactors = distinct(factorsOf300)
    
    print("Prime factors of 300:")
    uniqueFactors.forEach { print($0) }
}

func linq47(){
    let products = productsList()
    
    let categoryNames = distinct(products.map { $0.category })

    print("Category names:")
    categoryNames.forEach { print($0) }
}

func linq48(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let uniqueNumbers = union(numbersA, numbersB)
    
    print("Unique numbers from both arrays:")
    uniqueNumbers.forEach { print($0) }
}

func linq49(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let uniqueFirstChars = union(productFirstChars, customerFirstChars)
    
    print("Unique first letters from Product names and Customer names:")
    uniqueFirstChars.forEach { print($0) }
}

func linq50(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let commonNumbers = intersection(numbersA, numbersB)
    
    print("Common numbers shared by both arrays:")
    commonNumbers.forEach { print($0) }
}

func linq51(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let commonFirstChars = intersection(productFirstChars, customerFirstChars)
    
    print("Common first letters from Product names and Customer names:")
    commonFirstChars.forEach { print($0) }
}

func linq52(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let aOnlyNumbers = difference(numbersA, other: numbersB)
    
    print("Numbers in first array but not second array:")
    aOnlyNumbers.forEach { print($0) }
}

func linq53(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let productOnlyFirstChars = difference(productFirstChars, other: customerFirstChars)
    
    print("First letters from Product names, but not from Customer names:")
    productOnlyFirstChars.forEach { print($0) }
}

