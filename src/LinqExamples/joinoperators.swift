//
//  joinoperators.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/7/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

let joinoperators = [linq102, linq103, linq104, linq105]

func linq102(){
    let categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ]
    
    let products = productsList()
    
    let q = join(categories, products) { (c:String,p:Product) in c == p.category }
        .map { j -> (Category:String, ProductName:String) in
            let (c,p) = j
            return (c, p.productName)
        }

    q.each {
        println("CategoryName:\($0.Category), ProductName:\($0.ProductName)")
    }
}

func linq103(){
    let categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ]
    
    let products = productsList()
    
    let q = joinGroup(categories, products) { c,p in c == p.category }
        .map { (j:Group<String,(String,Product)>) -> (Category:String, Products:Product[]) in
            (j.key, j.items.map {
                let (_,p) = $0
                return p })
        }
    
    for v in q {
        println("\(v.Category):")
        v.Products.each { println("   \($0.productName)") }
    }
}

func linq104(){
    let categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ]
    
    let products = productsList()
    
    let q = joinGroup(categories, products) { c,p in c == p.category }
        .expand { j in j.items.map {
                    let (_,p) = $0
                    return p
                }.map { (p:Product) -> (Category:String,ProductName:String) in
                    (j.key, p.productName)
                }
        }
    
    for v in q {
        println("\(v.ProductName): \(v.Category)")
    }
}

func linq105(){
    let categories = [ "Beverages", "Condiments", "Vegetables", "Dairy Products", "Seafood" ]
    
    let products = productsList()
    
    let q = categories
        .expand { c -> (Category:String,ProductName:String)[] in
            let catProducts = products.find { c == $0.category }
            return catProducts.isEmpty
                ? [(c, "(No products)")]
                : catProducts.map { p in( c, p.productName) }
        }
    
    for v in q {
        println("\(v.ProductName): \(v.Category)")
    }
}

