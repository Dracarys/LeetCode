import Cocoa

class Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        var s = Set<Int>()
        for n  in nums {
            if s.contains(n) {
                s.remove(n)
            } else {
                s.insert(n)
            }
        }
        return s.popFirst()!
    }
}

// 异或的算法更计算机一些

class Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for n in nums {
            result = result ^ n
        }
        return result
    }
}

let nums = [4,1,2,1,2]
let s = Solution2()
s.singleNumber(nums)
