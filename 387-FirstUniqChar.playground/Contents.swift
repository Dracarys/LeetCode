import Cocoa

class Solution {
    // 暴力遍历, 时间杂度 O(n*n)
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


class Solution1 {
    // 时间杂度 O(n)
    func firstUniqChar(_ s: String) -> Int {
        guard !s.isEmpty else { return -1 }
        
        var dic = [Character: Int].init(minimumCapacity: 26)
        for c in s {
            if let t = dic[c] {
                dic[c] = t + 1
            } else {
                dic[c] = 1
            }
        }
        for (i, c) in s.enumerated() {
            if let t = dic[c], t == 1 {
                return i
            }
        }
        return -1
    }
}

class Solution2 {
    // 由于字典是无序的，所以如果可以采用有序存储的方式，那么就
    func firstUniqChar(_ s: String) -> Int {
        guard !s.isEmpty else { return -1 }
        
        var letters = [Int](repeating: 0, count: 26)
        let offset = 97
        for unicode in s.unicodeScalars {
            let index = Int(unicode.value) - offset
            letters[index] += 1
        }
        
        var index = 0
        for unicode in s.unicodeScalars {
            let i = Int(unicode.value) - offset
            if letters[i] == 1 {
                return index
            }
            index += 1
        }
        
        return -1
    }
}

let str = "loveleetcode"

let s = Solution1()
s.firstUniqChar(str)
