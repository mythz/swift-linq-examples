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
    var words = [ "believe", "relief", "receipt", "field" ]
    
    var iAfterE = words.any { $0.contains("ei") }
    
    println("There is a word that contains in the list that contains 'ei': \(iAfterE)")
}

func linq69(){
    var products = productsList()
    
    var productGroups = products
        .groupBy { (p:Product) in p.category }
        .find { $0.items.any { p in p.unitsInStock == 0 } }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
        }

    productGroups.each { println($0.Products) }
}

func linq70(){
    var numbers = [ 1, 11, 3, 19, 41, 65, 19 ]
    
    var onlyOdd = numbers.all { $0 % 2 == 1 }
    
    println("The list contains only odd numbers: \(onlyOdd)")
}

func linq72(){
    var products = productsList()
    
    var productGroups = products.groupBy { $0.category }
        .find { $0.items.all { p in p.unitsInStock > 0 } }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
    }

    productGroups.each { println($0.Products) }
}
