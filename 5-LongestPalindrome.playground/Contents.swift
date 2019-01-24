class Solution {
    
    func longestPalindrome(_ s: String) -> String {
        var startIndex:Int = 0
        var endIndex:Int = 0
        var dic = [Character: Int]()
        
        for (i, c) in s.enumerated() {
            if dic.keys.contains(c) {
                if i - dic[c]! >= endIndex - startIndex {
                    startIndex = dic[c]!
                    endIndex = i
                }
            }
            dic[c] = i
        }
        
        let si = s.index(s.startIndex, offsetBy: startIndex)
        let ei = s.index(s.startIndex, offsetBy: endIndex)
        
        return String(s[si...ei])
    }
}

let s = Solution()

s.longestPalindrome("babad")
