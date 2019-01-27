import Cocoa

// 倒序遍历
class Solution1 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var result = 1
        var counter = 1
        var index = nums.count - 1
        var previous = nums[index]
        
        index -= 1
        while index >= 0 {
            if nums[index] == previous {
                if counter >= 2 {
                    nums.remove(at: index)
                } else {
                    counter += 1
                    result += 1
                }
            } else {
                previous = nums[index]
                counter = 1
                result += 1
            }
            index -= 1
        }
        
        return result
    }
}

// 将元素安要求向前移动，比上面的方法减少了，移除元素时的整体前移动作
class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result = 0
        for n in nums {
            if result < 2 || n > nums[result - 2] {
                nums[result] = n
                result += 1
            }
        }
        nums.removeLast(nums.count - result)
        return result
    }
}


var nums = [0,0,1,1,1,1,2,3,3]
let s = Solution2()
s.removeDuplicates(&nums)
nums
