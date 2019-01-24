import Cocoa

class Solution1 {
    func isValidSudoku(_ board: [[String]]) -> Bool {
        // 验证每一行是否有重复数字
        var set = Set<String>()
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c == "." {
                    continue
                }
                if set.contains(c) {
                    return false
                }
                set.insert(c)
            }
            set.removeAll()
        }
        // 验证每一列是否有重复数字
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[j][i]
                if c == "." {
                    continue
                }
                if set.contains(c) {
                    return false
                }
                set.insert(c)
            }
            set.removeAll()
        }
        // 验证每个3x3宫格内是否有重复
        var y = 0
        while y < 9 {
            var x = 0
            while x < 9{
                for i in x..<(x + 3) {
                    for j in y..<(y + 3) {
                        let c = board[i][j]
                        if c == "." {
                            continue
                        }
                        if set.contains(c) {
                            return false
                        }
                        set.insert(c)
                    }
                }
                set.removeAll()
                x += 3
            }
            y += 3
        }
        
        return true
    }
}

class Solution2 {
    func isValidSudoku(_ board: [[String]]) -> Bool {
        // 同时验证行列是否有重复数字
        var rowSet = Set<String>()
        var columnSet = Set<String>()
        for i in 0..<9 {
            for j in 0..<9 {
                let rowChar = board[i][j]
                if rowSet.contains(rowChar) {
                    return false
                }
                if rowChar != "." {
                    rowSet.insert(rowChar)
                }
                let columnChar = board[j][i]
                if columnSet.contains(columnChar) {
                    return false
                }
                if columnChar != "."  {
                    columnSet.insert(columnChar)
                }
            }
            rowSet.removeAll()
            columnSet.removeAll()
        }
        // 双向验证每个3x3宫格内是否有重复
        var y = 0
        while y < 9 {
            var x = 0
            while x < 9{
                for i in x..<(x + 3) {
                    for j in y..<(y + 3) {
                        let rowChar = board[i][j]
                        if rowSet.contains(rowChar) {
                            return false
                        }
                        if rowChar != "." {
                            rowSet.insert(rowChar)
                        }
                        let columnChar = board[8-i][8-j]
                        if columnSet.contains(columnChar) {
                            return false
                        }
                        if columnChar != "."  {
                            columnSet.insert(columnChar)
                        }
                        if i == 4 && j == 4 {
                            if board[i][j] != "." {
                                if rowSet.intersection(columnSet).count <= 1 {
                                    return true
                                } else {
                                    return false
                                }
                            } else {
                                if rowSet.intersection(columnSet).count == 0 {
                                    return true
                                } else {
                                    return false
                                }
                            }
                        }
                    }
                }
                rowSet.removeAll()
                columnSet.removeAll()
                x += 3
            }
            y += 3
        }
        
        return true
    }
}

class Solution3 {
    func isValidSudoku(_ board: [[String]]) -> Bool {
        var rows = [Int:[Int: Int]]()
        var columns = [Int: [Int: Int]]()
        var boxes = [Int: [Int: Int]]()
        
        for n in 0..<9 {
            rows[n] = [Int: Int]()
            columns[n] = [Int: Int]()
            boxes[n] = [Int: Int]()
        }
        
        for i in 0..<9 {
            for j in 0..<9 {
                let c = board[i][j]
                if c != "." {
                    let n = Int(c)!
                    let boxIndex = (i / 3) * 3 + j / 3
                    
                    // 将当前格子中的值保存起来
                    
                    
                    // 检查值是否已经存在
                    if rows[i]?[n] ?? 0 > 1 || columns[j]?[n] ?? 0 > 1 || boxes[boxIndex]?[n] ?? 0 > 1 {
                        return false
                    }
                }
            }
        }
        return true
    }
}


let sudoku = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
let s = Solution2()
s.isValidSudoku(sudoku)
