import Cocoa

// 非原创
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let numsSotred = nums.sorted()
        
        var results = [[Int]]()
        var i = 0
        while i < numsSotred.count {
            let num = numsSotred[i]
            var head = i + 1
            var tail = numsSotred.count - 1
            
            while head < tail {
                let sum = num + numsSotred[head] + numsSotred[tail]
                if sum == 0 {
                    results.append([num, numsSotred[head], numsSotred[tail]])
                    head += 1
                    tail -= 1
                    // 跳过重复
                    while (head < tail && numsSotred[head] == numsSotred[head - 1]) {
                        head += 1
                    }
                    while (head < tail && numsSotred[tail] == numsSotred[tail + 1]) {
                        tail -= 1
                    }
                } else if sum > 0 {
                    tail -= 1
                } else {
                    head += 1
                }
            }
            i += 1
            //跳过重复
            while i < numsSotred.count && numsSotred[i] == numsSotred[i - 1] {
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

