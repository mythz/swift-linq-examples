//
//  extensions.swift
//  LinqExamples
//
//  Created by Demis Bellot on 6/6/14.
//  Copyright (c) 2014 ServiceStack LLC. All rights reserved.
//

import Foundation

//Reusable extensions and utils used in examples

extension Array {
    func each(fn: (T) -> ()) {
        for i in self {
            fn(i)
        }
    }
    
    func find(fn: (T) -> Bool) -> [T] {
        var to = [T]()
        for x in self {
            let t = x as T
            if fn(t) {
                to += t
            }
        }
        return to
    }
    
    func find(fn: (T, Int) -> Bool) -> [T] {
        var to = [T]()
        var i = 0
        for x in self {
            let t = x as T
            if fn(t, i++) {
                to += t
            }
        }
        return to
    }
    
    func first(fn: (T) -> Bool) -> T? {
        for x in self {
            let t = x as T
            if fn(t) {
                return t
            }
        }
        return nil
    }
    
    func first(fn: (T, Int) -> Bool) -> T? {
        var i = 0
        for x in self {
            let t = x as T
            if fn(t, i++) {
                return t
            }
        }
        return nil
    }
    
    func any(fn: (T) -> Bool) -> Bool {
        return self.find(fn).count > 0
    }
    
    func all(fn: (T) -> Bool) -> Bool {
        return self.find(fn).count == self.count
    }
    
    func expand<TResult>(fn: (T) -> [TResult]?) -> [TResult] {
        var to = [TResult]()
        for x in self {
            if let result = fn(x as T) {
                for r in result {
                    to += r
                }
            }
        }
        return to
    }
    
    func take(count:Int) -> [T] {
        var to = [T]()
        var i = 0
        while i < self.count && i < count {
            to += self[i++]
        }
        return to
    }
    
    func skip(count:Int) -> [T] {
        var to = [T]()
        var i = count
        while i < self.count {
            to += self[i++]
        }
        return to
    }
    
    func takeWhile(fn: (T) -> Bool) -> [T] {
        var to = [T]()
        for x in self {
            let t = x as T
            if fn(t) {
                to += t
            }
            else {
                break
            }
        }
        return to
    }
    
    func skipWhile(fn: (T) -> Bool) -> [T] {
        var to = [T]()
        var keepSkipping = true
        for x in self {
            let t = x as T
            if !fn(t) {
                keepSkipping = false
            }
            if !keepSkipping {
                to += t
            }
        }
        return to
    }
    
    func firstWhere(fn: (T) -> Bool) -> T? {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return nil
    }
    
    func firstWhere(fn: (T) -> Bool, orElse: () -> T) -> T {
        for x in self {
            if fn(x) {
                return x
            }
        }
        return orElse()
    }
    
    func sortBy(fns: ((T,T) -> Int)...) -> [T]
    {
        var items = self.copy()
        items.sort { x, y in
            for f in fns {
                let r = f(x,y)
                if r != 0 {
                    return r > 0
                }
            }
            return false
        }
        return items
    }
    
    func groupBy<Key : Hashable, Item>(fn:(Item) -> Key) -> [Group<Key,Item>] {
        return self.groupBy(fn, nil, nil)
    }
    
    func groupBy<Key : Hashable, Item>(fn:(Item) -> Key, matchWith:((Key,Key) -> Bool)?) -> [Group<Key,Item>] {
        return self.groupBy(fn, matchWith, nil)
    }
    
    func groupBy<Key : Hashable, Item>
        (
        fn:        (Item) -> Key,
        matchWith: ((Key,Key) -> Bool)?,
        valueAs:   (Item -> Item)?
        )
        -> [Group<Key,Item>]
    {
        var ret = [Item]()
        var map = Dictionary<Key, Group<Key,Item>>()
        for x in self {
            var e = x as Item
            let val = fn(e)
            
            var key = val as Key
            
            if matchWith {
                for k in map.keys {
                    if matchWith!(val, k) {
                        key = k
                        break
                    }
                }
            }
            
            if valueAs {
                e = valueAs!(e)
            }
            
            var group = map[key] ? map[key]! : Group<Key,Item>(key:key)
            group.append(e)
            map[key] = group //always copy back struct
        }
        
        return map.values.map { $0 as Group<Key,Item> }
    }
    
    func contains<T : Equatable>(x:T) -> Bool {
        return self.indexOf(x) != nil
    }
    
    func indexOf<T : Equatable>(x:T) -> Int? {
        for i in 0..<self.count {
            if self[i] as T == x {
                return i
            }
        }
        return nil
    }
    
    func toDictionary<Key : Hashable, Item>(fn:Item -> Key) -> Dictionary<Key,Item> {
        var to = Dictionary<Key,Item>()
        for x in self {
            let e = x as Item
            let key = fn(e)
            to[key] = e
        }
        return to
    }
    
    func sum<T : Addable>() -> T
    {
        return self.map { $0 as T }.reduce(T()) { $0 + $1 }
    }
    
    func sum<U, T : Addable>(fn: (U) -> T) -> T {
        return self.map { fn($0 as U) }.reduce(T()) { $0 + $1 }
    }
    
    func min<T : Reducable>() -> T {
        return self.map { $0 as T }.reduce(T.max()) { $0 < $1 ? $0 : $1 }
    }
    
    func min<U, T : Reducable>(fn: (U) -> T) -> T {
        return self.map { fn($0 as U) }.reduce(T.max()) { $0 < $1 ? $0 : $1 }
    }
    
    func max<T : Reducable>() -> T {
        return self.map { $0 as T }.reduce(T()) { $0 > $1 ? $0 : $1 }
    }
    
