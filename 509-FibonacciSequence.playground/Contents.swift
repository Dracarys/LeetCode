import Cocoa

// 逻辑简单，但是时间复杂度无法接受
class Solution1 {
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fib(n - 1) + fib(n - 2)
    }
}

class Solution2 {
    func fib(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        
        // 声明缓存值
        var preValue = 1
        var prePreValue = 0

        var result = preValue + prePreValue
        
        for _ in 2...n {
            result = preValue + prePreValue
            prePreValue = preValue
            preValue = result
        }
        
//        var loop = 0
//        var result = 0
//        while loop < n {
//            // 斐波那契的公式
//            result = preValue + prePreValue
//            // 更新缓存值
//            prePreValue = preValue
//            preValue = result
//            // 更新循环条件
//            loop += 1
//        }
        
        return result
    }
}

class Solution3 {
    
    func fiboProcess(n: Int, prePreValue: Int, preValue: Int, begin: Int) -> Int {
        if n == begin {
            return preValue + prePreValue
        } else {
            return fiboProcess(n: n, prePreValue: preValue, preValue: prePreValue + preValue, begin: begin + 1)
        }
    }
    
    func fib(_ n: Int) -> Int {
        if n <= 1 {
            return n
        }
        return fiboProcess(n: n, prePreValue: 0, preValue: 1, begin: 2)
    }
}

class Solution4 {
    
    // 利用斐波那契与黄金比例的关系求解
}

let s = Solution3()


// 这种方式反而慢，不如在计算时直接存储来的更快
var fibSequence = [Int]()
for i in 0..<10 {
    fibSequence.append(s.fib(i))
}
