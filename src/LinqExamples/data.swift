//
//  data.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
// 

import Foundation


class Product : CustomStringConvertible {
    let productId : Int
    let productName : String
    let category : String
    let unitPrice : Double
    let unitsInStock : Int
    
    init(id: Int, name: String, category: String, unitPrice: Double, unitsInStock: Int) {
        productId = id
        productName = name
        self.category = category
        self.unitPrice = unitPrice
        self.unitsInStock = unitsInStock
    }
    
    var description: String {
        return "[Product id:\(productId), " +
            "name:\(productName), " +
            "cat:\(category), " +
            "price:\(unitPrice), " +
            "inStock:\(unitsInStock)]"
    }
    
    class var type : Product {
        return Product(id: 0,name: "name",category: "category",unitPrice: 0.0, unitsInStock: 0)
    }
}

//Avoid repitition of naming properties
func newProduct(_ id: Int, name: String, category: String, unitPrice: Double, unitsInStock: Int) -> Product {
    return Product(id: id, name: name, category: category, unitPrice: unitPrice, unitsInStock: unitsInStock)
}

class Order : CustomStringConvertible
{
    let orderId: Int
    let orderDate: Date?
    let total: Double
    
    init(orderId: Int, orderDate: Date?, total: Double){
        self.orderId = orderId
        self.orderDate = orderDate
        self.total = total
    }
    
    var description: String {
        return "[Order id:\(orderId), total:\(total)]"
    }
}

class Customer : CustomStringConvertible
{
    let customerId: String
    let companyName: String
    let address: String
    let city: String
    let region: String?
    let postalCode: String?
    let country: String?
    let phone: String?
    let fax: String?
    let orders: [Order]
    
    init(customerId: String, companyName: String,
         address: String, city: String, region: String?, postalCode: String?, country: String?,
         phone: String?, fax: String?, orders: [Order])
    {
        self.customerId = customerId
        self.companyName = companyName
        self.address = address
        self.city = city
        self.region = region
        self.postalCode = postalCode
        self.country = country
        self.phone = phone
        self.fax = fax
        self.orders = orders
    }
    
    var description: String {
        return "[Customer id:\(customerId), name:\(companyName), orders:\(orders.count)]"
    }
}


