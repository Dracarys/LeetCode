import Cocoa

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        
        var newNum = n
        while !set.contains(newNum) {
            if newNum == 1 { return true }
            set.insert(newNum)
            let nums = numsOf(newNum)
            newNum = nums.reduce(0) { $0 + $1 * $1 }
        }
        return false
    }
    
    func numsOf(_ n: Int) -> [Int] {
        var nums = [Int]()
        var num = n
        while num > 0 {
            nums.append(num % 10)
            num = num / 10
        }
        return nums
    }
}

class Solution1 {
    func isHappy(_ n: Int) -> Bool {
        var set = Set<Int>()
        
        var happiness = n
        while !set.contains(happiness) {
            if happiness == 1 { return true }
            set.insert(happiness)
            happiness = calculateHappiness(happiness)
        }
        return false
    }
    
    func calculateHappiness(_ n: Int) -> Int {
        var happiness = 0
        var num = n
        while num > 0 {
            let littleHappiness = num % 10
            happiness += littleHappiness * littleHappiness
            num = num / 10
        }
        return happiness
    }
}

// 这里用Array 带起了 Set，但是1024点容量有待证明。
class Solution2 {
    func isHappy(_ n: Int) -> Bool {
        var check = Array(repeating: 0, count: 1024)
        var m = Happy(n)
        while m > 1 && check[m] == 0 {
            check[m] = 1
            m = Happy(m)
        }
        return m == 1
    }
    
    func Happy(_ n: Int) -> Int {
        var res = 0
        var m = n
        while m > 0 {
            res += (m % 10) * (m % 10)
            m /= 10
        }
        return res
    }
    
    
}


let s = Solution1()
s.isHappy(19)
