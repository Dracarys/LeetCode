import Cocoa

class RandomizedSet {
    var map: [Int: Int]
    
    init() {
        self.map = [Int: Int]()
    }

    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            return false
        }
        map[val] = val
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if map[val] != nil {
            map.removeValue(forKey: val)
            return true
        }
        return false
    }
    
    func getRandom() -> Int {
        // 相对而言，这一步非常耗时。
        return map.keys.randomElement()!
    }
}

class RandomizedSet2 {
    var elements = [Int]()
    var dic: [Int: Int]
    
    init() {
        self.elements = [Int]()
        self.dic = [Int: Int]()
    }
    
    func insert(_ val: Int) -> Bool {
        if dic[val] != nil {
            return false
        }
        elements.append(val)
        dic[val] = elements.count - 1
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        if let i = dic[val]{
            let lastIndex = elements.count - 1
            let last = elements.last!
            elements[lastIndex] = val
            elements[i] = last
            dic[last] = i
            
            dic.removeValue(forKey: val)
            elements.popLast()
            print(elements.description)
            return true
        }
        return false
    }
    
    func getRandom() -> Int {
        return  elements.randomElement()!
    }
}

let s = RandomizedSet()
s.insert(1)
s.remove(2)
s.insert(2)
s.getRandom()
s.remove(1)
s.insert(2)
s.getRandom()