func productsList() -> [Product] {
    let products = [
        newProduct(1, name: "Chai", category: "Beverages", unitPrice: 18.000, unitsInStock: 39),
        newProduct(2, name: "Chang", category: "Beverages", unitPrice: 19.000, unitsInStock: 17),
        newProduct(3, name: "Aniseed Syrup", category: "Condiments", unitPrice: 10.000, unitsInStock: 13),
        newProduct(4, name: "Chef Anton's Cajun Seasoning", category: "Condiments", unitPrice: 22.000, unitsInStock: 53),
        newProduct(5, name: "Chef Anton's Gumbo Mix", category: "Condiments", unitPrice: 21.350, unitsInStock: 0),
        newProduct(6, name: "Grandma's Boysenberry Spread", category: "Condiments", unitPrice: 25.000, unitsInStock: 120),
        newProduct(7, name: "Uncle Bob's Organic Dried Pears", category: "Produce", unitPrice: 30.000, unitsInStock: 15),
        newProduct(8, name: "Northwoods Cranberry Sauce", category: "Condiments", unitPrice: 40.000, unitsInStock: 6),
        newProduct(9, name: "Mishi Kobe Niku", category: "Meat/Poultry", unitPrice: 97.000, unitsInStock: 29),
        newProduct(10, name: "Ikura", category: "Seafood", unitPrice: 31.000, unitsInStock: 31),
        newProduct(11, name: "Queso Cabrales", category: "Dairy Products", unitPrice: 21.000, unitsInStock: 22),
        newProduct(12, name: "Queso Manchego La Pastora", category: "Dairy Products", unitPrice: 38.000, unitsInStock: 86),
        newProduct(13, name: "Konbu", category: "Seafood", unitPrice: 6.000, unitsInStock: 24),
        newProduct(14, name: "Tofu", category: "Produce", unitPrice: 23.250, unitsInStock: 35),
        newProduct(15, name: "Genen Shouyu", category: "Condiments", unitPrice: 15.500, unitsInStock: 39),
        newProduct(16, name: "Pavlova", category: "Confections", unitPrice: 17.450, unitsInStock: 29),
        newProduct(17, name: "Alice Mutton", category: "Meat/Poultry", unitPrice: 39.000, unitsInStock: 0),
        newProduct(18, name: "Carnarvon Tigers", category: "Seafood", unitPrice: 62.500, unitsInStock: 42),
        newProduct(19, name: "Teatime Chocolate Biscuits", category: "Confections", unitPrice: 9.200, unitsInStock: 25),
        newProduct(20, name: "Sir Rodney's Marmalade", category: "Confections", unitPrice: 81.000, unitsInStock: 40),
        newProduct(21, name: "Sir Rodney's Scones", category: "Confections", unitPrice: 10.000, unitsInStock: 3),
        newProduct(22, name: "Gustaf's Knäckebröd", category: "Grains/Cereals", unitPrice: 21.000, unitsInStock: 104),
        newProduct(23, name: "Tunnbröd", category: "Grains/Cereals", unitPrice: 9.000, unitsInStock: 61),
        newProduct(24, name: "Guaraná Fantástica", category: "Beverages", unitPrice: 4.500, unitsInStock: 20),
        newProduct(25, name: "NuNuCa Nuß-Nougat-Creme", category: "Confections", unitPrice: 14.000, unitsInStock: 76),
        newProduct(26, name: "Gumbär Gummibärchen", category: "Confections", unitPrice: 31.230, unitsInStock: 15),
        newProduct(27, name: "Schoggi Schokolade", category: "Confections", unitPrice: 43.900, unitsInStock: 49),
        newProduct(28, name: "Rössle Sauerkraut", category: "Produce", unitPrice: 45.600, unitsInStock: 26),
        newProduct(29, name: "Thüringer Rostbratwurst", category: "Meat/Poultry", unitPrice: 123.790, unitsInStock: 0),
        newProduct(30, name: "Nord-Ost Matjeshering", category: "Seafood", unitPrice: 25.890, unitsInStock: 10),
        newProduct(31, name: "Gorgonzola Telino", category: "Dairy Products", unitPrice: 12.500, unitsInStock: 0),
        newProduct(32, name: "Mascarpone Fabioli", category: "Dairy Products", unitPrice: 32.000, unitsInStock: 9),
        newProduct(33, name: "Geitost", category: "Dairy Products", unitPrice: 2.500, unitsInStock: 112),
        newProduct(34, name: "Sasquatch Ale", category: "Beverages", unitPrice: 14.000, unitsInStock: 111),
        newProduct(35, name: "Steeleye Stout", category: "Beverages", unitPrice: 18.000, unitsInStock: 20),
        newProduct(36, name: "Inlagd Sill", category: "Seafood", unitPrice: 19.000, unitsInStock: 112),
        newProduct(37, name: "Gravad lax", category: "Seafood", unitPrice: 26.000, unitsInStock: 11),
        newProduct(38, name: "Côte de Blaye", category: "Beverages", unitPrice: 263.500, unitsInStock: 17),
        newProduct(39, name: "Chartreuse verte", category: "Beverages", unitPrice: 18.000, unitsInStock: 69),
        newProduct(40, name: "Boston Crab Meat", category: "Seafood", unitPrice: 18.400, unitsInStock: 123),
        newProduct(41, name: "Jack's New England Clam Chowder", category: "Seafood", unitPrice: 9.650, unitsInStock: 85),
        newProduct(42, name: "Singaporean Hokkien Fried Mee", category: "Grains/Cereals", unitPrice: 14.000, unitsInStock: 26),
        newProduct(43, name: "Ipoh Coffee", category: "Beverages", unitPrice: 46.000, unitsInStock: 17),
        newProduct(44, name: "Gula Malacca", category: "Condiments", unitPrice: 19.450, unitsInStock: 27),
        newProduct(45, name: "Rogede sild", category: "Seafood", unitPrice: 9.500, unitsInStock: 5),
        newProduct(46, name: "Spegesild", category: "Seafood", unitPrice: 12.000, unitsInStock: 95),
        newProduct(47, name: "Zaanse koeken", category: "Confections", unitPrice: 9.500, unitsInStock: 36),
        newProduct(48, name: "Chocolade", category: "Confections", unitPrice: 12.750, unitsInStock: 15),
        newProduct(49, name: "Maxilaku", category: "Confections", unitPrice: 20.000, unitsInStock: 10),
        newProduct(50, name: "Valkoinen suklaa", category: "Confections", unitPrice: 16.250, unitsInStock: 65),
        newProduct(51, name: "Manjimup Dried Apples", category: "Produce", unitPrice: 53.000, unitsInStock: 20),
        newProduct(52, name: "Filo Mix", category: "Grains/Cereals", unitPrice: 7.000, unitsInStock: 38),
        newProduct(53, name: "Perth Pasties", category: "Meat/Poultry", unitPrice: 32.800, unitsInStock: 0),
        newProduct(54, name: "Tourtière", category: "Meat/Poultry", unitPrice: 7.450, unitsInStock: 21),
        newProduct(55, name: "Pâté chinois", category: "Meat/Poultry", unitPrice: 24.000, unitsInStock: 115),
        newProduct(56, name: "Gnocchi di nonna Alice", category: "Grains/Cereals", unitPrice: 38.000, unitsInStock: 21),
        newProduct(57, name: "Ravioli Angelo", category: "Grains/Cereals", unitPrice: 19.500, unitsInStock: 36),
        newProduct(58, name: "Escargots de Bourgogne", category: "Seafood", unitPrice: 13.250, unitsInStock: 62),
        newProduct(59, name: "Raclette Courdavault", category: "Dairy Products", unitPrice: 55.000, unitsInStock: 79),
        newProduct(60, name: "Camembert Pierrot", category: "Dairy Products", unitPrice: 34.000, unitsInStock: 19),
        newProduct(61, name: "Sirop d'érable", category: "Condiments", unitPrice: 28.500, unitsInStock: 113),
        newProduct(62, name: "Tarte au sucre", category: "Confections", unitPrice: 49.300, unitsInStock: 17),
        newProduct(63, name: "Vegie-spread", category: "Condiments", unitPrice: 43.900, unitsInStock: 24),
        newProduct(64, name: "Wimmers gute Semmelknödel", category: "Grains/Cereals", unitPrice: 33.250, unitsInStock: 22),
        newProduct(65, name: "Louisiana Fiery Hot Pepper Sauce", category: "Condiments", unitPrice: 21.050, unitsInStock: 76),
        newProduct(66, name: "Louisiana Hot Spiced Okra", category: "Condiments", unitPrice: 17.000, unitsInStock: 4),
        newProduct(67, name: "Laughing Lumberjack Lager", category: "Beverages", unitPrice: 14.000, unitsInStock: 52),
        newProduct(68, name: "Scottish Longbreads", category: "Confections", unitPrice: 12.500, unitsInStock: 6),
        newProduct(69, name: "Gudbrandsdalsost", category: "Dairy Products", unitPrice: 36.000, unitsInStock: 26),
        newProduct(70, name: "Outback Lager", category: "Beverages", unitPrice: 15.000, unitsInStock: 15),
        newProduct(71, name: "Flotemysost", category: "Dairy Products", unitPrice: 21.500, unitsInStock: 26),
        newProduct(72, name: "Mozzarella di Giovanni", category: "Dairy Products", unitPrice: 34.800, unitsInStock: 14),
        newProduct(73, name: "Röd Kaviar", category: "Seafood", unitPrice: 15.000, unitsInStock: 101),
        newProduct(74, name: "Longlife Tofu", category: "Produce", unitPrice: 10.000, unitsInStock: 4),
        newProduct(75, name: "Rhönbräu Klosterbier", category: "Beverages", unitPrice: 7.750, unitsInStock: 125),
        newProduct(76, name: "Lakkalikööri", category: "Beverages", unitPrice: 18.000, unitsInStock: 57),
        newProduct(77, name: "Original Frankfurter grüne Soße", category: "Condiments", unitPrice: 13.000, unitsInStock: 32)
    ]
    return products
}

