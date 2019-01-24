import Cocoa

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else {
            return
        }
        
        var level = 0
        var last = matrix.count - 1
        let totNumOfLevels = matrix.count / 2
        
        while (level < totNumOfLevels) {
            for i in level..<last {
                let temp = matrix[level][i]
                matrix[level][i] = matrix[last - i + level][level]
                matrix[last - i + level][level] = matrix[last][last - i + level]
                matrix[last][last - i + level] = matrix[i][last]
                matrix[i][last] = temp
            }
            level += 1
            last -= 1
        }
    }
}

var matrix = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
    [13,14,15,16]
]

let s = Solution()
s.rotate(&matrix)
matrix
