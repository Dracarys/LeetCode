import Cocoa

// 非原创
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        guard nums.count > 2  else {
            return results
        }
        
        let numsSorted = nums.sorted()
        var i = 0
        while i < numsSorted.count && numsSorted[i] <= 0 {
            let num = numsSorted[i]
            var head = i + 1
            var tail = numsSorted.count - 1
            
            // 从余下的序列中查询符合条件的数值
            while head < tail {
                let sum = num + numsSorted[head] + numsSorted[tail]
                if sum == 0 {
                    results.append([num, numsSorted[head], numsSorted[tail]])
                    head += 1
                    tail -= 1
                    // 跳过重复的数值
                    while head < tail && numsSorted[head] == numsSorted[head - 1] {
                        head += 1
                    }
                    while head < tail && numsSorted[tail] == numsSorted[tail + 1] {
                        tail -= 1
                    }
                } else if sum > 0 {
                    tail -= 1
                } else {
                    head += 1
                }
            }
            i += 1
            // 跳过重复的数值
            while i < numsSorted.count && numsSorted[i] == numsSorted[i - 1] {
                i += 1
            }
        }
        return results
    }
}


// Test

let nums = [0, 0, 0]
let s = Solution()
let r = s.threeSum(nums)

