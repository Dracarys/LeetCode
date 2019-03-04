import Cocoa

// 非原创
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let newNums = nums.sorted()
        
        var results = [[Int]]()
        var i = 0
        while i < newNums.count {
            let n = newNums[i]
            var start = i + 1
            var end = newNums.count - 1
            
            while start < end {
                let sum = n + newNums[start] + newNums[end]
                if sum == 0 {
                    results.append([n, newNums[start], newNums[end]])
                    start += 1
                    end -= 1
                    // 跳过重复
                    while (start < end && newNums[start] == newNums[start - 1]) {
                        start += 1
                    }
                    while (start < end && newNums[end] == newNums[end + 1]) {
                        end -= 1
                    }
                } else if sum > 0 {
                    end -= 1
                } else {
                    start += 1
                }
            }
            i += 1
            //跳过重复
            while i < newNums.count && newNums[i] == newNums[i - 1] {
                i += 1
            }
        }
        return results
    }
}


// Test

let nums = [-1, 0, 1, 2, -1, -4]
let s = Solution()
let r = s.threeSum(nums)

