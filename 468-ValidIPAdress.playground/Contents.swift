import Cocoa

// IPv6未能通过测试。
class Solution {
    func validIPAddress(_ IP: String) -> String {
        if isValidIPv4Address(IP) {
            return "IPv4"
        }
        if isValidIPv6Address(IP) {
            return "IPv6"
        }
        return "Neither"
    }
    
    private func isValidIPv4Address(_ address: String) -> Bool {
        let elements = address.components(separatedBy: ".")
        if elements.count != 4 { return false }
        
        for e in elements {
            if e.hasPrefix("0") { return false }
            if let n = Int(e) {
                if n < 0 || n > 255 { return false }
            } else {
                return false
            }
        }
        return true
    }
    private func isValidIPv6Address(_ address: String) -> Bool {
        let elements = address.components(separatedBy: ":")
        // IPv6 分段如果全是 0 是可以简写为 “::” 的。
        if elements.count != 8 { return false }
        
        for e in elements {
            if e.count > 4 { return false }
            for c in e {
                if !("a".unicodeScalars.first!.value..."f".unicodeScalars.first!.value).contains(c.unicodeScalars.first!.value)
                    && !("A".unicodeScalars.first!.value..."F".unicodeScalars.first!.value).contains(c.unicodeScalars.first!.value)
                    && !("0".unicodeScalars.first!.value..."9".unicodeScalars.first!.value).contains(c.unicodeScalars.first!.value) {
                    return false
                }
            }
        }
        return true
    }
}

let address = "20EE:FGb8:85a3:0:0:8A2E:0370:7334"
let s = Solution()
s.validIPAddress(address)
