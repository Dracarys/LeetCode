import Cocoa

// 该算法是错误的，并不能得到最优路径和
class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var result = triangle.first?.first ?? 0
        guard triangle.count > 0 else { return result }
        
        var previousIndex = 0
        
        for i in 1..<triangle.count {
            let nums = triangle[i]
            if nums[previousIndex] > nums[previousIndex + 1] {
                previousIndex += 1
            }
            result += nums[previousIndex]
        }
        
        return result
    }
}

class Solution1 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count  >= 1 else { return 0 }
        
        var t = triangle
        for i in (0..<t.count - 1).reversed() {
            let nums = t[i]
            let nextNums = t[i + 1]
            for j in 0..<nums.count {
                t[i][j] = min(nextNums[j], nextNums[j + 1]) + nums[j]
            }
        }
        
        return t[0][0]
    }
}

class Solution2 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count  >= 1 else { return 0 }
        var results = [Int](repeating: 0, count: triangle.count + 1)
        
        
        for i in (0..<triangle.count).reversed() {
            let nums = triangle[i]
            for j in 0..<nums.count {
                results[j] = min(results[j], results[j + 1]) + nums[j]
            }
        }
        
        return results.first!
    }
}

// Test
let triangle = [[2]]

let s = Solution2()
print(s.minimumTotal(triangle))
