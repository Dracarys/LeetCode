import Cocoa

class Solution1 {
    // 滚动算法，时间复杂度O(kn), 空间杂度O(n)
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard (nums.count > 1 || k != nums.count) && k != 0 else {
            return
        }
        var step = k
        if k > nums.count {
            step = k - nums.count
        }
        for _ in 0..<step {
            nums.insert(nums.popLast()!, at: 0)
        }
    }
}

class Solution2 {
    // 翻转算法，名称正式由此而来，时间复杂度O(kn), 空间杂度O(n)
    func rotate(_ nums: inout [Int], _ k: Int) {
        let count = nums.count
        let step = k % count
        // 第一次首尾翻转
        reverse(&nums, start: 0, end: count - 1)
        // 第二次将需要移位的部分翻转，恢复顺序
        reverse(&nums, start: 0, end: step - 1)
        // 第三次将原剩余部分翻转，恢复顺序
        reverse(&nums, start: step, end: count - 1)
    }
    
    func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var first = start, last = end
        while first < last {
            let temp = nums[first]
            nums[first] = nums[last]
            nums[last] = temp
            first += 1
            last -= 1
        }
    }
}

var arr = [1,2,3,4,5,6,7]
let s = Solution2()
s.rotate(&arr, 3)
arr
