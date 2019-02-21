import Cocoa

class Solution1 {
    // 暴力循环方法
    func isPowerOfThree(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        if n == 1 { return true }
        
        var remainder = n
        while true {
            if remainder == 1 {
                return true
            } else if remainder % 3 > 0 {
                return false
            } else {
                remainder = remainder / 3
            }
        }
    }
}

// 该算法主要利用了3的幂因子只能是3或3的幂，因此用整数范围3的最大幂次为19，
// 即1162261467，故直接将其与自然数n取模，为0则必为3的幂
// 虽然逻辑不严谨，但该算法巧妙地利用了Int整形的范围限制。
class Solution2 {
    
    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && 1162261467 % n == 0
    }
}

let s = Solution1()
s.isPowerOfThree(27)
27%10

