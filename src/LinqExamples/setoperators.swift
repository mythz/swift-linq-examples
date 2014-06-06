//
//  setoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let setoperators = [linq53]

func linq46(){
    var factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    var uniqueFactors = distinct(factorsOf300)
    
    println("Prime factors of 300:")
    uniqueFactors.each(println)
}

func linq47(){
    var products = productsList()
    
    var categoryNames = distinct(products.map { $0.category })

    println("Category names:")
    categoryNames.each(println)
}

func linq48(){
    var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    var numbersB = [ 1, 3, 5, 7, 8 ]
    
    var uniqueNumbers = union(numbersA, numbersB)
    
    println("Unique numbers from both arrays:")
    uniqueNumbers.each(println)
}

func linq49(){
    var products = productsList()
    var customers = customersList()
    
    var productFirstChars = products.map { $0.productName.charAt(0) }
    var customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    var uniqueFirstChars = union(productFirstChars, customerFirstChars)
    
    println("Unique first letters from Product names and Customer names:")
    uniqueFirstChars.each(println)
}

func linq50(){
    var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    var numbersB = [ 1, 3, 5, 7, 8 ]
    
    var commonNumbers = intersection(numbersA, numbersB)
    
    println("Common numbers shared by both arrays:")
    commonNumbers.each(println)
}

func linq51(){
    var products = productsList()
    var customers = customersList()
    
    var productFirstChars = products.map { $0.productName.charAt(0) }
    var customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    var commonFirstChars = intersection(productFirstChars, customerFirstChars)
    
    println("Common first letters from Product names and Customer names:")
    commonFirstChars.each(println)
}

func linq52(){
    var numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    var numbersB = [ 1, 3, 5, 7, 8 ]
    
    var aOnlyNumbers = difference(numbersA, numbersB)
    
    println("Numbers in first array but not second array:")
    aOnlyNumbers.each(println)
}

func linq53(){
    var products = productsList()
    var customers = customersList()
    
    var productFirstChars = products.map { $0.productName.charAt(0) }
    var customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    var productOnlyFirstChars = difference(productFirstChars, customerFirstChars);
    
    println("First letters from Product names, but not from Customer names:")
    productOnlyFirstChars.each(println)
}

