import Cocoa

class Solution {
    
    // 别人的算法，组成原理还需要再复习。
    func reverseBits(_ n: UInt32) -> UInt32 {
        var originNum = n
        var result: UInt32 = 0
        var steps = 32
        while steps > 0 {
            result <<= 1
            result += originNum & 1
            originNum >>= 1
            
            steps -= 1
        }
        return result
    }
}

Solution().reverseBits(1)
Solution().reverseBits(2147483648)

