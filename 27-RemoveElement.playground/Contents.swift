import Cocoa

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

class Solution2 {
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
            print(nums.description)
        }
        return len
    }
}

var nums = [3,3,2,2,3,3]
let s = Solution1()
s.removeElement(&nums, 3)
nums
