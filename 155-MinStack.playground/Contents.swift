import Cocoa

class MinStack1 {
    var minElement: Int?
    var elements: [Int]
    /** initialize your data structure here. */
    init() {
        elements = [Int]()
    }
    
    func push(_ x: Int) {
        if minElement == nil {
            minElement = x
        } else {
            minElement = min(x, minElement!)
        }
        elements.append(x)
    }
    
    func pop() {
        if let last = elements.popLast(), last == minElement {
            minElement = elements.first
            for e in elements {
                if e < minElement! {
                    minElement = e
                }
            }
        }
    }
    
    func top() -> Int? {
        return elements.last
    }
    
    func getMin() -> Int? {
        return minElement
    }
}

class MinStack2 {
    var minElements: [Int]
    var elements: [Int]
    /** initialize your data structure here. */
    init() {
        minElements = [Int]()
        elements = [Int]()
    }
    
    func push(_ x: Int) {
        minElements.append(min(minElements.last ?? Int.max, x))
        elements.append(x)
    }
    
    func pop() {
        minElements.popLast()
        elements.popLast()
    }
    
    func top() -> Int? {
        return elements.last
    }
    
    func getMin() -> Int? {
        return minElements.last
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
