import Cocoa

// 此题的难点在于怎么将问题转化为求斐波那契，如果这一步理解了，没有难度。

class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        var preVal = 2
        var beforePreVal = 1
        var result = 0
        for _ in 3...n {
            result = preVal + beforePreVal
            beforePreVal = preVal
            preVal = result
        }
        return result
    }
}
