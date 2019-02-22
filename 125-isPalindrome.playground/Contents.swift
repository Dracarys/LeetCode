import Cocoa

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        
        let lowerStr = s.lowercased()
        var unicodeScalars = [UInt32]()
        for scalar in lowerStr.unicodeScalars {
            unicodeScalars.append(scalar.value)
        }
        
        var head = 0
        var tail = unicodeScalars.count - 1
        while head < tail {
            if !isCharacterOrNumber(unicodeScalars[head]) {
                head += 1
            } else if !isCharacterOrNumber(unicodeScalars[tail]) {
                tail -= 1
            } else if unicodeScalars[head] != unicodeScalars[tail] {
                return false
            } else {
                head += 1
                tail -= 1
            }
        }
        return true
    }
    
    private func isCharacterOrNumber(_ value: UInt32) -> Bool {
        // (48...57).contains(value) || (97...122).contains(value)
        //  上面的表达式比下面的要慢，Why? 因为初始化Struct导致的？
        if (value >= 48 && value <= 57) || (value >= 97 && value <= 122) {
            return true
        }
        return false
    }
    
}

let str = "A man, a plan, a canal: Panama1"

let s = Solution()
s.isPalindrome(str)

(50...100).contains(55)



