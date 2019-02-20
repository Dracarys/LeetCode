import Cocoa

/**
 * 思路：
 *     假设数组中只有一个元素，那么就是nums[0]
 *     假设数组中有两个元素，那么就是max(nums[0], nums[0] + nums[1])
 *     以此类推类推，结果为：max(maxSubArray[n-1], maxSubArray[n-1] + nums[n])
 *     考虑到整数包括负数，所以：初始和为0，即全部都是负数，一个也不选，[]
 *     这里的描述不准确，有待更新。
 */

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var final = nums.first!
        var sum = 0
        nums.forEach { num in
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            final = max(final, sum)
        }
        return final
    }
}

let nums = [-2,1,-3,4,-1,2,1,-5,4]
let s = Solution()
s.maxSubArray(nums)
