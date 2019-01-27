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

// 这到题理解上出现了偏差，应该是通过该函数让数组符合条件，但是数组长度不变，
// 这样返回值才有意义，外部可以安此返回值读取或切片等等
class Solution3 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result = 0
        for n in nums {
            if result < 2 || n > nums[result - 2] {
                nums[result] = n
                result += 1
            }
        }
        return result
    }
}


var nums = [0,0,1,1,1,1,2,3,3]
let s = Solution3()
s.removeDuplicates(&nums)
nums