    func max<U, T : Reducable>(fn: (U) -> T) -> T {
        return self.map { fn($0 as U) }.reduce(T()) { $0 > $1 ? $0 : $1 }
    }
    
    func avg<T : Averagable>() -> Double
    {
        return self.map { $0 as T }.reduce(T()) { $0 + $1 } / self.count
    }
    
    func avg<U, T : Averagable>(fn: (U) -> T) -> Double {
        return self.map { fn($0 as U) }.reduce(T()) { $0 + $1 } / self.count
    }
}

protocol Addable {
    func +(lhs: Self, rhs: Self) -> Self
    init()
}

protocol Reducable : Addable, Averagable, Comparable {
    class func max() -> Self
}

protocol Averagable : Addable {
    func /(lhs: Self, rhs: Int) -> Double
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


func distinct<T : Equatable>(this:[T]) -> [T] {
    return union(this)
}

func union<T : Equatable>(arrays:[T]...) -> [T] {
    return _union(arrays)
}

func _union<T : Equatable>(arrays:[[T]]) -> [T] {
    var to = [T]()
    for arr in arrays {
        outer: for x in arr {
            let e = x as T
            for y in to {
                if y == e {
                    continue outer
                }
            }
            to += e
        }
    }
    return to
}

func intersection<T : Equatable>(arrays:[T]...) -> [T] {
    var all: [T] = _union(arrays)
    var to = [T]()
    
    for x in all {
        var count = 0
        let e = x as T
        outer: for arr in arrays {
            for y in arr {
                if y == e {
                    count++
                    continue outer
                }
            }
        }
        if count == arrays.count {
            to += e
        }
    }
    
    return to
}

func difference<T : Equatable>(from:[T], other:[T]...) -> [T] {
    var to = [T]()
    for arr in other {
        for x in from {
            if !arr.contains(x) && !to.contains(x) {
                to += x
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
struct Group<Key,Item> : Sequence, Printable {
    let key: Key
    var items = [Item]()
    
    init(key:Key) {
        self.key = key
    }
    
    mutating func append(item: Item) {
        items.append(item)
    }
    
    func generate() -> IndexingGenerator<[Item]> {
        return items.generate()
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

func join<T,U>(seq:[T], withSeq:[U], match:(T,U)->Bool) -> [(T,U)] {
    return seq.expand { (x:T) in
        withSeq
            .find { y in match(x,y) }
            .map { y in (x,y) }
    }
}

func joinGroup<T : Hashable,U>(seq:[T], withSeq:[U], match:(T,U)->Bool) -> [Group<T,(T,U)>] {
    return join(seq, withSeq, match).groupBy { x -> T in
        let (t,u) = x
        return t
    }
}

func anagramComparer(a:String, b:String) -> Bool {
    let aChars = Array(a.nulTerminatedUTF8)
    let bChars = Array(b.nulTerminatedUTF8)
    sort(aChars)
    sort(bChars)
    return aChars == bChars
}

func caseInsensitiveComparer (a:String,b:String) -> Bool {
    return a.uppercaseString.compare(b.uppercaseString) < 0
}

func compareIgnoreCase (a:String,b:String) -> Int {
    return a.uppercaseString.compare(b.uppercaseString)
}

extension MapCollectionView {
    
    func map<T,U>(fn: (T) -> (U)) -> [U] {
        var to = [U]()
        for x in self {
            let e = x as U
            to.append(e)
        }
        return to
    }
}

func compare<T : Comparable>(a:T, b:T) -> Int {
    return a == b
        ? 0
        : a > b ? -1 : 1
}

extension Slice {
    func each(fn: (T) -> ()) {
        for i in self {
            fn(i)
        }
    }
}

extension Range {
    func map<T,U>(fn: (T) -> U) -> [U] {
        var to = [U]()
        for i in self {
            to += fn(i as T)
        }
        return to
    }
}

extension String {
    var length: Int { return countElements(self) }
    
    func contains(s:String) -> Bool {
        return (self as NSString).containsString(s)
    }
    
    func charAt(index:Int) -> String {
        let c = (self as NSString).characterAtIndex(index)
        let s = NSString(format:"%c",c)
        return s
    }
    
    func trim() -> String {
        return (self as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}


extension NSDate {
    
    convenience init(dateString:String, format:String="yyyy-MM-dd") {
        let fmt = NSDateFormatter()
        fmt.timeZone = NSTimeZone.defaultTimeZone()
        fmt.dateFormat = format
        let d = fmt.dateFromString(dateString)
        self.init(timeInterval:0, sinceDate:d)
    }
    
    convenience init(year:Int, month:Int, day:Int) {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        let gregorian = NSCalendar(identifier:NSGregorianCalendar)
        var d = gregorian.dateFromComponents(c)
        self.init(timeInterval:0, sinceDate:d)
    }
    
    func components() -> NSDateComponents {
        let compnents  = NSCalendar.currentCalendar().components(
            NSCalendarUnit.DayCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.YearCalendarUnit,
            fromDate: self)
        
        return compnents
    }
    
    // Swift Compiler crashes when extension computed property is used in a call-site. Bug submitted
    //    var year:Int {
    //        return components().year
    //    }
    
    func getYear() -> Int {
        return components().year
    }
    
    func getMonth() -> Int {
        return components().month
    }
    
    func shortDateString() -> String {
        let fmt = NSDateFormatter()
        fmt.timeZone = NSTimeZone.defaultTimeZone()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.stringFromDate(self)
    }
}

func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedDescending
}
func >=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedDescending
        || lhs == rhs
}
func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
}
func <=(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedAscending
        || lhs == rhs
}
func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == NSComparisonResult.OrderedSame
}

