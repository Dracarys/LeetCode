import Cocoa

class Solution1 {
    func reverseString(_ s: inout [Character]) {
        var head = 0
        var tail = s.count - 1
        
        while head < tail {
            let c = s[head]
            s[head] = s[tail]
            s[tail] = c
            
            head += 1
            tail -= 1
        }
    }
}

var chars: [Character] = [",","5","r","w","\"","w","r","5",","]

let s = Solution1()
s.reverseString(&chars)
print(chars)
