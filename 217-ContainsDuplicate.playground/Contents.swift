import Cocoa

class Solution1 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var numSet = Set<Int>()
        for n in nums {
            if numSet.contains(n) {
                return true
            } else {
                numSet.insert(n)
            }
        }
        return false
    }
}

// 上下一比较真是差距，既然都用了Set，又何必去遍历呢，又不需要知道重复数的索引。
class Solution2 {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count != Set<Int>(nums).count
    }
}



let nums = [1,2,3,1]
let s = Solution2()
s.containsDuplicate(nums)
