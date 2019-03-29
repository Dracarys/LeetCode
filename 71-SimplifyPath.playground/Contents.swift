import Cocoa

class Solution {
    func simplifyPath(_ path: String) -> String {
        let strs = path.components(separatedBy: "/")
        var result = [String]()
        strs.forEach { (s) in
            if !s.isEmpty {
                if s == ".." {
                    result.popLast()
                } else if s != "."{
                    result.append(s)
                }
            }
        }
        
        if result.count == 0 {
            return "/"
        }
        return result.reduce(""){ $0 + "/" + $1 }
    }
}

// 此种方式还不如上面的快呢。
class Solution1 {
    func simplifyPath(_ path: String) -> String {
        let strs = path.components(separatedBy: "/")
        var result = [String]()
        strs.forEach { (s) in
            if s == ".." {
                result.popLast()
            } else if !s.isEmpty && s != "." {
                result.append(s)
            }
        }
        return "/" + result.joined(separator: "/")
    }
}

let path = "/home/"
let s = Solution1()

s.simplifyPath(path)
