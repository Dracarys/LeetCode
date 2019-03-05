import Cocoa

class Solution {
    func findLengthOfLCIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty  else {
            return 0
        }
        
        var pre = Int.min
        var result = 1
        var counter = 0
        
        nums.forEach { (n) in
            if n > pre {
                counter += 1
            } else {
                result = max(result, counter)
                counter = 1
            }
            pre = n
        }
        
        return max(result, counter)
    }
}

let nums = [1,3,5,4,7]
let s = Solution()
s.findLengthOfLCIS(nums)


