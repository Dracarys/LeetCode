import Cocoa

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle = [[Int]]()
        guard numRows > 0 else { return triangle }
        
        for i in 1...numRows {
            var newLevel = Array.init(repeating: 1, count: i)
            if i > 2 {
                let preLevel = triangle[i-2]
                for j in 1..<(i - 1) {
                    newLevel[j] = preLevel[j] + preLevel[j - 1]
                }
            }
            triangle.append(newLevel)
        }
        return triangle
    }
}

class Solution1 {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle = [[Int]]()
        guard numRows > 0 else { return triangle }
        
        switch numRows {
            case 1:
                triangle = [[1]]
            case 2:
                triangle = [[1], [1, 1]]
            default:
                triangle = [[1], [1, 1]]
                for i in 3...numRows {
                    var newLevel = Array.init(repeating: 1, count: i)
                    // 如果在这里添加，由于是值类型，进而导致后面地修改不会同步到 triangle。
                    // triangle.append(newLevel)
                    for j in 1..<(i - 1) {
                        let preLevel = triangle[i - 2]
                        newLevel[j] = preLevel[j] + preLevel[j - 1]
                    }
                    triangle.append(newLevel)
                }
        }
        return triangle
    }
}

let s = Solution()
let result = s.generate(5)

for level in result {
    print(level.description)
}
