import Cocoa


class Solution1 {
    // 最暴力直观
    func firstBadVersion(_ n: Int) -> Int {
        var n = n
        while isBadVersion(n) {
            n -= 1
        }
        return n + 1
    }
}

class Solution2 {
    // 二分法
    func firstBadVersion(_ n: Int) -> Int {
        var upper = n
        var lower = n/2
        
        while upper - lower >= 2 {
            if isBadVersion(lower) {
                upper = lower
                lower = lower/2
            } else {
                lower = lower + (upper - lower)/2
            }
        }
        if !isBadVersion(lower) {
            return lower + 1
        } else {
            return lower
        }
    }
}

class Solution3 {
    // 优化后的二分法，优化了减法运算和除法运算，缩减不必要的处理指令。
    func firstBadVersion(_ n: Int) -> Int {
        var upper = n
        var lower = 1
        while lower < upper {
            let median = lower + ((upper - lower) >> 1)
            if isBadVersion(median) {
                upper = median
            } else {
                lower = median + 1
            }
        }
        return lower
    }
}



public func isBadVersion(_ n: Int) -> Bool {
    return n >= 3;
}

let s = Solution3()
s.firstBadVersion(100)
