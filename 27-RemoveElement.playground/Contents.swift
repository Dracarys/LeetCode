import Cocoa

// 倒序替换
class Solution1 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var lastIndex = nums.count - 1
        while lastIndex >= 0 && nums[lastIndex] == val {
            lastIndex -= 1
        }
        if lastIndex == 0 { return 1 }
        
        var curIndex = lastIndex - 1
        while curIndex >= 0 {
            if nums[curIndex] == val {
                let temp = nums[lastIndex]
                nums[lastIndex] = nums[curIndex]
                nums[curIndex] = temp
                
                lastIndex -= 1
            }
            curIndex -= 1
        }
        
        return lastIndex + 1
    }
}

// 正序替换
class Solution2 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var firstIndex = 0
        var curIndex = 0
        while curIndex < nums.count {
            if nums[curIndex] != val {
                nums[firstIndex] = nums[curIndex]
                firstIndex += 1
            }
            curIndex += 1
        }
        
        return firstIndex
    }
}

// 正序旋转
class Solution3 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var len = nums.count
        var j = 0
        while j < len {
            if nums[j] == val {
                let tmp = nums[j]
                nums[j] = nums[len - 1]
                nums[len - 1] = tmp
                len -= 1
            } else {
                j += 1
            }
        }
        return len
    }
}

var nums = [0,1,2,2,3,0,4,2]
let s = Solution1()
s.removeElement(&nums, 2)
nums
