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

let s = Solution1()
s.isPowerOfThree(27)
27%10

