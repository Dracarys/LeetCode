import Cocoa

class Solution {
    // 直观暴力
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        
        let arr1 = Array(haystack)
        let arr2 = Array(needle)
        
        var i = 0, j = 0
        while i < haystack.count && j < needle.count {
            if arr1[i] == arr2[j] {
                i += 1
                j += 1
            } else {
                i = i - j + 1
                j = 0
            }
        }
        
        if j == needle.count {
            return i - j;
        }
        return -1
    }
}

/*:
 ## KMP 算法
 Knuth-Morris-Pratt 字符串查找算法，简称为 “KMP算法”，常用于在一个文本串 S 内查找一个模式串 P 的出现位置，
 该算法由 Donald Knuth、Vaughan Pratt、James H. Morris 三人于1977年联合发表，故取这 3 人的姓氏命名此算法
 [KMP](https://blog.csdn.net/v_july_v/article/details/7041827)
 
 ### 前缀表（prefix table)
 前缀表是针对子串的，其记录了子串的最长公共前后缀
 假设有子串 `ababc`，那么它的前缀表如下
 
 1. a：只有一个字母，无公共前后缀，所以是 0.
 2. ab：无公共前后缀，所以是 0。因为无论是前缀 `a`，还是后缀 `b`都不同
 3. aba：最长公共前后缀，`a`，所以是 1;  `ab` 不同于 `ba`，不算公共前后缀
 4. abab：最长公共前后缀是 `ab`，所以是 2
 5. ababc：同理，无公共前后缀，所以是 0。
 
 > 为什么要将 5 这一排舍弃，而在 0 位补上 -1 ？
 
 所以最终的前缀表是：
 
    a  b   a   b   c
 
    -1  0   0   1   2
 
 */

class Solution1 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        
        return -1
    }
}

/*:
 ## Boyer-Moore 算法
 */

class Solution2 {
    
}

let s = Solution()
let haystack = "hello"
let needle = "ll"
s.strStr(haystack, needle)
