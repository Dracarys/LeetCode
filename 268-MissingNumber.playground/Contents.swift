import Cocoa

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let sum = nums.reduce(0, +)
        if nums.count % 2 == 0 {
            return (nums.count + 1) * (nums.count / 2) - sum
        } else {
            return nums.count * (nums.count / 2 + 1) - sum
        }
    }
}

class Solution1 {
    func missingNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        return nums.count * ( 1 + nums.count) / 2 - nums.reduce(0, +)
    }
}

class Solution2 {
    func missingNumber(_ nums: [Int]) -> Int {
        let n = nums.count
        let sum = nums.reduce(0, +)
        return n * ( 1 + n) / 2 - sum
    }
}

// 该方法相对上面的方法，优点在于不会出现益处问题。
class Solution3 {
    func missingNumber(_ nums: [Int]) -> Int {
        var missingNumber = 0
        for i in 0..<nums.count {
            missingNumber ^= (i + 1) ^ nums[i]
        }
        return missingNumber

    }
}


let nums = [0, 1, 2, 3, 4, 5, 6]
let s = Solution2()
s.missingNumber(nums)
