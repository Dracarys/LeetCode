import Cocoa

class RandomizedSet {
    var map: [Int: Int]
    
    /** Initialize your data structure here. */
    init() {
        self.map = [Int: Int]()
    }
    
    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            map[val] = val
            return false
        }
        return true
    }
    
    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if map[val] != nil {
            map.removeValue(forKey: val)
            return true
        }
        return false
    }
    
    /** Get a random element from the set. */
    func getRandom() -> Int {
        return  map.randomElement()!.key
    }
}
