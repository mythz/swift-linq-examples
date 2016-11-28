//
//  extensions.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

//Reusable extensions and utils used in examples

extension Collection
{    
    func toArray() -> [Self.Iterator.Element] {
        return self.map { $0 }
    }
}

extension Array {
    
    func filteri(_ fn: (Element, Int) -> Bool) -> [Element] {
        var to = [Element]()
        var i = 0
        for x in self {
            let t = x as Element
            if fn(t, i) {
                to.append(t)
            }
            i += 1
        }
        return to
    }
    
    func first(_ fn: (Element) -> Bool) -> Element? {
        for x in self {
            let t = x as Element
            if fn(t) {
                return t
            }
        }
        return nil
    }
    
    func first(_ fn: (Element, Int) -> Bool) -> Element? {
        var i = 0
        for x in self {
            let t = x as Element
            i += 1
            if fn(t, i) {
                return t
            }
        }
        return nil
    }
    
    func any(_ fn: (Element) -> Bool) -> Bool {
        return self.filter(fn).count > 0
    }
    
    func all(_ fn: (Element) -> Bool) -> Bool {
        return self.filter(fn).count == self.count
    }
    
    func expand<TResult>(_ fn: (Element) -> [TResult]?) -> [TResult] {
        var to = [TResult]()
        for x in self {
            if let result = fn(x as Element) {
                for r in result {
                    to.append(r)
                }
            }
        }
        return to
    }
    
    func take(_ count:Int) -> [Element] {
        var to = [Element]()
        var i = 0
        while i < self.count && i < count {
            i += 1
            to.append(self[i])
        }
        return to
    }
    
    func skip(_ count:Int) -> [Element] {
        var to = [Element]()
        var i = count
        while i < self.count {
            to.append(self[i])
            i += 1
        }
        return to
    }
    
    func takeWhile(_ fn: (Element) -> Bool) -> [Element] {
        var to = [Element]()
        for x in self {
            let t = x as Element
            if fn(t) {
                to.append(t)
            }
            else {
                break
            }
        }
        return to
    }
    
    func skipWhile(_ fn: (Element) -> Bool) -> [Element] {
        var to = [Element]()
        var keepSkipping = true
        for x in self {
            let t = x as Element
            if !fn(t) {
                keepSkipping = false
            }
            if !keepSkipping {
                to.append(t)
            }
        }
        return to
    }
    
    func firstWhere(_ fn: (Element) -> Bool) -> Element? {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return nil
    }
    
    func firstWhere(_ fn: (Element) -> Bool, orElse: () -> Element) -> Element {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return orElse()
    }
    
    func sortBy(_ fns: ((Element,Element) -> Int)...) -> [Element]
    {
        return self.sorted { x, y in
            for f in fns {
                let r = f(x,y)
                if r != 0 {
                    return r > 0
                }
            }
            return false
        }
    }
    
    func groupBy<Key : Hashable, Item>(_ fn:(Item) -> Key) -> [Group<Key,Item>] {
        return self.groupBy(fn, matchWith: nil, valueAs: nil)
    }
    
    func groupBy<Key : Hashable, Item>(_ fn:(Item) -> Key, matchWith:((Key,Key) -> Bool)?) -> [Group<Key,Item>] {
        return self.groupBy(fn, matchWith: matchWith, valueAs: nil)
    }
    
    func groupBy<Key : Hashable, Item>
        (
        _ fn:        (Item) -> Key,
        matchWith: ((Key,Key) -> Bool)?,
        valueAs:   ((Item) -> Item)?
        )
        -> [Group<Key,Item>]
    {
        var map = Dictionary<Key, Group<Key,Item>>()
        for x in self {
            var e = x as! Item
            let val = fn(e)
            
            var key = val as Key
            
            if (matchWith != nil) {
                for k in map.keys {
                    if matchWith!(val, k) {
                        key = k
                        break
                    }
                }
            }
            
            if (valueAs != nil) {
                e = valueAs!(e)
            }
            
            var group = map[key] != nil ? map[key]! : Group<Key,Item>(key:key)
            group.append(e)
            map[key] = group //always copy back struct
        }
        
        return map.values.map { $0 as Group<Key,Item> }
    }
    
    func indexOf<T : Equatable>(_ x:T) -> Int? {
        for i in 0..<self.count {
            if self[i] as! T == x {
                return i
            }
        }
        return nil
    }
    
    func toDictionary<Key : Hashable, Item>(_ fn:(Item) -> Key) -> Dictionary<Key,Item> {
        var to = Dictionary<Key,Item>()
        for x in self {
            let e = x as! Item
            let key = fn(e)
            to[key] = e
        }
        return to
    }

    
    func sum<T : Addable>() -> T
    {
        return self.map { $0 as! T }.reduce(T()) { $0 + $1 }
    }
    
    func sum<U, T : Addable>(_ fn: (U) -> T) -> T {
        return self.map { fn($0 as! U) }.reduce(T()) { $0 + $1 }
    }
    
    func minElement<U, T : Reducable>(_ fn: (U) -> T) -> T {
        return self.map { fn($0 as! U) }.reduce(T.max()) { $0 < $1 ? $0 : $1 }
    }
    
    func maxElement<U, T : Reducable>(_ fn: (U) -> T) -> T {
        return self.map { fn($0 as! U) }.reduce(T()) { $0 > $1 ? $0 : $1 }
    }
    
    func avg<U, T : Averagable>(_ fn: (U) -> T) -> Double {
        return self.map { fn($0 as! U) }.reduce(T()) { $0 + $1 } / self.count
    }
}

