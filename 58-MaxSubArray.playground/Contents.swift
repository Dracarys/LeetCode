import Cocoa

//!!!!: 理解了流程，但是没理解“证明过程”。
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var rest = nums[0]
        var sum = 0
        nums.forEach { num in
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            rest = max(rest, sum)
        }
        return rest
    }
}

let nums = [-2,1,-3,4,-1,2,1,-5,4]
let s = Solution()
s.maxSubArray(nums)
