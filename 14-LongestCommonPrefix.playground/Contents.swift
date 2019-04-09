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

let strs = ["flower","flow","flight"]
let s = Solution()
s.longestCommonPrefix(strs)
