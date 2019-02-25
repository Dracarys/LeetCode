import Cocoa

class Solution {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var steps = x ^ y
        var count = 0
        while steps > 0 {
            if steps & 1 == 1 {
                count += 1
            }
            steps >>= 1
        }
        return count
    }
}

// 这是算法是在是不应该想不起来的，前几天才做的。
class Solution1 {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var diff = x ^ y
        var count = 0
        while diff > 0 {
            diff = diff & (diff - 1)
            count += 1
        }
        return count
    }
}

let s = Solution()
let r = s.hammingDistance(1, 4)
