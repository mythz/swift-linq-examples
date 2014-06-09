101 LINQ Samples in Swift
=========================

Port of the [C# 101 LINQ Samples](http://code.msdn.microsoft.com/101-LINQ-Samples-3fb9811b) rewritten into [Apple's Swift](https://developer.apple.com/swift/).

Compare Swift to other LINQ examples written in:

 - [Clojure](https://github.com/mythz/clojure-linq-examples)
 - [Dart](https://github.com/dartist/101LinqSamples)

### Running the examples

You can choose to run specific examples by commenting the sections you're not interested in [main.swift](https://github.com/mythz/swift-linq-examples/blob/master/src/LinqExamples/main.swift).

To see the full output of all the examples, run the [LinqExamples.xcodeproj](https://github.com/mythz/swift-linq-examples/tree/master/src) XCode project locally.

### Contents

The samples below mirrors the C# LINQ samples layout with the names of the top-level Swift methods matching their corresponding C# examples.

#### [LINQ - Restriction Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/restrictions.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Restriction-Operators-b15d29ca)
#### [LINQ - Projection Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/projections.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-09787825)
#### [LINQ - Partitioning Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/partitioning.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Partitioning-Operators-c68aaccc)
#### [LINQ - Ordering Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/ordering.swift) / [MSDN C#](http://code.msdn.microsoft.com/SQL-Ordering-Operators-050af19e)
#### [LINQ - Grouping Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/grouping.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-to-DataSets-Grouping-c62703ea)
#### [LINQ - Set Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/setoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Set-Operators-374f34fe)
#### [LINQ - Conversion Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/conversionoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Conversion-Operators-e4e59714)
#### [LINQ - Element Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/elementoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Element-Operators-0f3f12ce)
#### [LINQ - Generation Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/generationoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Generation-Operators-8a3fbff7)
#### [LINQ - Quantifiers](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/quantifiers.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Quantifiers-f00e7e3e)
#### [LINQ - Aggregate Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/aggregateoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Aggregate-Operators-c51b3869)
#### [LINQ - Miscellaneous Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/miscellaneousoperations.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Miscellaneous-6b72bb2a)
#### [LINQ - Query Execution](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/queryexecution.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Query-Execution-ce0d3b95)
#### [LINQ - Join Operators](https://github.com/mythz/swift-linq-examples/tree/master/src/LinqExamples/joinoperators.swift) / [MSDN C#](http://code.msdn.microsoft.com/LINQ-Join-Operators-dabef4e9)

##  Side-by-side - C# LINQ vs Swift

For a side-by-side comparison, the original **C#** source code is displayed above the equivalent **Swift** translation. 

  - The **Output** shows the console output of running the **Swift** sample. 
  - Outputs ending with `...` illustrates only a partial response is displayed. 
  - The C# ObjectDumper util used is downloadable from MSDN - [ObjectDumper.zip](http://code.msdn.microsoft.com/Visual-Studio-2008-C-d295cdba/file/46086/1/ObjectDumper.zip)

Unlike many languages that support a functional-style, Swift doesn't have many LINQ-like utils built-in by default, but as Swift is highly extensible this functionality can be easily extended on core primitives like `Array` as can be seen in [extensions.swift](https://github.com/mythz/swift-linq-examples/blob/master/src/LinqExamples/extensions.swift) which contains all utils used in the samples below.

These LINQ extensions are also available in the [LinqKit](https://github.com/mythz/LinqKit) project.

LINQ - Restriction Operators
----------------------------

### linq1: Where - Simple 1

```csharp
//c#
public void Linq1() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var lowNums = 
        from n in numbers 
        where n < 5 
        select n; 
  
    Console.WriteLine("Numbers < 5:"); 
    foreach (var x in lowNums) 
    { 
        Console.WriteLine(x); 
    } 
}  
```
```go
//swift
func linq1(){
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let lowNums = numbers.find { $0 < 5}
    
    println("Numbers < 5:")
    lowNums.each(println)
}
```
#### Output

    Numbers < 5:
    4
    1
    3
    2
    0

### linq2: Where - Simple 2
```csharp
//c#
public void Linq2() 
{ 
    List<Product> products = GetProductList(); 
  
    var soldOutProducts = 
        from p in products 
        where p.UnitsInStock == 0 
        select p; 
  
    Console.WriteLine("Sold out products:"); 
    foreach (var product in soldOutProducts) 
    { 
        Console.WriteLine("{0} is sold out!", product.ProductName); 
    } 
} 
```
```go
//swift
func linq2(){
    let products = productsList()
    
    let soldOutProducts = products
        .find { $0.unitsInStock == 0 }
    
    println("Sold out products:")
    for p in soldOutProducts {
        println("\(p.productName) is sold out!")
    }
}
```
#### Output

    Sold out products:
    Chef Anton's Gumbo Mix is sold out!
    Alice Mutton is sold out!
    Thüringer Rostbratwurst is sold out!
    Gorgonzola Telino is sold out!
    Perth Pasties is sold out!

### linq3: Where - Simple 3
```csharp
//c#
public void Linq3() 
{ 
    List<Product> products = GetProductList(); 
  
    var expensiveInStockProducts = 
        from p in products 
        where p.UnitsInStock > 0 && p.UnitPrice > 3.00M 
        select p; 
  
    Console.WriteLine("In-stock products that cost more than 3.00:"); 
    foreach (var product in expensiveInStockProducts) 
    { 
        Console.WriteLine("{0} is in stock and costs more than 3.00.", product.ProductName); 
    } 
} 
```
```go
//swift
func linq3(){
    let products = productsList()
    
    let expensiveInStockProducts = products
        .find { p in p.unitsInStock > 0 && p.unitPrice > 3.00 }
    
    println("In-stock products that cost more than 3.00:")
    for p in expensiveInStockProducts {
        println("\(p.productName) is in stock and costs more than 3.00.")
    }
}
```
#### Output

    In-stock products that cost more than 3.00:
    Chai is in stock and costs more than 3.00.
    Chang is in stock and costs more than 3.00.
    Aniseed Syrup is in stock and costs more than 3.00.
    ...

### linq4: Where - Drilldown
```csharp
//c#
public void Linq4() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var waCustomers = 
        from c in customers 
        where c.Region == "WA" 
        select c; 
  
    Console.WriteLine("Customers from Washington and their orders:"); 
    foreach (var customer in waCustomers) 
    { 
        Console.WriteLine("Customer {0}: {1}", customer.CustomerID, customer.CompanyName); 
        foreach (var order in customer.Orders) 
        { 
            Console.WriteLine("  Order {0}: {1}", order.OrderID, order.OrderDate); 
        } 
    } 
} 
```
```go
//swift
func linq4(){
    let customers = customersList()
    let waCustomers = customers
        .find { $0.region == "WA" }
    
    println("Customers from Washington and their orders:")
    for c in waCustomers {
        println("Customer \(c.customerId): \(c.companyName)")
        for o in c.orders {
            println("  Order \(o.orderId): \(o.orderDate)")
        }
    }
}
```
#### Output

    Customers from Washington and their orders:
    Customer LAZYK: Lazy K Kountry Store
      Order 10482: -5877520-03-03 -596:-31:-23 +0000
      Order 10545: -5877520-03-03 -596:-31:-23 +0000
    Customer TRAIH: Trail's Head Gourmet Provisioners
      Order 10574: -5877520-03-03 -596:-31:-23 +0000
      Order 10577: -5877520-03-03 -596:-31:-23 +0000
      Order 10822: -5877520-03-03 -596:-31:-23 +0000
      ...

### linq5: Where - Indexed
```csharp
//c#
public void Linq5() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var shortDigits = digits.Where((digit, index) => digit.Length < index); 
  
    Console.WriteLine("Short digits:"); 
    foreach (var d in shortDigits) 
    { 
        Console.WriteLine("The word {0} is shorter than its value.", d); 
    } 
}
```
```go
//swift
func linq5(){
    let digits = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

    let shortDigits = digits.find { $0.length < $1 }
    
    println("Short digits:")
    for d in shortDigits {
        println("The word \(d) is shorter than its value.")
    }
}
```
#### Output

    Short digits:
    The word five is shorter than its value.
    The word six is shorter than its value.
    The word seven is shorter than its value.
    The word eight is shorter than its value.
    The word nine is shorter than its value.

LINQ - Projection Operators
---------------------------

### linq6: Select - Simple 1
```csharp
//c#
public void Linq6() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numsPlusOne = 
        from n in numbers 
        select n + 1; 
  
    Console.WriteLine("Numbers + 1:"); 
    foreach (var i in numsPlusOne) 
    { 
        Console.WriteLine(i); 
    } 
}
```
```go
//swift
func linq6(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numsPlusOne = numbers.map { $0 + 1 }
    
    println("Numbers + 1:")
    numsPlusOne.each(println)
}
```
#### Output

    Numbers + 1:
    6
    5
    2
    4
    10
    9
    7
    8
    3
    1

### linq7: Select - Simple 2
```csharp
//c#
public void Linq7() 
{ 
    List<Product> products = GetProductList(); 
  
    var productNames = 
        from p in products 
        select p.ProductName; 
  
    Console.WriteLine("Product Names:"); 
    foreach (var productName in productNames) 
    { 
        Console.WriteLine(productName); 
    } 
}
```
```go
//swift
func linq7(){
    let products = productsList()
    
    let productNames = products.map { $0.productName }
    
    println("Product Names:")
    productNames.each(println)
}
```
#### Output

    Product Names:
    Chai
    Chang
    Aniseed Syrup
    Chef Anton's Cajun Seasoning
    Chef Anton's Gumbo Mix
    ...

### linq8: Select - Transformation
```csharp
//c#
public void Linq8() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var textNums = 
        from n in numbers 
        select strings[n]; 
  
    Console.WriteLine("Number strings:"); 
    foreach (var s in textNums) 
    { 
        Console.WriteLine(s); 
    } 
}
```
```go
//swift
func linq8(){
    let numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0]
    let strings = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    let textNums = numbers.map { strings[$0] }
    
    println("Number strings:")
    textNums.each(println)
}
```
#### Output

    Number strings:
    five
    four
    one
    three
    nine
    eight
    six
    seven
    two
    zero

### linq9: Select - Anonymous Types 1
```csharp
//c#
public void Linq9() 
{ 
    string[] words = { "aPPLE", "BlUeBeRrY", "cHeRry" }; 
  
    var upperLowerWords = 
        from w in words 
        select new { Upper = w.ToUpper(), Lower = w.ToLower() }; 
  
    foreach (var ul in upperLowerWords) 
    { 
        Console.WriteLine("Uppercase: {0}, Lowercase: {1}", ul.Upper, ul.Lower); 
    } 
}
```
```go
//swift
func linq9(){
    let words = ["aPPLE", "BlUeBeRrY", "cHeRry"]
    
    let upperLowerWords = words.map { s -> (Upper: String, Lower:String) in
        (s.uppercaseString, s.lowercaseString)
    }
    
    for ul in upperLowerWords {
        println("Uppercase: \(ul.Upper), Lowercase: \(ul.Lower)")
    }
}
```
#### Output

    Uppercase: APPLE, Lowercase: apple
    Uppercase: BLUEBERRY, Lowercase: blueberry
    Uppercase: CHERRY, Lowercase: cherry

### linq10: Select - Anonymous Types 2
```csharp
//c#
public void Linq10() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var digitOddEvens = 
        from n in numbers 
        select new { Digit = strings[n], Even = (n % 2 == 0) }; 
  
    foreach (var d in digitOddEvens) 
    { 
        Console.WriteLine("The digit {0} is {1}.", d.Digit, d.Even ? "even" : "odd"); 
    } 
}
```
```go
//swift
func linq10(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let digitOddEvens = numbers.map { i -> (Digit: String, Even:Bool) in
        (strings[i], (i % 2 == 0))
    }
    
    for d in digitOddEvens {
        println("The digit \(d.Digit) is " + (d.Even ? "even" : "odd") + ".")
    }
}
```
#### Output

    The digit five is odd.
    The digit four is even.
    The digit one is odd.
    The digit three is odd.
    The digit nine is odd.
    The digit eight is even.
    The digit six is even.
    The digit seven is odd.
    The digit two is even.
    The digit zero is even.

### linq11: Select - Anonymous Types 3
```csharp
//c#
public void Linq11() 
{ 
    List<Product> products = GetProductList(); 
  
    var productInfos = 
        from p in products 
        select new { p.ProductName, p.Category, Price = p.UnitPrice }; 
  
    Console.WriteLine("Product Info:"); 
    foreach (var productInfo in productInfos) 
    { 
        Console.WriteLine("{0} is in the category {1} and costs {2} per unit.", productInfo.ProductName, productInfo.Category, productInfo.Price); 
    } 
}
```
```go
//swift
func linq11(){
    let products = productsList()
    
    let productInfos = products.map { p -> (ProductName: String, Category:String, Price:Double) in
        (p.productName, p.category, p.unitPrice)
    }
    
    println("Product Info:")
    for p in productInfos {
        println("\(p.ProductName) is in the category \(p.Category) and costs \(p.Price) per unit.")
    }
}
```
#### Output

    Product Info:
    Chai is in the category Beverages and costs 18.0 per unit.
    Chang is in the category Beverages and costs 19.0 per unit.
    Aniseed Syrup is in the category Condiments and costs 10.0 per unit.
    ...

### linq12: Select - Indexed
```csharp
//c#
public void Linq12() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numsInPlace = numbers.Select((num, index) => new { Num = num, InPlace = (num == index) }); 
  
    Console.WriteLine("Number: In-place?"); 
    foreach (var n in numsInPlace) 
    { 
        Console.WriteLine("{0}: {1}", n.Num, n.InPlace); 
    } 
}
```
```go
//swift
func linq12(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let numsInPlace = numbers.map { i -> (Num: Int, InPlace:Bool) in
        (i, i == index++)
    }
    
    println("Number: In-place?")
    for n in numsInPlace {
        println("\(n.Num): \(n.InPlace)")
    }
}
```
#### Output

    Number: In-place?
    5: false
    4: false
    1: false
    3: true
    9: false
    8: false
    6: true
    7: true
    2: false
    0: false

### linq13: Select - Filtered
```csharp
//c#
public void Linq13() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var lowNums = 
        from n in numbers 
        where n < 5 
        select digits[n]; 
  
    Console.WriteLine("Numbers < 5:"); 
    foreach (var num in lowNums) 
    { 
        Console.WriteLine(num); 
    } 
}
```
```go
//swift
func linq13(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let lowNums = numbers
        .find { $0 < 5 }
        .map { digits[$0] }
    
    println("Numbers < 5:")
    lowNums.each(println)
}
```
#### Output

    Numbers < 5:
    four
    one
    three
    two
    zero

### linq14: SelectMany - Compound from 1
```csharp
//c#
public void Linq14() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var pairs = 
        from a in numbersA 
        from b in numbersB 
        where a < b 
        select new { a, b }; 
  
    Console.WriteLine("Pairs where a < b:"); 
    foreach (var pair in pairs) 
    { 
        Console.WriteLine("{0} is less than {1}", pair.a, pair.b); 
    } 
}
```
```go
//swift
func linq14(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let pairs = numbersA.expand { a in
        numbersB
            .find { b in a < b }
            .map { i -> (a: Int, b:Int) in (a, i) }
        }
    
    println("Pairs where a < b:")
    for pair in pairs {
        println("\(pair.a) is less than \(pair.b)")
    }
}
```
#### Output

    Pairs where a < b:
    0 is less than 1
    0 is less than 3
    0 is less than 5
    0 is less than 7
    0 is less than 8
    2 is less than 3
    2 is less than 5
    2 is less than 7
    2 is less than 8
    4 is less than 5
    4 is less than 7
    4 is less than 8
    5 is less than 7
    5 is less than 8
    6 is less than 7
    6 is less than 8

### linq15: SelectMany - Compound from 2
```csharp
//c#
public void Linq15() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.Total < 500.00M 
        select new { c.CustomerID, o.OrderID, o.Total }; 
  
    ObjectDumper.Write(orders); 
}
```
```go
//swift
func linq15(){
    let customers = customersList()
    
    let orders = customers.expand { c in
        c.orders
            .find { $0.total < 500 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.each(println)
}
```
#### Output

    (ALFKI, 10702, 330.0)
    (ALFKI, 10952, 471.2)
    (ANATR, 10308, 88.8)
    (ANATR, 10625, 479.75)
    ...

### linq16: SelectMany - Compound from 3
```csharp
//c#
public void Linq16() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.OrderDate >= new DateTime(1998, 1, 1) 
        select new { c.CustomerID, o.OrderID, o.OrderDate }; 
  
    ObjectDumper.Write(orders); 
}
```
```go
//swift
func linq16(){
    let customers = customersList()
    
    let date = NSDate(year: 1998, month: 1, day: 1)
    let orders = customers.expand { c in
        c.orders
            .find { $0.orderDate! > date }
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
    
    orders.each(println)
}
```
#### Output

    (ALFKI, 10835, 1998-01-15 05:00:00 +0000)
    (ALFKI, 10952, 1998-03-16 05:00:00 +0000)
    (ALFKI, 11011, 1998-04-09 04:00:00 +0000)
    (ANATR, 10926, 1998-03-04 05:00:00 +0000)
    (ANTON, 10856, 1998-01-28 05:00:00 +0000)
    ...

### linq17: SelectMany - from Assignment
```csharp
//c#
public void Linq17() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orders = 
        from c in customers 
        from o in c.Orders 
        where o.Total >= 2000.0M 
        select new { c.CustomerID, o.OrderID, o.Total }; 
  
    ObjectDumper.Write(orders); 
}
```
```go
//swift
func linq17(){
    let customers = customersList()
    
    let orders = customers.expand { c in
        c.orders
            .find { $0.total >= 2000 }
            .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                (c.customerId, o.orderId, o.total)
            }
        }
    
    orders.each(println)
}
```
#### Output

    (ANTON, 10573, 2082.0)
    (AROUT, 10558, 2142.9)
    (AROUT, 10953, 4441.25)
    (BERGS, 10384, 2222.4)
    (BERGS, 10524, 3192.65)
    ...

### linq18: SelectMany - Multiple from
```csharp
//c#
public void Linq18() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    DateTime cutoffDate = new DateTime(1997, 1, 1); 
  
    var orders = 
        from c in customers 
        where c.Region == "WA" 
        from o in c.Orders 
        where o.OrderDate >= cutoffDate 
        select new { c.CustomerID, o.OrderID }; 
  
    ObjectDumper.Write(orders); 
}
```
```go
//swift
func linq18(){
    let customers = customersList()
    
    let cutoffDate = NSDate(year: 1997, month: 1, day: 1)
    
    let orders = customers
        .find { $0.region == "WA" }.expand { c in
            c.orders
                .find { $0.orderDate! > cutoffDate }
                .map { o -> (CustomerId: String, OrderId:Int, Total:Double) in
                    (c.customerId, o.orderId, o.total)
                }
            }
    
    orders.each(println)
}
```
#### Output

    (LAZYK, 10482)
    (LAZYK, 10545)
    (TRAIH, 10574)
    (TRAIH, 10577)
    (TRAIH, 10822)
    (WHITC, 10469)
    (WHITC, 10483)
    (WHITC, 10504)
    (WHITC, 10596)
    (WHITC, 10693)
    (WHITC, 10696)
    (WHITC, 10723)
    (WHITC, 10740)
    (WHITC, 10861)
    (WHITC, 10904)
    (WHITC, 11032)
    (WHITC, 11066)

### linq19: SelectMany - Indexed
```csharp
//c#
public void Linq19() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var customerOrders = 
        customers.SelectMany( 
            (cust, custIndex) => 
            cust.Orders.Select(o => "Customer #" + (custIndex + 1) + 
                                    " has an order with OrderID " + o.OrderID)); 
  
    ObjectDumper.Write(customerOrders); 
}
```
```go
//swift
func linq19(){
    let customers = customersList()
    
    var custIndex = 0
    let customerOrders = customers.expand { c -> String[] in
        custIndex++
        return c.orders.map { "Customer #\(custIndex) has an order with OrderID \($0.orderId)" }
    }
    
    customerOrders.each(println)
}
```
#### Output

    Customer #1 has an order with OrderID 10643
    Customer #1 has an order with OrderID 10692
    Customer #1 has an order with OrderID 10702
    Customer #1 has an order with OrderID 10835
    Customer #1 has an order with OrderID 10952
    Customer #1 has an order with OrderID 11011
    Customer #2 has an order with OrderID 10308
    Customer #2 has an order with OrderID 10625
    Customer #2 has an order with OrderID 10759
    Customer #2 has an order with OrderID 10926
    ...

LINQ - Partitioning Operators
-----------------------------

### linq20: Take - Simple
```csharp
//c#
public void Linq20() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 

    var first3Numbers = numbers.Take(3); 
  
    Console.WriteLine("First 3 numbers:"); 
  
    foreach (var n in first3Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq20(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let first3Numbers = numbers[0..3]
    
    println("First 3 numbers:")
    first3Numbers.each(println)
}
```
#### Output

    First 3 numbers:
    5
    4
    1

### linq21: Take - Nested
```csharp
//c#
public void Linq21()   
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var first3WAOrders = ( 
        from c in customers 
        from o in c.Orders 
        where c.Region == "WA" 
        select new { c.CustomerID, o.OrderID, o.OrderDate }) 
        .Take(3); 
  
    Console.WriteLine("First 3 orders in WA:"); 
    foreach (var order in first3WAOrders) 
    { 
        ObjectDumper.Write(order); 
    } 
}
```
```go
//swift
func linq21(){
    let customers = customersList()
    
    let first3WAOrders = customers
        .find { $0.region == "WA" }
        .expand { c in c.orders
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
        .take(3)
    
    println("First 3 orders in WA:")
    first3WAOrders.each(println)
}
```
#### Output

    First 3 orders in WA:
    (LAZYK, 10482, 1997-03-21 05:00:00 +0000)
    (LAZYK, 10545, 1997-05-22 04:00:00 +0000)
    (TRAIH, 10574, 1997-06-19 04:00:00 +0000)


### linq22: Skip - Simple
```csharp
//c#
public void Linq22() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var allButFirst4Numbers = numbers.Skip(4); 
  
    Console.WriteLine("All but first 4 numbers:"); 
    foreach (var n in allButFirst4Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq22(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    let allButFirst4Numbers = numbers.skip(4)
    
    println("All but first 4 numbers:")
    allButFirst4Numbers.each(println)
}
```
#### Output

    All but first 4 numbers:
    9
    8
    6
    7
    2
    0

### linq23: Skip - Nested
```csharp
//c#
public void Linq23()   
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var waOrders = 
        from c in customers 
        from o in c.Orders 
        where c.Region == "WA" 
        select new { c.CustomerID, o.OrderID, o.OrderDate }; 
  
    var allButFirst2Orders = waOrders.Skip(2); 
  
    Console.WriteLine("All but first 2 orders in WA:"); 
    foreach (var order in allButFirst2Orders) 
    { 
        ObjectDumper.Write(order); 
    } 
}
```
```go
//swift
func linq23(){
    let customers = customersList()
    
    let waOrders = customers
        .find { $0.region == "WA" }
        .expand { c in c.orders
            .map { o -> (CustomerId: String, OrderId:Int, OrderDate:NSDate?) in
                (c.customerId, o.orderId, o.orderDate)
            }
        }
    
    let allButFirst2Orders = waOrders.skip(2)
    
    println("All but first 2 orders in WA:")
    allButFirst2Orders.each(println)
}
```
#### Output

    All but first 2 orders in WA:
    (TRAIH, 10574, 1997-06-19 04:00:00 +0000)
    (TRAIH, 10577, 1997-06-23 04:00:00 +0000)
    (TRAIH, 10822, 1998-01-08 05:00:00 +0000)
    (WHITC, 10269, 1996-07-31 04:00:00 +0000)
    (WHITC, 10344, 1996-11-01 05:00:00 +0000)
    (WHITC, 10469, 1997-03-10 05:00:00 +0000)
    (WHITC, 10483, 1997-03-24 05:00:00 +0000)
    (WHITC, 10504, 1997-04-11 04:00:00 +0000)
    (WHITC, 10596, 1997-07-11 04:00:00 +0000)
    (WHITC, 10693, 1997-10-06 04:00:00 +0000)
    (WHITC, 10696, 1997-10-08 04:00:00 +0000)
    (WHITC, 10723, 1997-10-30 05:00:00 +0000)
    (WHITC, 10740, 1997-11-13 05:00:00 +0000)
    (WHITC, 10861, 1998-01-30 05:00:00 +0000)
    (WHITC, 10904, 1998-02-24 05:00:00 +0000)
    (WHITC, 11032, 1998-04-17 04:00:00 +0000)
    (WHITC, 11066, 1998-05-01 04:00:00 +0000)

### linq24: TakeWhile - Simple
```csharp
//c#
public void Linq24() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var firstNumbersLessThan6 = numbers.TakeWhile(n => n < 6); 
  
    Console.WriteLine("First numbers less than 6:"); 
    foreach (var n in firstNumbersLessThan6) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq24(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let firstNumbersLessThan6 = numbers.takeWhile { $0 < 6 }
    
    println("First numbers less than 6:")
    firstNumbersLessThan6.each(println)
}
```
#### Output

    First numbers less than 6:
    5
    4
    1
    3

### linq25: TakeWhile - Indexed
```csharp
//c#
public void Linq25() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var firstSmallNumbers = numbers.TakeWhile((n, index) => n >= index); 
  
    Console.WriteLine("First numbers not less than their position:"); 
    foreach (var n in firstSmallNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq25(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let firstSmallNumbers = numbers.takeWhile { $0 >= index++ }
    
    println("First numbers not less than their position:")
    firstSmallNumbers.each(println)
}
```
#### Output

    First numbers not less than their position:
    5
    4

### linq26: SkipWhile - Simple
```csharp
//c#
public void Linq26() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var allButFirst3Numbers = numbers.SkipWhile(n => n % 3 != 0); 
  
    Console.WriteLine("All elements starting from first element divisible by 3:"); 
    foreach (var n in allButFirst3Numbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq26(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let allButFirst3Numbers = numbers.skipWhile { $0 % 3 != 0 }
    println("All elements starting from first element divisible by 3:")
    allButFirst3Numbers.each(println)
}
```
#### Output

    All elements starting from first element divisible by 3:
    3
    9
    8
    6
    7
    2
    0

### linq27: SkipWhile - Indexed
```csharp
//c#
public void Linq27() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var laterNumbers = numbers.SkipWhile((n, index) => n >= index); 
  
    Console.WriteLine("All elements starting from first element less than its position:"); 
    foreach (var n in laterNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq27(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var index = 0
    let laterNumbers = numbers.skipWhile { $0 >= index++ }
    
    println("All elements starting from first element less than its position:")
    laterNumbers.each(println)
}
```
#### Output

    All elements starting from first element less than its position:
    1
    3
    9
    8
    6
    7
    2
    0


LINQ - Ordering Operators
-------------------------

### linq28: OrderBy - Simple 1
```csharp
//c#
public void Linq28() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w 
        select w; 
  
    Console.WriteLine("The sorted list of words:"); 
    foreach (var w in sortedWords) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```go
//swift
func linq28(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = sort(words)
    
    println("The sorted list of words:")
    sortedWords.each(println)
}
```
#### Output

    The sorted list of words:
    apple
    blueberry
    cherry

### linq29: OrderBy - Simple 2
```csharp
//c#
public void Linq29() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w.Length 
        select w; 
  
    Console.WriteLine("The sorted list of words (by length):"); 
    foreach (var w in sortedWords) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```go
//swift
func linq29(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = sort(words) { $0.length < $1.length }
    
    println("The sorted list of words (by length):")
    sortedWords.each(println)
}
```
#### Output

    The sorted list of words (by length):
    apple
    cherry
    blueberry

### linq30: OrderBy - Simple 3
```csharp
//c#
public void Linq30() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.ProductName 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```go
//swift
func linq30(){
    let products = productsList()
    
    let sortedProducts = sort(products) { $0.productName < $1.productName }
    
    sortedProducts.each(println)
}
```
#### Output

    [Product id:17, name:Alice Mutton, cat:Meat/Poultry, price:39.0, inStock:0]
    [Product id:3, name:Aniseed Syrup, cat:Condiments, price:10.0, inStock:13]
    [Product id:40, name:Boston Crab Meat, cat:Seafood, price:18.4, inStock:123]
    [Product id:60, name:Camembert Pierrot, cat:Dairy Products, price:34.0, inStock:19]
    [Product id:18, name:Carnarvon Tigers, cat:Seafood, price:62.5, inStock:42]
    ...

### linq31: OrderBy - Comparer
```csharp
//c#
public void Linq31() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = words.OrderBy(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```go
//swift
func linq31(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = sort(words, caseInsensitiveComparer)
    
    sortedWords.each(println)
}
```
#### Output

    AbAcUs
    aPPLE
    BlUeBeRrY
    bRaNcH
    cHeRry
    ClOvEr

### linq32: OrderByDescending - Simple 1
```csharp
//c#
public void Linq32() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    var sortedDoubles = 
        from d in doubles 
        orderby d descending 
        select d; 
  
    Console.WriteLine("The doubles from highest to lowest:"); 
    foreach (var d in sortedDoubles) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```go
//swift
func linq32(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let sortedDoubles = sort(doubles).reverse()
    
    println("The doubles from highest to lowest:")
    sortedDoubles.each(println)
}
```
#### Output

    The doubles from highest to lowest:
    4.1
    2.9
    2.3
    1.9
    1.7

### linq33: OrderByDescending - Simple 2
```csharp
//c#
public void Linq33() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.UnitsInStock descending 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```go
//swift
func linq33(){
    let products = productsList()
    
    let sortedProducts = sort(products) { $0.unitsInStock < $1.unitsInStock }.reverse()
    
    sortedProducts.each(println)
}
```
#### Output

    [Product id:75, name:Rhönbräu Klosterbier, cat:Beverages, price:7.75, inStock:125]
    [Product id:40, name:Boston Crab Meat, cat:Seafood, price:18.4, inStock:123]
    [Product id:6, name:Grandma's Boysenberry Spread, cat:Condiments, price:25.0, inStock:120]
    [Product id:55, name:Pâté chinois, cat:Meat/Poultry, price:24.0, inStock:115]
    [Product id:61, name:Sirop d'érable, cat:Condiments, price:28.5, inStock:113]
    ...

### linq34: OrderByDescending - Comparer
```csharp
//c#
public void Linq34() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = words.OrderByDescending(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```go
//swift
func linq34(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = sort(words, caseInsensitiveComparer).reverse()
    
    sortedWords.each(println)
}
```
#### Output

    ClOvEr
    cHeRry
    bRaNcH
    BlUeBeRrY
    aPPLE
    AbAcUs

### linq35: ThenBy - Simple
```csharp
//c#
public void Linq35() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var sortedDigits = 
        from d in digits 
        orderby d.Length, d 
        select d; 
  
    Console.WriteLine("Sorted digits:"); 
    foreach (var d in sortedDigits) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```go
//swift
func linq35(){
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let sortedDigits = sort(sort(digits) { $0 < $1 }) { $0.length < $1.length }
    
    println("Sorted digits:")
    sortedDigits.each(println)
}
```
#### Output

    Sorted digits:
    one
    six
    two
    five
    four
    nine
    zero
    eight
    seven
    three

### linq36: ThenBy - Comparer
```csharp
//c#
public void Linq36() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = 
        words.OrderBy(a => a.Length) 
             .ThenBy(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```go
//swift
func linq36(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = sort(sort(words, caseInsensitiveComparer)) { $0.length < $1.length }
    
    sortedWords.each(println)
}
```
#### Output

    aPPLE
    AbAcUs
    bRaNcH
    cHeRry
    ClOvEr
    BlUeBeRrY

### linq37: ThenByDescending - Simple
```csharp
//c#
public void Linq37() 
{ 
    List<Product> products = GetProductList(); 
  
    var sortedProducts = 
        from p in products 
        orderby p.Category, p.UnitPrice descending 
        select p; 
  
    ObjectDumper.Write(sortedProducts); 
}
```
```go
//swift
func linq37(){
    let products = productsList()
    
    let sortedProducts = products.sortBy(
        { compare($0.category, $1.category) },
        { compare($1.unitPrice, $0.unitPrice) }
    )
    sortedProducts.each(println)
}
```
#### Output

    [Product id:38, name:Côte de Blaye, cat:Beverages, price:263.5, inStock:17]
    [Product id:43, name:Ipoh Coffee, cat:Beverages, price:46.0, inStock:17]
    [Product id:2, name:Chang, cat:Beverages, price:19.0, inStock:17]
    [Product id:35, name:Steeleye Stout, cat:Beverages, price:18.0, inStock:20]
    [Product id:76, name:Lakkalikööri, cat:Beverages, price:18.0, inStock:57]
    [Product id:39, name:Chartreuse verte, cat:Beverages, price:18.0, inStock:69]
    [Product id:1, name:Chai, cat:Beverages, price:18.0, inStock:39]
    [Product id:70, name:Outback Lager, cat:Beverages, price:15.0, inStock:15]
    [Product id:67, name:Laughing Lumberjack Lager, cat:Beverages, price:14.0, inStock:52]
    [Product id:34, name:Sasquatch Ale, cat:Beverages, price:14.0, inStock:111]
    ...

### linq38: ThenByDescending - Comparer
```csharp
//c#
public void Linq38() 
{ 
    string[] words = { "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" }; 
  
    var sortedWords = 
        words.OrderBy(a => a.Length) 
             .ThenByDescending(a => a, new CaseInsensitiveComparer()); 
  
    ObjectDumper.Write(sortedWords); 
} 
```
```go
//swift
func linq38(){
    let words = [ "aPPLE", "AbAcUs", "bRaNcH", "BlUeBeRrY", "ClOvEr", "cHeRry" ]
    
    let sortedWords = words.sortBy(
        { compare($0.length,$1.length) },
        { compareIgnoreCase($0,$1) }
    )
    
    sortedWords.each(println)
}
```
#### Output

    aPPLE
    ClOvEr
    cHeRry
    bRaNcH
    AbAcUs
    BlUeBeRrY

### linq39: Reverse
```csharp
//c#
public void Linq39() 
{ 
    string[] digits = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    var reversedIDigits = ( 
        from d in digits 
        where d[1] == 'i' 
        select d) 
        .Reverse(); 
  
    Console.WriteLine("A backwards list of the digits with a second character of 'i':"); 
    foreach (var d in reversedIDigits) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```go
//swift
func linq39(){
    let digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let reversedIDigits = digits
        .find { $0.charAt(1) == "i" }
        .reverse()
    
    println("A backwards list of the digits with a second character of 'i':")
    reversedIDigits.each(println)
}
```
#### Output

    A backwards list of the digits with a second character of 'i':
    nine
    eight
    six
    five


LINQ - Grouping Operators
-------------------------

### linq40: GroupBy - Simple 1
```csharp
//c#
public void Linq40() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    var numberGroups = 
        from n in numbers 
        group n by n % 5 into g 
        select new { Remainder = g.Key, Numbers = g }; 
  
    foreach (var g in numberGroups) 
    { 
        Console.WriteLine("Numbers with a remainder of {0} when divided by 5:", g.Remainder); 
        foreach (var n in g.Numbers) 
        { 
            Console.WriteLine(n); 
        } 
    } 
}
```
```go
//swift
func linq40(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numberGroups = numbers.groupBy { $0 % 5 }
        .map { g -> (Remainder: Int, Numbers: Group<Int,Int>) in
            (g.key, g)
        }
    
    for g in numberGroups {
        println("Numbers with a remainder of \(g.Remainder) when divided by 5:")
        g.Numbers.items.each(println)
    }
}
```
#### Output

    Numbers with a remainder of 0 when divided by 5:
    5
    0
    Numbers with a remainder of 1 when divided by 5:
    1
    6
    Numbers with a remainder of 2 when divided by 5:
    7
    2
    Numbers with a remainder of 3 when divided by 5:
    3
    8
    Numbers with a remainder of 4 when divided by 5:
    4
    9

### linq41: GroupBy - Simple 2
```csharp
//c#
public void Linq41() 
{ 
    string[] words = { "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" }; 
  
    var wordGroups = 
        from w in words 
        group w by w[0] into g 
        select new { FirstLetter = g.Key, Words = g }; 
  
    foreach (var g in wordGroups) 
    { 
        Console.WriteLine("Words that start with the letter '{0}':", g.FirstLetter); 
        foreach (var w in g.Words) 
        { 
            Console.WriteLine(w); 
        } 
    } 
}
```
```go
//swift
func linq41(){
    let words = [ "blueberry", "chimpanzee", "abacus", "banana", "apple", "cheese" ]
    
    let wordGroups = words.groupBy { $0.charAt(0) }
        .map { g -> (FirstLetter:String, Words:Group<String,String>) in
            (g.key, g)
        }
    
    for g in wordGroups {
        println("Words that start with the letter '\(g.FirstLetter)':")
        g.Words.items.each(println)
    }
}
```
#### Output

    Words that start with the letter 'c':
    chimpanzee
    cheese
    Words that start with the letter 'a':
    abacus
    apple
    Words that start with the letter 'b':
    blueberry
    banana

### linq42: GroupBy - Simple 3
```csharp
//c#
public void Linq42() 
{ 
    List<Product> products = GetProductList(); 
  
    var orderGroups = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, Products = g }; 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```go
//swift
func linq42(){
    let products = productsList()

    let orderGroups = products.groupBy { $0.category }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
        }

    orderGroups.each {
        println("\($0.Category):")
        $0.Products.items.each(println)
    }
}
```
#### Output

    Confections:
    [Product id:16, name:Pavlova, cat:Confections, price:17.45, inStock:29]
    [Product id:19, name:Teatime Chocolate Biscuits, cat:Confections, price:9.2, inStock:25]
    [Product id:20, name:Sir Rodney's Marmalade, cat:Confections, price:81.0, inStock:40]
    [Product id:21, name:Sir Rodney's Scones, cat:Confections, price:10.0, inStock:3]
    [Product id:25, name:NuNuCa Nuß-Nougat-Creme, cat:Confections, price:14.0, inStock:76]
    [Product id:26, name:Gumbär Gummibärchen, cat:Confections, price:31.23, inStock:15]
    [Product id:27, name:Schoggi Schokolade, cat:Confections, price:43.9, inStock:49]
    [Product id:47, name:Zaanse koeken, cat:Confections, price:9.5, inStock:36]
    [Product id:48, name:Chocolade, cat:Confections, price:12.75, inStock:15]
    [Product id:49, name:Maxilaku, cat:Confections, price:20.0, inStock:10]
    [Product id:50, name:Valkoinen suklaa, cat:Confections, price:16.25, inStock:65]
    [Product id:62, name:Tarte au sucre, cat:Confections, price:49.3, inStock:17]
    [Product id:68, name:Scottish Longbreads, cat:Confections, price:12.5, inStock:6]
    Dairy Products:
    [Product id:11, name:Queso Cabrales, cat:Dairy Products, price:21.0, inStock:22]
    [Product id:12, name:Queso Manchego La Pastora, cat:Dairy Products, price:38.0, inStock:86]

### linq43: GroupBy - Nested
```csharp
//c#
public void Linq43() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var customerOrderGroups = 
        from c in customers 
        select 
            new 
            { 
                c.CompanyName, 
                YearGroups = 
                    from o in c.Orders 
                    group o by o.OrderDate.Year into yg 
                    select 
                        new 
                        { 
                            Year = yg.Key, 
                            MonthGroups = 
                                from o in yg 
                                group o by o.OrderDate.Month into mg 
                                select new { Month = mg.Key, Orders = mg } 
                        } 
            }; 
  
    ObjectDumper.Write(customerOrderGroups, 3); 
} 
```
```go
//swift
func linq43(){
    let customers = customersList()
    
    typealias Year = Int
    typealias Month = Int
    
    let customerOrderGroups = customers.map { c
        -> (CompanyName:String, YearGroups:(Year:Int, MonthGroups:Group<Year, Order>[])[])
        in
            (c.companyName,
             c.orders.groupBy { o in o.orderDate!.getYear() }
                .map {(yg:Group<Month,Order>) in
                    (yg.key,
                     yg.items.groupBy { (o:Order) in o.orderDate!.getMonth() })
                })
        }

    customerOrderGroups.each {
        println("\n# \($0.CompanyName)")
        $0.YearGroups.each { yg in
            println("\(yg.Year): ")
            yg.MonthGroups.each { println("  \($0)") }
        }
    }
}
```
#### Output

    # Alfreds Futterkiste
    1997: 
      8: [[Order id:10643, total:814.5]]

      10: [[Order id:10692, total:878.0], [Order id:10702, total:330.0]]

    1998: 
      4: [[Order id:11011, total:933.5]]

      1: [[Order id:10835, total:845.8]]

      3: [[Order id:10952, total:471.2]]

### linq44: GroupBy - Comparer
```csharp
//c#
public void Linq44() 
{ 
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " }; 
  
    var orderGroups = anagrams.GroupBy(w => w.Trim(), new AnagramEqualityComparer()); 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```go
//swift
func linq44(){
    let anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    let orderGroups = anagrams.groupBy({ (s:String) in s.trim() }, anagramComparer)
    
    orderGroups.each { println($0.items) }
}
```
#### Output

    [from   ,  form  ]
    [ salt,   last   ]
    [ earn ,  near ]

### linq45: GroupBy - Comparer, Mapped    
```csharp
//c#
public void Linq45() 
{ 
    string[] anagrams = { "from   ", " salt", " earn ", "  last   ", " near ", " form  " }; 
  
    var orderGroups = anagrams.GroupBy( 
                w => w.Trim(), 
                a => a.ToUpper(), 
                new AnagramEqualityComparer() 
                ); 
  
    ObjectDumper.Write(orderGroups, 1); 
} 
```
```go
//swift
func linq45(){
    let anagrams = [ "from   ", " salt", " earn ", "  last   ", " near ", " form  " ]
    
    let orderGroups = anagrams.groupBy({ (s:String) in s.trim() },
        matchWith: anagramComparer,
        valueAs: { s in s.uppercaseString })
    
    orderGroups.each { println($0.items) }
}
```
#### Output

    [FROM   ,  FORM  ]
    [ SALT,   LAST   ]
    [ EARN ,  NEAR ]


LINQ - Set Operators
--------------------

### linq46: Distinct - 1
```csharp
//c#
public void Linq46() 
{ 
    int[] factorsOf300 = { 2, 2, 3, 5, 5 }; 
  
    var uniqueFactors = factorsOf300.Distinct(); 
  
    Console.WriteLine("Prime factors of 300:"); 
    foreach (var f in uniqueFactors) 
    { 
        Console.WriteLine(f); 
    } 
}
```
```go
//swift
func linq46(){
    let factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    let uniqueFactors = distinct(factorsOf300)
    
    println("Prime factors of 300:")
    uniqueFactors.each(println)
}
```
#### Output

    Prime factors of 300:
    2
    3
    5

### linq47: Distinct - 2
```csharp
//c#
public void Linq47() 
{ 
    List<Product> products = GetProductList(); 
  
    var categoryNames = ( 
        from p in products 
        select p.Category) 
        .Distinct(); 
  
    Console.WriteLine("Category names:"); 
    foreach (var n in categoryNames) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq47(){
    let products = productsList()
    
    let categoryNames = distinct(products.map { $0.category })

    println("Category names:")
    categoryNames.each(println)
}
```
#### Output

    Category names:
    Beverages
    Condiments
    Produce
    Meat/Poultry
    Seafood
    Dairy Products
    Confections
    Grains/Cereals

### linq48: Union - 1
```csharp
//c#
public void Linq48() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var uniqueNumbers = numbersA.Union(numbersB); 
  
    Console.WriteLine("Unique numbers from both arrays:"); 
    foreach (var n in uniqueNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq48(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let uniqueNumbers = union(numbersA, numbersB)
    
    println("Unique numbers from both arrays:")
    uniqueNumbers.each(println)
}
```
#### Output

    Unique numbers from both arrays:
    0
    2
    4
    5
    6
    8
    9
    1
    3
    7

### linq49: Union - 2
```csharp
//c#
public void Linq49() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var uniqueFirstChars = productFirstChars.Union(customerFirstChars); 
  
    Console.WriteLine("Unique first letters from Product names and Customer names:"); 
    foreach (var ch in uniqueFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```go
//swift
func linq49(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let uniqueFirstChars = union(productFirstChars, customerFirstChars)
    
    println("Unique first letters from Product names and Customer names:")
    uniqueFirstChars.each(println)
}
```
#### Output

    Unique first letters from Product names and Customer names:
    C
    A
    G
    U
    N
    M
    I
    Q
    K
    T
    P
    S
    R
    B
    J
    Z
    V
    F
    E
    W
    L
    O
    D
    H

### linq50: Intersect - 1
```csharp
//c#
public void Linq50() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var commonNumbers = numbersA.Intersect(numbersB); 
  
    Console.WriteLine("Common numbers shared by both arrays:"); 
    foreach (var n in commonNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq50(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let commonNumbers = intersection(numbersA, numbersB)
    
    println("Common numbers shared by both arrays:")
    commonNumbers.each(println)
}
```
#### Output

    Common numbers shared by both arrays:
    5
    8

### linq51: Intersect - 2
```csharp
//c#
public void Linq51() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var commonFirstChars = productFirstChars.Intersect(customerFirstChars); 
  
    Console.WriteLine("Common first letters from Product names and Customer names:"); 
    foreach (var ch in commonFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```go
//swift
func linq51(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let commonFirstChars = intersection(productFirstChars, customerFirstChars)
    
    println("Common first letters from Product names and Customer names:")
    commonFirstChars.each(println)
}
```
#### Output

    Common first letters from Product names and Customer names:
    C
    A
    G
    N
    M
    I
    Q
    K
    T
    P
    S
    R
    B
    V
    F
    E
    W
    L
    O

### linq52: Except - 1
```csharp
//c#
public void Linq52() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    IEnumerable<int> aOnlyNumbers = numbersA.Except(numbersB); 
  
    Console.WriteLine("Numbers in first array but not second array:"); 
    foreach (var n in aOnlyNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq52(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let aOnlyNumbers = difference(numbersA, numbersB)
    
    println("Numbers in first array but not second array:")
    aOnlyNumbers.each(println)
}
```
#### Output

    Numbers in first array but not second array:
    0
    2
    4
    6
    9

### linq53: Except - 2
```csharp
//c#
public void Linq53() 
{ 
    List<Product> products = GetProductList(); 
    List<Customer> customers = GetCustomerList(); 
  
    var productFirstChars = 
        from p in products 
        select p.ProductName[0]; 
    var customerFirstChars = 
        from c in customers 
        select c.CompanyName[0]; 
  
    var productOnlyFirstChars = productFirstChars.Except(customerFirstChars); 
  
    Console.WriteLine("First letters from Product names, but not from Customer names:"); 
    foreach (var ch in productOnlyFirstChars) 
    { 
        Console.WriteLine(ch); 
    } 
}
```
```go
//swift
func linq53(){
    let products = productsList()
    let customers = customersList()
    
    let productFirstChars = products.map { $0.productName.charAt(0) }
    let customerFirstChars = customers.map { $0.companyName.charAt(0) }
    
    let productOnlyFirstChars = difference(productFirstChars, customerFirstChars)
    
    println("First letters from Product names, but not from Customer names:")
    productOnlyFirstChars.each(println)
}
```
#### Output

    First letters from Product names, but not from Customer names:
    U
    J
    Z


LINQ - Conversion Operators
---------------------------

### linq54: ToArray
```csharp
//c#
public void Linq54() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    var sortedDoubles = 
        from d in doubles 
        orderby d descending 
        select d; 
    var doublesArray = sortedDoubles.ToArray(); 
  
    Console.WriteLine("Every other double from highest to lowest:"); 
    for (int d = 0; d < doublesArray.Length; d += 2) 
    { 
        Console.WriteLine(doublesArray[d]); 
    } 
}
```
```go
//swift
func linq54(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let sortedDoubles = sort(doubles).reverse()
    
    let doublesArray = sortedDoubles
    
    println("Every other double from highest to lowest:")
    var d = 0
    while d < doublesArray.count {
        println(doublesArray[d])
        d += 2
    } 
}
```
#### Output

    Every other double from highest to lowest:
    4.1
    2.3
    1.7

### linq55: ToList
```csharp
//c#
public void Linq55() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    var sortedWords = 
        from w in words 
        orderby w 
        select w; 
    var wordList = sortedWords.ToList(); 
  
    Console.WriteLine("The sorted word list:"); 
    foreach (var w in wordList) 
    { 
        Console.WriteLine(w); 
    } 
}
```
```go
//swift
func linq55(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let sortedWords = sort(words)
    
    let wordList = sortedWords
    
    println("The sorted word list:")
    wordList.each(println)
}
```
#### Output

    The sorted word list:
    apple
    blueberry
    cherry

### linq56: ToDictionary
```csharp
//c#
public void Linq56() 
{ 
    var scoreRecords = new[] { new {Name = "Alice", Score = 50}, 
                                new {Name = "Bob"  , Score = 40}, 
                                new {Name = "Cathy", Score = 45} 
                            }; 
  
    var scoreRecordsDict = scoreRecords.ToDictionary(sr => sr.Name); 
  
    Console.WriteLine("Bob's score: {0}", scoreRecordsDict["Bob"]); 
}
```
```go
//swift
func linq56(){
    let scoreRecords = [
        ( Name: "Alice", Score: 50),
        ( Name: "Bob", Score: 40),
        ( Name: "Cathy", Score: 45),
    ]
    
    let scoreRecordsDict = scoreRecords.toDictionary {
        (x:(Name:String,Score:Int)) in x.Name
    }
    
    let bobsScore = scoreRecordsDict["Bob"]!
    println("Bob's score: \(bobsScore)")
}
```
#### Output

    Bob's score: (Bob, 40)

### linq57: OfType    
```csharp
//c#
public void Linq57() 
{ 
    object[] numbers = { null, 1.0, "two", 3, "four", 5, "six", 7.0 }; 
  
    var doubles = numbers.OfType<double>(); 
  
    Console.WriteLine("Numbers stored as doubles:"); 
    foreach (var d in doubles) 
    { 
        Console.WriteLine(d); 
    } 
}
```
```go
//swift
func linq57(){
    let numbers = [ nil as Any, 1.0, "two", 3, "four", 5, "six", 7.0 ]
    
    let doubles = numbers.find { $0 is Double }
    
    println("Numbers stored as doubles:")
    doubles.each(println)
}
```
#### Output

    Numbers stored as doubles:
    1.0
    7.0


LINQ - Element Operators
------------------------

### linq58: First - Simple
```csharp
//c#
public void Linq58() 
{ 
    List<Product> products = GetProductList(); 
 
    Product product12 = ( 
        from p in products 
        where p.ProductID == 12 
        select p) 
        .First(); 
  
    ObjectDumper.Write(product12); 
}
```
```go
//swift
func linq58(){
    let products = productsList()
    
    let product12 = products.find { $0.productId == 12 }[0]
    
    println(product12)
}
```
#### Output

    [Product id:12, name:Queso Manchego La Pastora, cat:Dairy Products, price:38.0, inStock:86]

### linq59: First - Condition
```csharp
//c#
public void Linq59() 
{ 
    string[] strings = { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }; 
  
    string startsWithO = strings.First(s => s[0] == 'o'); 
  
    Console.WriteLine("A string starting with 'o': {0}", startsWithO); 
}
```
```go
//swift
func linq59(){
    let strings = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]
    
    let startsWithO = strings.firstWhere { $0.charAt(0) == "o" }
    
    println("A string starting with 'o': \(startsWithO)")
}
```
#### Output

    A string starting with 'o': one

### linq61: FirstOrDefault - Simple
```csharp
//c#
public void Linq61() 
{ 
    int[] numbers = { }; 
  
    int firstNumOrDefault = numbers.FirstOrDefault(); 
  
    Console.WriteLine(firstNumOrDefault); 
}
```
```go
//swift
func linq61(){
    let numbers:Int[] = []
    
    let firstNumOrDefault = numbers.firstWhere({ n in true }, orElse: { 0 })
    
    println(firstNumOrDefault)
}
```
#### Output

    0

### linq62: FirstOrDefault - Condition
```csharp
//c#
public void Linq62() 
{ 
    List<Product> products = GetProductList(); 
  
    Product product789 = products.FirstOrDefault(p => p.ProductID == 789); 
 
    Console.WriteLine("Product 789 exists: {0}", product789 != null); 
}
```
```go
//swift
func linq62(){
    let products = productsList()
    
    let product789 = products.firstWhere { (p:Product) in p.productId == 789 }
    
    println("Product 789 exists: \(product789 != nil)")
}
```
#### Output

    Product 789 exists: false

### linq64: ElementAt
```csharp
//c#
public void Linq64() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int fourthLowNum = ( 
        from n in numbers 
        where n > 5 
        select n) 
        .ElementAt(1);  // second number is index 1 because sequences use 0-based indexing 
 
    Console.WriteLine("Second number > 5: {0}", fourthLowNum); 
}
```
```go
//swift
func linq64(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let fourthLowNum = numbers.find { $0 > 5 }[1]
    
    println("Second number > 5: \(fourthLowNum)")
}
```
#### Output

    Second number > 5: 8


LINQ - Generation Operators
---------------------------

### linq65: Range
```csharp
//c#
public void Linq65() 
{ 
    var numbers = 
        from n in Enumerable.Range(100, 50) 
  
        select new { Number = n, OddEven = n % 2 == 1 ? "odd" : "even" }; 
  
    foreach (var n in numbers) 
    { 
        Console.WriteLine("The number {0} is {1}.", n.Number, n.OddEven); 
    } 
}
```
```go
//swift
func linq65(){
    let numbers = (100...150)
        .map { n -> (Number:Int, OddEven:String) in
            (n, n % 2 == 1 ? "odd" : "even")
        }
    
    for n in numbers {
        println("The number \(n.Number) is \(n.OddEven).")
    }
}
```
#### Output

    The number 100 is even.
    The number 101 is odd.
    The number 102 is even.
    The number 103 is odd.
    The number 104 is even.
    The number 105 is odd.
    The number 106 is even.
    The number 107 is odd.
    The number 108 is even.
    The number 109 is odd.
    The number 110 is even.
    ...

### linq66: Repeat
```csharp
//c#
public void Linq66() 
{ 
    var numbers = Enumerable.Repeat(7, 10); 
  
    foreach (var n in numbers) 
    {  
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq66(){
    let numbers = Array(count:10, repeatedValue:7)
    
    numbers.each(println)
}
```
#### Output

    7
    7
    7
    7
    7
    7
    7
    7
    7
    7


LINQ - Quantifiers
------------------

### linq67: Any - Simple
```csharp
//c#
public void Linq67() 
{ 
    string[] words = { "believe", "relief", "receipt", "field" }; 
  
    bool iAfterE = words.Any(w => w.Contains("ei")); 
 
    Console.WriteLine("There is a word that contains in the list that contains 'ei': {0}", iAfterE); 
}
```
```go
//swift
func linq67(){
    let words = [ "believe", "relief", "receipt", "field" ]
    
    let iAfterE = words.any { $0.contains("ei") }
    
    println("There is a word that contains in the list that contains 'ei': \(iAfterE)")
}
```
#### Output

    There is a word that contains in the list that contains 'ei': true

### linq69: Any - Grouped
```csharp
//c#
public void Linq69() 
{ 
    List<Product> products = GetProductList(); 
    var productGroups = 
        from p in products 
        group p by p.Category into g 
        where g.Any(p => p.UnitsInStock == 0) 
        select new { Category = g.Key, Products = g }; 
 
    ObjectDumper.Write(productGroups, 1);  
}
```
```go
//swift
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
```
#### Output

    Dairy Products: [[Product id:11, name:Queso Cabrales, cat:Dairy Products, price:21.0, inStock:22], [Product id:12, name:Queso Manchego La Pastora, cat:Dairy Products, price:38.0, inStock:86], [Product id:31, name:Gorgonzola Telino, cat:Dairy Products, price:12.5, inStock:0], [Product id:32, name:Mascarpone Fabioli, cat:Dairy Products, price:32.0, inStock:9], [Product id:33, name:Geitost, cat:Dairy Products, price:2.5, inStock:112], [Product id:59, name:Raclette Courdavault, cat:Dairy Products, price:55.0, inStock:79], [Product id:60, name:Camembert Pierrot, cat:Dairy Products, price:34.0, inStock:19], [Product id:69, name:Gudbrandsdalsost, cat:Dairy Products, price:36.0, inStock:26], [Product id:71, name:Flotemysost, cat:Dairy Products, price:21.5, inStock:26], [Product id:72, name:Mozzarella di Giovanni, cat:Dairy Products, price:34.8, inStock:14]]
    ...

### linq70: All - Simple
```csharp
//c#
public void Linq70() 
{  
    int[] numbers = { 1, 11, 3, 19, 41, 65, 19 }; 
  
    bool onlyOdd = numbers.All(n => n % 2 == 1); 
  
    Console.WriteLine("The list contains only odd numbers: {0}", onlyOdd); 
}
```
```go
//swift
func linq70(){
    let numbers = [ 1, 11, 3, 19, 41, 65, 19 ]
    
    let onlyOdd = numbers.all { $0 % 2 == 1 }
    
    println("The list contains only odd numbers: \(onlyOdd)")
}
```
#### Output

    The list contains only odd numbers: true

### linq72: All - Grouped    
```csharp
//c#
public void Linq72() 
{ 
    List<Product> products = GetProductList(); 
  
    var productGroups = 
        from p in products 
        group p by p.Category into g 
        where g.All(p => p.UnitsInStock > 0) 
        select new { Category = g.Key, Products = g }; 
     
    ObjectDumper.Write(productGroups, 1); 
}
```
```go
//swift
func linq72(){
    let products = productsList()
    
    let productGroups = products.groupBy { $0.category }
        .find { $0.items.all { p in p.unitsInStock > 0 } }
        .map { g -> (Category:String, Products:Group<String,Product>) in
            (g.key, g)
    }

    productGroups.each { println($0.Products) }
}
```
#### Output

    Confections: [[Product id:16, name:Pavlova, cat:Confections, price:17.45, inStock:29], [Product id:19, name:Teatime Chocolate Biscuits, cat:Confections, price:9.2, inStock:25], [Product id:20, name:Sir Rodney's Marmalade, cat:Confections, price:81.0, inStock:40], [Product id:21, name:Sir Rodney's Scones, cat:Confections, price:10.0, inStock:3], [Product id:25, name:NuNuCa Nuß-Nougat-Creme, cat:Confections, price:14.0, inStock:76], [Product id:26, name:Gumbär Gummibärchen, cat:Confections, price:31.23, inStock:15], [Product id:27, name:Schoggi Schokolade, cat:Confections, price:43.9, inStock:49], [Product id:47, name:Zaanse koeken, cat:Confections, price:9.5, inStock:36], [Product id:48, name:Chocolade, cat:Confections, price:12.75, inStock:15], [Product id:49, name:Maxilaku, cat:Confections, price:20.0, inStock:10], [Product id:50, name:Valkoinen suklaa, cat:Confections, price:16.25, inStock:65], [Product id:62, name:Tarte au sucre, cat:Confections, price:49.3, inStock:17], [Product id:68, name:Scottish Longbreads, cat:Confections, price:12.5, inStock:6]]
    ...


LINQ - Aggregate Operators
--------------------------

### linq73: Count - Simple
```csharp
//c#
public void Linq73() 
{ 
    int[] factorsOf300 = { 2, 2, 3, 5, 5 }; 
  
    int uniqueFactors = factorsOf300.Distinct().Count(); 
  
    Console.WriteLine("There are {0} unique factors of 300.", uniqueFactors); 
}
```
```go
//swift
func linq73(){
    let factorsOf300 = [ 2, 2, 3, 5, 5 ]
    
    let uniqueFactors = distinct(factorsOf300).count
    
    println("There are \(uniqueFactors) unique factors of 300.")
}
```
#### Output

    There are 3 unique factors of 300.

### linq74: Count - Conditional
```csharp
//c#
public void Linq74() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int oddNumbers = numbers.Count(n => n % 2 == 1); 
  
    Console.WriteLine("There are {0} odd numbers in the list.", oddNumbers); 
}
```
```go
//swift
func linq74(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let oddNumbers = numbers.find { $0 % 2 == 1 }.count
    
    println("There are \(oddNumbers) odd numbers in the list.")
}
```
#### Output

    There are 5 odd numbers in the list.

### linq76: Count - Nested
```csharp
//c#
public void Linq76() 
{ 
    List<Customer> customers = GetCustomerList(); 
  
    var orderCounts = 
        from c in customers 
        select new { c.CustomerID, OrderCount = c.Orders.Count() }; 
  
    ObjectDumper.Write(orderCounts); 
}
```
```go
//swift
func linq76(){
    let customers = customersList()
    
    let orderCounts = customers
        .map { c -> (CustomerId:String, OrderCount:Int) in
            (c.customerId, c.orders.count)
    }
    
    orderCounts.each(println)
}
```
#### Output

    (ALFKI, 6)
    (ANATR, 4)
    (ANTON, 7)
    (AROUT, 13)
    (BERGS, 18)
    (BLAUS, 7)
    (BLONP, 11)
    ...

### linq77: Count - Grouped
```csharp
//c#
public void Linq77() 
{ 
    List<Product> products = GetProductList(); 
  
    var categoryCounts = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, ProductCount = g.Count() }; 
  
    ObjectDumper.Write(categoryCounts 
}
```
```go
//swift
func linq77(){
    let products = productsList()
    
    let categoryCounts = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String,ProductCount:Int) in
            (g.key, g.items.count)
    }
    
    categoryCounts.each(println)
}
```
#### Output

    (Confections, 13)
    (Dairy Products, 10)
    (Seafood, 12)
    (Produce, 5)
    (Grains/Cereals, 7)
    (Beverages, 12)
    (Condiments, 12)
    (Meat/Poultry, 6)

### linq78: Sum - Simple
```csharp
//c#
public void Linq78() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    double numSum = numbers.Sum(); 
  
    Console.WriteLine("The sum of the numbers is {0}.", numSum); 
}
```
```go
//swift
func linq78(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let numSum:Int = numbers.sum()
    
    println("The sum of the numbers is \(numSum).")
}
```
#### Output

    The sum of the numbers is 45.

### linq79: Sum - Projection
```csharp
//c#
public void Linq79() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    double totalChars = words.Sum(w => w.Length); 
  
    Console.WriteLine("There are a total of {0} characters in these words.", totalChars); 
}
```
```go
//swift
func linq79(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let totalChars = words.sum { (s:String) in s.length }
    
    println("There are a total of \(totalChars) characters in these words.")
}
```
#### Output

    There are a total of 20 characters in these words.

### linq80: Sum - Grouped
```csharp
//c#
public void Linq80() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, TotalUnitsInStock = g.Sum(p => p.UnitsInStock) }; 
  
    ObjectDumper.Write(categories); 
}
```
```go
//swift
func linq80(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, TotalUnitsInStock:Int) in
            (g.key, g.items.sum { (p:Product) in p.unitsInStock })
    }
    
    categories.each(println)
}
```
#### Output

    (Confections, 386)
    (Dairy Products, 393)
    (Seafood, 701)
    (Produce, 100)
    (Grains/Cereals, 308)
    (Beverages, 559)
    (Condiments, 507)
    (Meat/Poultry, 165)

### linq81: Min - Simple
```csharp
//c#
public void Linq81() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int minNum = numbers.Min(); 
  
    Console.WriteLine("The minimum number is {0}.", minNum); 
}
```
```go
//swift
func linq81(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let minNum:Int = numbers.min()
    
    println("The minimum number is \(minNum).")
}
```
#### Output

    The minimum number is 0.

### linq82: Min - Projection
```csharp
//c#
public void Linq82() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    int shortestWord = words.Min(w => w.Length); 
  
    Console.WriteLine("The shortest word is {0} characters long.", shortestWord); 
}
```
```go
//swift
func linq82(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let shortestWord = words.min { (s:String) in s.length }
    
    println("The shortest word is \(shortestWord) characters long.")
}
```
#### Output

    The shortest word is 5 characters long.

### linq83: Min - Grouped
```csharp
//c#
public void Linq83() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, CheapestPrice = g.Min(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```go
//swift
func linq83(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product)in p.category }
        .map { g -> (Category:String, CheapestPrice:Double) in
            (g.key, g.items.map { (p:Product) in p.unitPrice }.min() )
    }
    
    categories.each(println)
}
```
#### Output

    (Confections, 9.2)
    (Dairy Products, 2.5)
    (Seafood, 6.0)
    (Produce, 10.0)
    (Grains/Cereals, 7.0)
    (Beverages, 4.5)
    (Condiments, 10.0)
    (Meat/Poultry, 7.45)

### linq84: Min - Elements
```csharp
//c#
public void Linq84() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        let minPrice = g.Min(p => p.UnitPrice) 
        select new { Category = g.Key, CheapestProducts = g.Where(p => p.UnitPrice == minPrice) }; 
  
    ObjectDumper.Write(categories, 1); 
}
```
```go
//swift
func linq84(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, CheapestProducts:Product[]) in
            let minPrice:Double = g.items.min { (p:Product) in p.unitPrice }
            return (g.key, g.items.find { $0.unitPrice == minPrice })
    }
    
    categories.each {
        print("\($0.Category): ")
        $0.CheapestProducts.each(println)
    }
}
```
#### Output

    Confections: [Product id:19, name:Teatime Chocolate Biscuits, cat:Confections, price:9.2, inStock:25]
    Dairy Products: [Product id:33, name:Geitost, cat:Dairy Products, price:2.5, inStock:112]
    Seafood: [Product id:13, name:Konbu, cat:Seafood, price:6.0, inStock:24]
    Produce: [Product id:74, name:Longlife Tofu, cat:Produce, price:10.0, inStock:4]
    Grains/Cereals: [Product id:52, name:Filo Mix, cat:Grains/Cereals, price:7.0, inStock:38]
    Beverages: [Product id:24, name:Guaraná Fantástica, cat:Beverages, price:4.5, inStock:20]
    Condiments: [Product id:3, name:Aniseed Syrup, cat:Condiments, price:10.0, inStock:13]
    Meat/Poultry: [Product id:54, name:Tourtière, cat:Meat/Poultry, price:7.45, inStock:21]

### linq85: Max - Simple
```csharp
//c#
public void Linq85() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int maxNum = numbers.Max(); 
  
    Console.WriteLine("The maximum number is {0}.", maxNum); 
}
```
```go
//swift
func linq85(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let maxNum:Int = numbers.max()
    
    println("The maximum number is \(maxNum).")
}
```
#### Output

    The maximum number is 9.

### linq86: Max - Projection
```csharp
//c#
public void Linq86() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    int longestLength = words.Max(w => w.Length); 
  
    Console.WriteLine("The longest word is {0} characters long.", longestLength); 
}
```
```go
//swift
func linq86(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let longestLength:Int = words.map { (s:String) in s.length }.max()
    
    println("The longest word is \(longestLength) characters long.")
}
```
#### Output

    The longest word is 9 characters long.

### linq87: Max - Grouped
```csharp
//c#
public void Linq87() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, MostExpensivePrice = g.Max(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```go
//swift
func linq87(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, MostExpensivePrice:Double) in
            (g.key, g.items.max { (p:Product) in p.unitPrice } )
    }
    
    for c in categories {
        println("Category: \(c.Category), MaximumPrice: \(c.MostExpensivePrice)")
    }
}
```
#### Output

    Category: Confections, MaximumPrice: 81.0
    Category: Dairy Products, MaximumPrice: 55.0
    Category: Seafood, MaximumPrice: 62.5
    Category: Produce, MaximumPrice: 53.0
    Category: Grains/Cereals, MaximumPrice: 38.0
    Category: Beverages, MaximumPrice: 263.5
    Category: Condiments, MaximumPrice: 43.9
    Category: Meat/Poultry, MaximumPrice: 123.79

### linq88: Max - Elements
```csharp
//c#
public void Linq88() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        let maxPrice = g.Max(p => p.UnitPrice) 
        select new { Category = g.Key, MostExpensiveProducts = g.Where(p => p.UnitPrice == maxPrice) }; 
  
    ObjectDumper.Write(categories, 1); 
}
```
```go
//swift
func linq88(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, MostExpensiveProducts:Product[]) in
            let maxPrice:Double = g.items.max { (p:Product) in p.unitPrice }
            return (g.key, g.items.find { $0.unitPrice == maxPrice })
    }
    
    categories.each {
        print("\($0.Category): ")
        $0.MostExpensiveProducts.each(println)
    }
}
```
#### Output

    Confections: [Product id:20, name:Sir Rodney's Marmalade, cat:Confections, price:81.0, inStock:40]
    Dairy Products: [Product id:59, name:Raclette Courdavault, cat:Dairy Products, price:55.0, inStock:79]
    Seafood: [Product id:18, name:Carnarvon Tigers, cat:Seafood, price:62.5, inStock:42]
    Produce: [Product id:51, name:Manjimup Dried Apples, cat:Produce, price:53.0, inStock:20]
    Grains/Cereals: [Product id:56, name:Gnocchi di nonna Alice, cat:Grains/Cereals, price:38.0, inStock:21]
    Beverages: [Product id:38, name:Côte de Blaye, cat:Beverages, price:263.5, inStock:17]
    Condiments: [Product id:63, name:Vegie-spread, cat:Condiments, price:43.9, inStock:24]
    Meat/Poultry: [Product id:29, name:Thüringer Rostbratwurst, cat:Meat/Poultry, price:123.79, inStock:0]

### linq89: Average - Simple
```csharp
//c#
public void Linq89() 
{ 
    int[] numbers = { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    double averageNum = numbers.Average(); 
  
    Console.WriteLine("The average number is {0}.", averageNum); 
}
```
```go
//swift
func linq89(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    let averageNum = numbers.avg { $0 as Int }
    
    println("The average number is \(averageNum).")
}
```
#### Output

    The average number is 4.5.

### linq90: Average - Projection
```csharp
//c#
public void Linq90() 
{ 
    string[] words = { "cherry", "apple", "blueberry" }; 
  
    double averageLength = words.Average(w => w.Length); 
  
    Console.WriteLine("The average word length is {0} characters.", averageLength); 
}
```
```go
//swift
func linq90(){
    let words = [ "cherry", "apple", "blueberry" ]
    
    let averageLength = words.map { $0.length }.avg { $0 as Int }
    
    println("The average word length is \(averageLength) characters.")
}
```
#### Output

    The average word length is 6.66666666666667 characters.

### linq91: Average - Grouped
```csharp
//c#
public void Linq91() 
{ 
    List<Product> products = GetProductList(); 
  
    var categories = 
        from p in products 
        group p by p.Category into g 
        select new { Category = g.Key, AveragePrice = g.Average(p => p.UnitPrice) }; 
  
    ObjectDumper.Write(categories); 
}
```
```go
//swift
func linq91(){
    let products = productsList()
    
    let categories = products.groupBy { (p:Product) in p.category }
        .map { g -> (Category:String, AveragePrice:Double) in
            (g.key, g.items.avg { (p:Product) in p.unitPrice } )
    }
    
    for c in categories {
        println("Category: \(c.Category), AveragePrice: \(c.AveragePrice)")
    }
}
```
#### Output

    Category: Confections, AveragePrice: 25.16
    Category: Dairy Products, AveragePrice: 28.73
    Category: Seafood, AveragePrice: 20.6825
    Category: Produce, AveragePrice: 32.37
    Category: Grains/Cereals, AveragePrice: 20.25
    Category: Beverages, AveragePrice: 37.9791666666667
    Category: Condiments, AveragePrice: 23.0625
    Category: Meat/Poultry, AveragePrice: 54.0066666666667

### linq92: Aggregate - Simple
```csharp
//c#
public void Linq92() 
{ 
    double[] doubles = { 1.7, 2.3, 1.9, 4.1, 2.9 }; 
  
    double product = doubles.Aggregate((runningProduct, nextFactor) => runningProduct * nextFactor); 
  
    Console.WriteLine("Total product of all numbers: {0}", product); 
}
```
```go
//swift
func linq92(){
    let doubles = [ 1.7, 2.3, 1.9, 4.1, 2.9 ]
    
    let product = doubles.reduce(1) { runningProduct, nextFactor in runningProduct * nextFactor }
    
    println("Total product of all numbers: \(product)")
}
```
#### Output

    Total product of all numbers: 88.33081

### linq93: Aggregate - Seed
```csharp
//c#
public void Linq93() 
{ 
    double startBalance = 100.0; 
  
    int[] attemptedWithdrawals = { 20, 10, 40, 50, 10, 70, 30 }; 
  
    double endBalance = 
        attemptedWithdrawals.Aggregate(startBalance, 
            (balance, nextWithdrawal) => 
                ((nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance)); 
  
    Console.WriteLine("Ending balance: {0}", endBalance); 
}
```
```go
//swift
func linq93(){
    let startBalance = 100.0
    
    let attemptedWithdrawals = [ 20, 10, 40, 50, 10, 70, 30 ]
    
    let endBalance = attemptedWithdrawals.map { Double($0) }.reduce(startBalance) {
        balance, nextWithdrawal -> Double in
        (nextWithdrawal <= balance) ? (balance - nextWithdrawal) : balance
    }
    
    println("Ending balance: \(endBalance)")
}
```
#### Output

    Ending balance: 20.0


LINQ - Miscellaneous Operators
------------------------------

### linq94: Concat - 1
```csharp
//c#
public void Linq94() 
{ 
    int[] numbersA = { 0, 2, 4, 5, 6, 8, 9 }; 
    int[] numbersB = { 1, 3, 5, 7, 8 }; 
  
    var allNumbers = numbersA.Concat(numbersB); 
  
    Console.WriteLine("All numbers from both arrays:"); 
    foreach (var n in allNumbers) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq94(){
    let numbersA = [ 0, 2, 4, 5, 6, 8, 9 ]
    let numbersB = [ 1, 3, 5, 7, 8 ]
    
    let allNumbers = numbersA + numbersB
    
    println("All numbers from both arrays:")
    allNumbers.each(println)
}
```
#### Output

    All numbers from both arrays:
    0
    2
    4
    5
    6
    8
    9
    1
    3
    5
    7
    8

### linq95: Concat - 2
```csharp
//c#
public void Linq95() 
{ 
    List<Customer> customers = GetCustomerList(); 
    List<Product> products = GetProductList(); 
  
    var customerNames = 
        from c in customers 
        select c.CompanyName; 
    var productNames = 
        from p in products 
        select p.ProductName; 
  
    var allNames = customerNames.Concat(productNames); 
  
    Console.WriteLine("Customer and product names:"); 
    foreach (var n in allNames) 
    { 
        Console.WriteLine(n); 
    } 
}
```
```go
//swift
func linq95(){
    let customers = customersList()
    let products = productsList()
    
    let customerNames = customers.map { $0.companyName }
    let productNames = products.map { $0.productName }
    
    let allNames = customerNames + productNames
    
    println("Customer and product names:")
    allNames.each(println)
}
```
#### Output

    Customer and product names:
    Alfreds Futterkiste
    Ana Trujillo Emparedados y helados
    Antonio Moreno Taquería
    Around the Horn
    Berglunds snabbköp
    Blauer See Delikatessen
    ...

### linq96: EqualAll - 1
```csharp
//c#
public void Linq96() 
{ 
    var wordsA = new string[] { "cherry", "apple", "blueberry" }; 
    var wordsB = new string[] { "cherry", "apple", "blueberry" }; 
  
    bool match = wordsA.SequenceEqual(wordsB); 
  
    Console.WriteLine("The sequences match: {0}", match); 
}
```
```go
//swift
func linq96(){
    let wordsA = [ "cherry", "apple", "blueberry" ]
    let wordsB = [ "cherry", "apple", "blueberry" ]
    
    let match = wordsA == wordsB
    
    println("The sequences match: \(match)")
}
```
#### Output

    The sequences match: true

### linq97: EqualAll - 2
```csharp
//c#
public void Linq97() 
{ 
    var wordsA = new string[] { "cherry", "apple", "blueberry" }; 
    var wordsB = new string[] { "apple", "blueberry", "cherry" }; 
  
    bool match = wordsA.SequenceEqual(wordsB); 
  
    Console.WriteLine("The sequences match: {0}", match); 
}
```
```go
//swift
func linq97(){
    let wordsA = [ "cherry", "apple", "blueberry" ]
    let wordsB = [ "apple", "blueberry", "cherry" ]
    
    let match = wordsA == wordsB
    
    println("The sequences match: \(match)")
}
```
#### Output

    The sequences match: false

LINQ - Query Execution
----------------------

### linq99: Deferred Execution
```csharp
//c#
public void Linq99() 
{ 
    // Sequence operators form first-class queries that 
    // are not executed until you enumerate over them. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int i = 0; 
    var q = 
        from n in numbers 
        select ++i; 
  
    // Note, the local variable 'i' is not incremented 
    // until each element is evaluated (as a side-effect): 
    foreach (var v in q) 
    { 
        Console.WriteLine("v = {0}, i = {1}", v, i); 
    } 
}
```
```go
//swift
func linq99(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0
    let q = numbers.map { n in { ++i } }
    
    for f in q {
        let v = f()
        println("v = \(v), i = \(i)")
    }
}
```
#### Output

    v = 1, i = 1
    v = 2, i = 2
    v = 3, i = 3
    v = 4, i = 4
    v = 5, i = 5
    v = 6, i = 6
    v = 7, i = 7
    v = 8, i = 8
    v = 9, i = 9
    v = 10, i = 10

### linq100: Immediate Execution
```csharp
//c#
public void Linq100() 
{ 
    // Methods like ToList() cause the query to be 
    // executed immediately, caching the results. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
  
    int i = 0; 
    var q = ( 
        from n in numbers 
        select ++i) 
        .ToList(); 
  
    // The local variable i has already been fully 
    // incremented before we iterate the results: 
    foreach (var v in q) 
    { 
        Console.WriteLine("v = {0}, i = {1}", v, i); 
    } 
} 
```
```go
//swift
func linq100(){
    let numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    
    var i = 0
    var q = numbers.map { n in ++i }
    
    for v in q {
        println("v = \(v), i = \(i)")
    }
}
```
#### Output

    v = 1, i = 10
    v = 2, i = 10
    v = 3, i = 10
    v = 4, i = 10
    v = 5, i = 10
    v = 6, i = 10
    v = 7, i = 10
    v = 8, i = 10
    v = 9, i = 10
    v = 10, i = 10

### linq101: Query Reuse
```csharp
//c#
public void Linq101() 
{ 
    // Deferred execution lets us define a query once 
    // and then reuse it later after data changes. 
  
    int[] numbers = new int[] { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 }; 
    var lowNumbers = 
        from n in numbers 
        where n <= 3 
        select n; 
  
    Console.WriteLine("First run numbers <= 3:"); 
    foreach (int n in lowNumbers) 
    { 
        Console.WriteLine(n); 
    } 
  
    for (int i = 0; i < 10; i++) 
    { 
        numbers[i] = -numbers[i]; 
    } 
  
    // During this second run, the same query object, 
    // lowNumbers, will be iterating over the new state 
    // of numbers[], producing different results: 
    Console.WriteLine("Second run numbers <= 3:"); 
    foreach (int n in lowNumbers) 
    { 
        Console.WriteLine(n); 
    } 
} 
```
```go
//swift
func linq101(){
    var numbers = [ 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 ]
    var lowNumbers = { numbers.find { $0 < 4 } }
    
    println("First run numbers <= 3:")
    lowNumbers().each(println)
    
    for i in 0..10 {
        numbers[i] = -numbers[i]
    }
    
    println("Second run numbers <= 3:")
    lowNumbers().each(println)
}
```
#### Output

    First run numbers <= 3:
    1
    3
    2
    0
    Second run numbers <= 3:
    -5
    -4
    -1
    -3
    -9
    -8
    -6
    -7
    -2
    0


LINQ - Join Operators
---------------------

### linq102: Cross Join
```csharp
//c#
public void Linq102() 
{ 
    string[] categories = new string[]{  
        "Beverages",   
        "Condiments",   
        "Vegetables",   
        "Dairy Products",   
        "Seafood" };  
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category 
        select new { Category = c, p.ProductName }; 
 
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category);  
    } 
}
```
```go
//swift
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
```
#### Output

    Category:Beverages, ProductName:Chai
    Category:Beverages, ProductName:Chang
    Category:Beverages, ProductName:Guaraná Fantástica
    Category:Beverages, ProductName:Sasquatch Ale
    Category:Beverages, ProductName:Steeleye Stout
    Category:Beverages, ProductName:Côte de Blaye
    Category:Beverages, ProductName:Chartreuse verte
    Category:Beverages, ProductName:Ipoh Coffee
    ...

### linq103: Group Join
```csharp
//c#
public void Linq103() 
{ 
    string[] categories = new string[]{  
        "Beverages",  
        "Condiments",  
        "Vegetables",  
        "Dairy Products",  
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        select new { Category = c, Products = ps }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.Category + ":"); 
        foreach (var p in v.Products) 
        { 
            Console.WriteLine("   " + p.ProductName); 
        } 
    } 
}
```
```go
//swift
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
```
#### Output

    Beverages:
       Chai
       Chang
       Guaraná Fantástica
       Sasquatch Ale
       Steeleye Stout
       Côte de Blaye
       Chartreuse verte
       Ipoh Coffee
       Laughing Lumberjack Lager
       Outback Lager
       Rhönbräu Klosterbier
       Lakkalikööri
    Condiments:
       Aniseed Syrup
       Chef Anton's Cajun Seasoning
       Chef Anton's Gumbo Mix
       Grandma's Boysenberry Spread
       Northwoods Cranberry Sauce
       Genen Shouyu
       Gula Malacca
       Sirop d'érable
       Vegie-spread
       Louisiana Fiery Hot Pepper Sauce
       Louisiana Hot Spiced Okra
       Original Frankfurter grüne Soße
    ...

### linq104: Cross Join with Group Join
```csharp
//c#
public void Linq104() 
{ 
    string[] categories = new string[]{   
        "Beverages",  
        "Condiments",  
        "Vegetables", 
        "Dairy Products",   
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        from p in ps 
        select new { Category = c, p.ProductName }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category); 
    } 
}
```
```go
//swift
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
```
#### Output

    Chai: Beverages
    Chang: Beverages
    Guaraná Fantástica: Beverages
    Sasquatch Ale: Beverages
    Steeleye Stout: Beverages
    Côte de Blaye: Beverages
    Chartreuse verte: Beverages
    Ipoh Coffee: Beverages
    Laughing Lumberjack Lager: Beverages
    Outback Lager: Beverages
    Rhönbräu Klosterbier: Beverages
    Lakkalikööri: Beverages
    Aniseed Syrup: Condiments
    Chef Anton's Cajun Seasoning: Condiments
    Chef Anton's Gumbo Mix: Condiments
    ...

### linq105: Left Outer Join
```csharp
//c#
public void Linq105()  
{ 
    string[] categories = new string[]{   
        "Beverages",  
        "Condiments",   
        "Vegetables",   
        "Dairy Products",  
        "Seafood" }; 
  
    List<Product> products = GetProductList(); 
  
    var q = 
        from c in categories 
        join p in products on c equals p.Category into ps 
        from p in ps.DefaultIfEmpty() 
        select new { Category = c, ProductName = p == null ? "(No products)" : p.ProductName }; 
  
    foreach (var v in q) 
    { 
        Console.WriteLine(v.ProductName + ": " + v.Category); 
    } 
}
```
```go
//swift
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
```
#### Output

    Chai: Beverages
    Chang: Beverages
    Guaraná Fantástica: Beverages
    Sasquatch Ale: Beverages
    Steeleye Stout: Beverages
    Côte de Blaye: Beverages
    Chartreuse verte: Beverages
    Ipoh Coffee: Beverages
    Laughing Lumberjack Lager: Beverages
    Outback Lager: Beverages
    Rhönbräu Klosterbier: Beverages
    Lakkalikööri: Beverages
    Aniseed Syrup: Condiments
    Chef Anton's Cajun Seasoning: Condiments
    Chef Anton's Gumbo Mix: Condiments
    Grandma's Boysenberry Spread: Condiments
    Northwoods Cranberry Sauce: Condiments
    Genen Shouyu: Condiments
    Gula Malacca: Condiments
    Sirop d'érable: Condiments
    Vegie-spread: Condiments
    Louisiana Fiery Hot Pepper Sauce: Condiments
    Louisiana Hot Spiced Okra: Condiments
    Original Frankfurter grüne Soße: Condiments
    (No products): Vegetables
    ...


### Contributors

  - [mythz](https://github.com/mythz) (Demis Bellot)

