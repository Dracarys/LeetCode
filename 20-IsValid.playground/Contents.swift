import Cocoa

class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard s.count % 2 == 0 else { return false }
        
        let dicL = ["(": 1, "[": 2, "{": 3]
        let dicR = [")": 1, "]": 2, "}": 3]
        
        var array = [Character]()
        
        for c in s {
            if let last = array.last {
                if let r = dicR[String(c)] {
                    if let l = dicL[String(last)], l == r {
                        array.popLast()
                        continue
                    } else {
                        return false
                    }
                }
            }
            array.append(c)
        }
        return array.isEmpty
    }
}

class Solution1 {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard s.count % 2 == 0 else { return false }
        
        let dic = ["(": 1, "[": 2, "{": 3, ")": -1, "]": -2, "}": -3]
        var stack = [Int]()
        
        for c in s {
            if let x = dic[String(c)] {
                if x > 0 {
                    stack.append(x)
                } else if let y = stack.popLast(), x + y == 0 {
                    continue
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}


let str = "[[[]{)(}]]"
let s = Solution()
s.isValid(str)
