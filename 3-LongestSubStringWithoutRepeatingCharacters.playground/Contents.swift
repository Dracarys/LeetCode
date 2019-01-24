import Cocoa

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var count = 0
        var dic = Dictionary<Character, Int>()
        
        for (i, c) in s.enumerated() {
            if dic.keys.contains(c) {
                count = max(dic[c]!, count)
            }
            result = max(result, i - count + 1)
            dic[c] = i + 1
        }
        return result
    }
}

let string = "dvdf"

let solution = Solution()
let result = solution.lengthOfLongestSubstring(string)