var customers : [Customer]?

func customersList() -> [Customer] {
    if customers != nil {
        return customers!
    }
    
    let files = FileManager.default
    let jsonData = files.contents(atPath: Bundle.main.path(forResource: "customers", ofType: "json")!)
    var rawCustomers:NSDictionary
    do {
        rawCustomers = try JSONSerialization.jsonObject(with: jsonData!, options:[]) as! NSDictionary
    } catch {
        return []
    }
    let customersArray = rawCustomers["customers"] as! NSArray
    let fmt = NumberFormatter()

    var to = Array<Customer>()
    for o : Any in customersArray {
        let c = o as! NSDictionary

        func str(_ key: String) -> String? {
            if let s = c[key] as? NSString {
                return String(s)
            }
            return nil
        }

        func createOrders(_ orders: NSArray?) -> [Order] {
            var to = [Order]()
            if orders != nil {
                for o: Any in orders! {
                    let m = o as! NSDictionary
                    var orderDate: Date?
                    if let dateStr : Any = m["orderdate"] {
                        orderDate = Date(dateString:dateStr as! String, format: "yyyy-MM-dd'T'HH:mm:ss")
                    }
                    to.append(Order(
                        orderId:fmt.number(from: m["id"] as! String)!.intValue,
                        orderDate:orderDate,
                        total:fmt.number(from: m["total"] as! String)!.doubleValue))
                }
            }
            return to
        }
        
        to.append(Customer(
            customerId: str("id")!,
            companyName: str("name")!,
            address: str("address")!,
            city: str("city")!,
            region: str("region"),
            postalCode: str("postalCode"),
            country: str("country"),
            phone: str("phone"),
            fax: str("fax"),
            orders: createOrders((c["orders"] as! NSDictionary?)?["order"] as? NSArray)
            ))
    }
    
    customers = to
    return to
}

