import Cocoa

// 暴力算法直接遍历
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var result = nums.first!
        nums.forEach{
            result = result > $0 ? $0 : result
        }
        
        return result
    }
}

// 仅仅比遍历好那么一点点，没有将二分的思想贯彻到底
class Solution2 {
    func findMin(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.first ?? 0
        }
        let firstOne = nums.first!
        let lastOne = nums.last!
        if lastOne > firstOne { return firstOne }
        
        var previous = nums[nums.count/2]
        if previous < firstOne {
            // 倒序查找
            for i in (0..<nums.count/2).reversed() {
                if nums[i] > previous {
                    return previous
                }
                previous = nums[i]
            }
        } else {
            // 正序查找
            for i in nums.count/2 + 1..<nums.count {
                if nums[i] < previous {
                    return nums[i]
                }
                previous = nums[i]
            }
        }
        return firstOne
    }
}

// 完全的二分查找
class Solution3 {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count-1
        while left < right {
            let median = (right + left) / 2
            if nums[median]<nums.last!{
                right = median
            }
            else{
                left = median + 1
            }
        }
        return nums[left]
    }
}
