//
//  grouping.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation

let grouping = [linq40, linq41, linq42, linq43, linq44, linq45]

func linq40(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numberGroups = numbers.groupBy { $0 % 5 }
        .map { g -> (Remainder: Int, Numbers: Group<Int,Int>) in
            (g.key, g)
        }
    
    for g in numberGroups {
        print("Numbers with a remainder of \(g.Remainder) when divided by 5:")
        g.Numbers.items.forEach { print($0) }
    }
}

func linq41(){
    let words = [ "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" ]
    
    let wordGroups = words.groupBy { $0.charAt(0) }
        .map { g -> (FirstLetter:String, Words:Group<String,String>) in
            (g.key, g)
        }
    
    for g in wordGroups {
        print("Words that start with the letter '\(g.FirstLetter)':")
        g.Words.items.forEach { print($0) }
    }
}

func linq42(){
    let products = productsList()

    let orderGroups = products.groupBy { $0.category }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
        }

    orderGroups.forEach {
        print("\($0.Category):")
        $0.Products.items.forEach { print($0) }
    }
}

func linq43(){
    let customers = customersList()
    
    typealias Year = Int
    typealias Month = Int
    
    let customerOrderGroups = customers.map { (c:Customer) -> (CompanyName:String, YearGroups:[(Year:Int, MonthGroups:[Group<Year, Order>])]) in
            (c.companyName,
             c.orders.groupBy { o in o.orderDate!.year }
                .map { (yg:Group<Month,Order>) in
                    (yg.key,
                     yg.items.groupBy { (o:Order) in o.orderDate!.month })
                })
        }

    customerOrderGroups.forEach {
        print("\n# \($0.CompanyName)")
        $0.YearGroups.forEach { yg in
            print("\(yg.Year): ")
            yg.MonthGroups.forEach { print("  \($0)") }
        }
    }
}

func linq44(){
    let anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    let orderGroups = anagrams.groupBy({ (s:String) in s.trim() }, matchWith: anagramComparer)
    
    orderGroups.forEach { print($0.items) }
}

func linq45(){
    let anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    let orderGroups = anagrams.groupBy({ (s:String) in s.trim() },
        matchWith: anagramComparer,
        valueAs: { s in s.uppercaseString })
    
    orderGroups.forEach { print($0.items) }
}
