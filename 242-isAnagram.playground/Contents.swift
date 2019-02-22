import Cocoa

// 种类、个数均相同即为异位词。
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty && !t.isEmpty else { return true }
        guard s.count == t.count else  { return false }
        let arr1 = Array(s)
        let arr2 = Array(t)
        var dic1 = [Character: Int]()
        var dic2 = [Character: Int]()
        for i in 0..<arr1.count {
            if !dic1.keys.contains(arr1[i]) {
                dic1[arr1[i]] = 1
            } else {
                dic1[arr1[i]]! += 1
            }
            if !dic2.keys.contains(arr2[i]) {
                dic2[arr2[i]] = 1
            } else {
                dic2[arr2[i]]! += 1
            }
        }
        
        for key in dic1.keys {
            if dic1[key] != dic2[key] { return false }
        }
        return true
    }
}

// 此算法逻辑简单，但是时间杂度增加了
class Solution1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty && !t.isEmpty else { return true }
        guard s.count == t.count else  { return false }
        let arr1 = Array(s).sorted()
        let arr2 = Array(t).sorted()
        
        return arr1 == arr2
    }
}

// 简介度与2相当，相对更快
class Solution3 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else  { return false }
        guard Set(s) == Set(t) else { return false }
        return t.utf8.reduce(0, {$0 + Int($1)}) == s.utf8.reduce(0, {$0 + Int($1)})
    }
}

let s = "aab", t = "aba"
let solution = Solution3()
solution.isAnagram(s, t)
