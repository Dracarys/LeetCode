import Cocoa

// 动态规划问题，自己没能在 30 分中内完成题解
// 该解法来自 leetcode-cn @灵魂画师牧码
class Solution {
    func maxProductSubArray(_ nums: [Int]) -> Int {
        var result = Int.min, imax = 1, imin = 1
        
        nums.forEach{
            if $0 < 0 {
                swap(&imax, &imin)
            }
            imax = max(imax * $0, $0)
            imin = min(imin * $0, $0)
            
            result = max(result, imax)
        }
        return result
    }
}

let nums = [-2, 1, -3, 4, 0, -1, 2, 1, -5, 4]
let s = Solution()

s.maxProductSubArray(nums)
