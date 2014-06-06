//
//  quantifiers.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let quantifiers = [linq82]

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

func linq73(){
    var factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    var uniqueFactors = distinct(factorsOf300).count
    
    println("There are \(uniqueFactors) unique factors of 300.")
}

func linq74(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var oddNumbers = numbers.find { $0 % 2 == 1 }.count
    
    println("There are \(oddNumbers) odd numbers in the list.")
}

func linq76(){
    var customers = customersList()
    
    var orderCounts = customers
        .map { c -> (CustomerId:String, OrderCount:Int) in
            (c.customerId, c.orders.count)
        }
    
    orderCounts.each(println)
}

func linq77(){
    var products = productsList()
    
    var categoryCounts = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String,ProductCount:Int) in
            (g.key, g.items.count)
        }
    
    categoryCounts.each(println)
}

func linq78(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var numSum = numbers.sum()
    
    println("The sum of the numbers is \(numSum).")
}

func linq79(){
    var words = [ "cherry", "apple", "blueberry" ]
    
    var totalChars = words.sum { $0.length }
    
    println("There are a total of \(totalChars) characters in these words.")
}

func linq80(){
    var products = productsList()
    
    var categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, TotalUnitsInStock:Int) in
            (g.key, g.items.sum { $0.unitsInStock })
        }
    
    categories.each(println)
}

func linq81(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var minNum = numbers.min()
    
    println("The minimum number is \(minNum).")
}

func linq82(){
    var words = [ "cherry", "apple", "blueberry" ]
    
    var shortestWord = words.min { $0.length }
    
    println("The shortest word is \(shortestWord) characters long.")
}

//func linq83(){
//    var products = productsList()
//    
//    var categories = products.groupBy { (p:Product) -> p.category }
//        .map { g -> (Category:String, CheapestPrice:Double) in
//            (g.key, )
//        }
////        .map((g) => { 'Category': g.key, 'CheapestPrice': min(g.values.map((p) => p.unitPrice)) });
//    
//    categories.each(println)
//}
