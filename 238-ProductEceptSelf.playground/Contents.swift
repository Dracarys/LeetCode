import Cocoa

// 虽然想到了双向处理，但还是没能在30分钟内求解
// 该解法来自 leetcode-cn 用户 @日月光辉
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array<Int>(repeatElement(1, count: nums.count))
        var left = 1, right = 1
        for (i, n) in nums.enumerated() {
            result[i] *= left
            left *= n
            
            let rightIndex = nums.count - i - 1
            result[rightIndex] *= right
            right *= nums[rightIndex]
        }
        return result
    }
}

// 实际运行反而没有 solution 快，😅
class Solution2 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array<Int>(repeatElement(1, count: nums.count))
        var left = 1, right = 1, rightIndex = nums.count - 1
        for i in 0..<nums.count {
            result[i] *= left
            left *= nums[i]
            
            result[rightIndex] *= right
            right *= nums[rightIndex]
            rightIndex -= 1
        }
        return result
    }
}

// 终于比第一个快了，可见 `forEach` 还是经过优化的，比单纯的 for 要快那么一点点。
class Solution3 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array<Int>(repeatElement(1, count: nums.count))
        var left = 1, right = 1, rightIndex = nums.count - 1
        for (i, n) in nums.enumerated() {
            result[i] *= left
            left *= n
            
            result[rightIndex] *= right
            right *= nums[rightIndex]
            rightIndex -= 1
        }
        return result
    }
}

let nums = [1, 2, 3, 4]
let s = Solution2()
s.productExceptSelf(nums)


