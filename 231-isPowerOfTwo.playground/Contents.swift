import Cocoa


// 2 的幂得意与计算机的数据记录形式，其比特位必然只有一个 1，
// 虽然知道上面的特点，但是不清楚如何判断是否只有一个 1，
// 因此查到这个循环求 1 个数的方法
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        var temp = n
        var result = 0
        
        while temp > 0 {
            temp &= temp - 1
            result += 1
        }
        return result == 1
    }
}

// 但实际上我们不需要知道1的个数，只要知道是否只有一个1即可
// 以4为例：“100”，那么4-1=3，恰好是“011” ，如此相& 结果正好为 0
// 但是这里自己出现了一个错误：对符号优先级不够熟悉。
class Solution1 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        // & 操作符的优先级要高于 -
        if n & n - 1 == 0 { return true }
        return false
    }
}

// 修正后
class Solution2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        if n & (n - 1) == 0 { return true }
        return false
    }
}

// 进一步简化代码
class Solution3 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        return n & (n - 1) == 0
    }
}

let s = Solution()
s.isPowerOfTwo(2)

