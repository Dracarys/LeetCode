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
        
        return result.reduce(""){ $0 + "/" + $1 }
    }
}

let path = "/a//b////c/d//././/.."
let s = Solution()

s.simplifyPath(path)
