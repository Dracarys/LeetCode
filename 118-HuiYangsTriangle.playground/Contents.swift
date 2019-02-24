import Cocoa

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var triangle = [[1]]
        for i in 2...(numRows + 1) {
            var level = Array.init(repeating: 1, count: i)
            let preLevel = triangle[i-2]
            if i > 2 {
                for j in 1...preLevel.count {
                    level[j] = preLevel[j] + preLevel[j - 1]
                }
            }
            triangle.append(level)
        }
        return triangle
    }
}

let s = Solution()
let result = s.generate(2)

for level in result {
    print(level.description)
}
