//
//  quantifiers.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let quantifiers = [linq67, linq69, linq70, linq72]

func linq67(){
    let words = [ "believe", "relief", "receipt", "field" ]
    
    let iAfterE = words.any { $0.contains("ei") }
    
    println("There is a word that contains in the list that contains 'ei': \(iAfterE)")
}

func linq69(){
    let products = productsList()
    
    let productGroups = products
        .groupBy { (p:Product) in p.category }
        .find { $0.items.any { p in p.unitsInStock == 0 } }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
        }

    productGroups.each { println($0.Products) }
}

func linq70(){
    let numbers = [ 1, 11, 3, 19, 41, 65, 19 ]
    
    let onlyOdd = numbers.all { $0 % 2 == 1 }
    
    println("The list contains only odd numbers: \(onlyOdd)")
}

func linq72(){
    let products = productsList()
    
    let productGroups = products.groupBy { $0.category }
        .find { $0.items.all { p in p.unitsInStock > 0 } }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
    }

    productGroups.each { println($0.Products) }
}
