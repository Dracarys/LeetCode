import Cocoa

class Solution {
    // 暴力遍历
    func firstUniqChar(_ s: String) -> Int {
        var count = 0
        for (i, c) in s.enumerated() {
            for char in s {
                if c == char {
                    count += 1
                }
            }
            if count > 1 {
                count = 0
            } else {
                return i
            }
        }
        return 0;
    }
}

let str = "loveleetcode"

let s = Solution()
s.firstUniqChar(str)
