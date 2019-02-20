import Cocoa

/**
 * 对于第n个房间而言，如果不抢劫房间n，那么就是n-1个房间的抢劫数目
 * 如果抢劫房间n，那么必然不能抢房间n-1，即相当于n-2个房间的抢劫数目
 * 取两者之间的最大值：
 * 最大利益 = max（上家的最大利益，上家的上家的最大利益 + 当前家的利益）
 */

class Solution1 {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var privous = 0
        var current = 0
        
        for n in nums {
            let beforPrivous = privous
            privous = current
            current = max(beforPrivous + n, current)
        }
        return current
    }
}

// forEeach 比 for in 要更快。
class Solution2 {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        var privous = 0
        var sum = 0
        
        nums.forEach { n in
            let beforPrivous = privous
            privous = sum
            sum = max(beforPrivous + n, sum)
        }
        return sum
    }
}

let houses = [1, 3, 1, 3, 4]
let s = Solution2()
s.rob(houses)