extension Array where Element : Averagable
{
    func avg() -> Double
    {
        return self.reduce(Element()) { $0 + $1 } / self.count
    }
}


protocol Addable {
    static func +(lhs: Self, rhs: Self) -> Self
    init()
}

protocol Reducable : Addable, Averagable, Comparable {
    static func max() -> Self
}

protocol Averagable : Addable {
    static func /(lhs: Self, rhs: Int) -> Double
}

extension Int : Reducable {
    static func max() -> Int {
        return Int.max
    }
}

extension Double : Reducable {
    static func max() -> Double {
        return Double(Int.max)
    }
}

func /(lhs: Int, rhs: Int) -> Double {
    return Double(lhs) / Double(rhs)
}

func /(lhs: Double, rhs: Int) -> Double {
    return lhs / Double(rhs)
}


func distinct<T : Equatable>(_ this:[T]) -> [T] {
    return union(this)
}

func union<T : Equatable>(_ arrays:[T]...) -> [T] {
    return _union(arrays)
}

func _union<T : Equatable>(_ arrays:[[T]]) -> [T] {
    var to = [T]()
    for arr in arrays {
        outer: for x in arr {
            let e = x as T
            for y in to {
                if y == e {
                    continue outer
                }
            }
            to.append(e)
        }
    }
    return to
}

func intersection<T : Equatable>(_ arrays:[T]...) -> [T] {
    let all: [T] = _union(arrays)
    var to = [T]()
    
    for x in all {
        var count = 0
        let e = x as T
        outer: for arr in arrays {
            for y in arr {
                if y == e {
                    count += 1
                    continue outer
                }
            }
        }
        if count == arrays.count {
            to.append(e)
        }
    }
    
    return to
}

func difference<T : Equatable>(_ from:[T], other:[T]...) -> [T] {
    var to = [T]()
    for arr in other {
        for x in from {
            if !arr.contains(x) && !to.contains(x) {
                to.append(x)
            }
        }
    }
    return to
}

// How for-in uses Sequences:
//   var g = seq.generate()
//   while let x = g.next() { .. }
//
//Generic classes not supported yet? Crashes XCode
struct Group<Key,Item> : Sequence, CustomStringConvertible {
    let key: Key
    var items = [Item]()
    
    init(key:Key) {
        self.key = key
    }
    
    mutating func append(_ item: Item) {
        items.append(item)
    }
    
    func makeIterator() -> IndexingIterator<[Item]> {
        return items.makeIterator()
    }
    
    var description: String {
    var s = ""
        for x in items {
            if s.length > 0 {
                s += ", "
            }
            s += "\(x)"
        }
        return "\(key): [\(s)]\n"
    }
}

func join<T,U>(_ seq:[T], withSeq:[U], match:(T,U)->Bool) -> [(T,U)] {
    return seq.expand { (x:T) in
        withSeq
            .filter { y in match(x,y) }
            .map { y in (x,y) }
    }
}

func joinGroup<T : Hashable,U>(_ seq:[T], withSeq:[U], match:(T,U)->Bool) -> [Group<T,(T,U)>] {
    return join(seq, withSeq: withSeq, match: match).groupBy { x -> T in
        let (t,_) = x
        return t
    }
}

func anagramComparer(_ a:String, b:String) -> Bool {
    let aChars = Array(a.utf8CString)
    let bChars = Array(b.utf8CString)
    return aChars.sorted() == bChars.sorted()
}

func caseInsensitiveComparer (_ a:String,b:String) -> Bool {
    return a.uppercased().compare(b.uppercased()) == .orderedAscending
}

func compareIgnoreCase (_ a:String, _ b:String) -> Int {
    switch a.uppercased().compare(b.uppercased()) {
    case .orderedAscending:
        return 1
    case .orderedSame:
        return 0
    case .orderedDescending:
        return -1
    }
}

func compare<T : Comparable>(_ a:T, _ b:T) -> Int {
    return a == b
        ? 0
        : a > b ? -1 : 1
}

extension String {
    var length: Int { return self.characters.count }
    
    func contains(_ s:String) -> Bool {
        return (self as NSString).contains(s)
    }
    
    func charAt(_ index:Int) -> String {
        let c = (self as NSString).character(at: index)
        let s = NSString(format:"%c",c)
        return s as String
    }
    
    func trim() -> String {
        return (self as String).trimmingCharacters(in: CharacterSet.whitespaces)
    }
}

extension Date {
    
    init(dateString:String, format:String="yyyy-MM-dd") {
        let fmt = DateFormatter()
        fmt.timeZone = TimeZone.current
        fmt.dateFormat = format
        let d = fmt.date(from: dateString)
        self.init(timeInterval:0, since:d!)
    }
    
    init(year:Int, month:Int, day:Int) {
        var c = DateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        let gregorian = Calendar(identifier:Calendar.Identifier.gregorian)
        let d = gregorian.date(from: c)!
        self.init(timeInterval:0, since:d)
    }
    
    func components() -> DateComponents {
        let compnents = (Calendar.current as NSCalendar).components([.year, .month, .day], from: self)
        return compnents
    }
    
    var year:Int {
        return components().year!
    }
    var month:Int {
        return components().month!
    }
    var day:Int {
        return components().day!
    }
    
    func shortDateString() -> String {
        let fmt = DateFormatter()
        fmt.timeZone = TimeZone.current
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.string(from: self)
    }

    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: self)
    }
}

