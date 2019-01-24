import Cocoa

class Solution1 {
    func moveZeroes(_ nums: inout [Int]) {
        var end = nums.count - 1
        for i in 0..<nums.count {
            if i > end {
                break
            }

            if nums[i] == 0 {
                reverse(&nums, start: i, end: end)
                while end >= 0 && nums[end] == 0 {
                    end -= 1
                }
                reverse(&nums, start: i, end: end)
            }
        }
    }
    
    func reverse(_ nums: inout [Int], start: Int, end: Int) {
        var head = start
        var tail = end
        while head < tail {
            let temp = nums[head]
            nums[head] = nums[tail]
            nums[tail] = temp
            head += 1
            tail -= 1
        }
    }
}

class Solution2 {
    func moveZeroes(_ nums: inout [Int]) {
        var nonZeroCount = 0
        for n in nums {
            if n != 0 {
                nums[nonZeroCount] = n
                nonZeroCount += 1
            }
        }
        // 通过上面的循环，将所有非零数字向前移动，并统计非零数字个数
        // 将剩余部分全部赋值为 0
        while nonZeroCount < nums.count {
            nums[nonZeroCount] = 0
            nonZeroCount += 1
        }
    }
}

var nums = [0,0,0,3,12]
let s = Solution2()
s.moveZeroes(&nums)
