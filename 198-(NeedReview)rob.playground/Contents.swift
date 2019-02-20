import Cocoa

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
// 最大利益 = max（上家的最大利益，上家的上家的最大利益 + 当前家的利益）
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
