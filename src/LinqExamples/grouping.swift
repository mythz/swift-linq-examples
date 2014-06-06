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
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var numberGroups = numbers.groupBy { $0 % 5 }
        .map { g -> (Remainder: Int, Numbers: Group<Int,Int>) in
            (g.key, g)
        }
    
    for g in numberGroups {
        println("Numbers with a remainder of \(g.Remainder) when divided by 5:")
        g.Numbers.items.each(println)
    }
}

func linq41(){
    var words = [ "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" ]
    
    var wordGroups = words.groupBy { $0.charAt(0) }
        .map { g -> (FirstLetter:String, Words:Group<String,String>) in
            (g.key, g)
        }
    
    for g in wordGroups {
        println("Words that start with the letter '\(g.FirstLetter)':")
        g.Words.items.each(println)
    }
}

func linq42(){
    var products = productsList()

    var orderGroups = products.groupBy { $0.category }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
        }

    orderGroups.each { println("\($0.Category):"); $0.Products.items.each(println) }
}

func linq43(){
    var customers = customersList()
    
    typealias Year = Int
    typealias Month = Int
    
    var customerOrderGroups = customers
        .map { c -> ( CompanyName:String, YearGroups:(Year:Int, MonthGroups:Group<Year, Order>[])[] ) in
            (
                c.companyName,
                c.orders.groupBy { o in Date.getYear(o.orderDate!) }
                    .map {
                        (yg:Group<Int,Order>) in
                        (
                            yg.key,
                            yg.items.groupBy { (o:Order) in Date.getMonth(o.orderDate!) }
                        )
                    }
            )
        }

    customerOrderGroups.each {
        println("\n# \($0.CompanyName)")
        $0.YearGroups.each { yg in
            println("\(yg.Year): ")
            yg.MonthGroups.each { println("  \($0)") }
        }
    }
}

func linq44(){
    var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    var orderGroups = anagrams.groupBy({ (s:String) in s.trim() }, anagramComparer)
    
    orderGroups.each { println($0.items) }
}

func linq45(){
    var anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    var orderGroups = anagrams.groupBy({ (s:String) in s.trim() },
        matchWith: anagramComparer,
        valueAs: { s in s.uppercaseString })
    
    orderGroups.each { println($0.items) }
}
