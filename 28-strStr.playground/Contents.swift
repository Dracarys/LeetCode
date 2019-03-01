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

/*
 * Knuth-Morris-Pratt 字符串查找算法，简称为 “KMP算法”，常用于在一个文本串 S 内查找一个模式串 P 的出现位置，
 * 该算法由 Donald Knuth、Vaughan Pratt、James H. Morris 三人于1977年联合发表，故取这3人的姓氏命名此算法
 * [KMP](https://blog.csdn.net/v_july_v/article/details/7041827)
 */

class Solution1 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        
        return -1
    }
}


let s = Solution()
let haystack = "hello"
let needle = "ll"
s.strStr(haystack, needle)
