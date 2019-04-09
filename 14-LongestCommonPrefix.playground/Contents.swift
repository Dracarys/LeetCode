import Cocoa

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        if strs.count == 1 { return strs.first! }
        if strs.count == 2 { return commonPrefix(strs[0], strs[1]) }
        
        var prefix = commonPrefix(strs[0], strs[1])
        for i in 2..<strs.count {
            if prefix.isEmpty { return "" }
            prefix = commonPrefix(prefix, strs[i])
        }
        
        return prefix
    }
    
    private func commonPrefix(_ str1: String, _ str2: String) -> String {
        guard !str1.isEmpty && !str2.isEmpty else { return "" }
        
        var index = str1.count
        var prefix = str1
        while !str2.hasPrefix(prefix) {
            if prefix.isEmpty { return "" }
            index -= 1
            // 还是转换一下操作方便， Swift 原生的操作起来发怵
            prefix = (str1 as NSString).substring(to: index)
        }
        return prefix
    }
}

// 该算法与上面的思想是一致的，即横向扫描。
// 时间复杂度为 O(S), S 为所有字符串的字符数之和，空间复杂度 O(1)
// 最坏情况即为所有字符相同，那么就需要全部比对一遍。
class Solution1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        if strs.count == 1 { return strs.first! }
        if strs[0].isEmpty || strs[1].isEmpty { return "" }
        var commonPrefix = strs[0]
        
        for i in 1..<strs.count {
            while !(strs[i] as NSString).hasPrefix(commonPrefix) {
                commonPrefix = (commonPrefix as NSString).substring(to: commonPrefix.count - 1)
                if commonPrefix.isEmpty { return "" }
            }
        }
        return commonPrefix
    }

}

/**
 * 这道算法题虽然还有其它很多中没法，但是水平扫描相对空间复杂度底，且思路简单。
 */

let strs = ["",""]
let s = Solution1()
s.longestCommonPrefix(strs)
