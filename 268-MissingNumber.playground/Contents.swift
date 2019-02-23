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


let nums = [0, 1, 2, 4, 5, 6]
let s = Solution1()
s.missingNumber(nums)
