import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ x: Int) {
        self.val = x
    }
}

// 迭代实现
class Solution {
    public func serialize(_ root: TreeNode) -> String {
        var queue = [TreeNode?]()
        queue.append(root)
        var values = [String]()
        while queue.count > 0 {
            if let node = queue.removeFirst() {
                values.append(String(node.val))
                queue.append(node.left)
                queue.append(node.right)
            } else {
                values.append("null")
            }
        }
        // 怎么优化掉这一步呢？，随着深度的增加，这里会越来越恐怖
        while let value = values.last, value == "null" {
            values.removeLast()
        }
        
        return values.joined(separator: ",")
    }
    
    public func deserialize(_ str: String) -> TreeNode? {
        guard str.count > 0 else { return nil }
        
        let values = str.components(separatedBy: ",").map { (valueStr) -> Int? in
            if valueStr == "null" {
                return nil
            } else {
                return Int(valueStr)
            }
        }
        
        var queue = [TreeNode?]()
        var root: TreeNode? = nil
        
        for (i, v) in values.enumerated() {
            if i > 0 {
                let node = queue.first!
                if let val = v {
                    let newNode = TreeNode(val)
                    queue.append(newNode)
                    if i % 2 == 0 {
                        node?.right = newNode
                        queue.removeFirst()
                    } else {
                        node?.left = newNode
                    }
                } else {
                    if i % 2 == 0 {
                        queue.removeFirst()
                    }
                }
            } else {
                root = TreeNode(v!)
                queue.append(root)
            }
        }
        return root
    }
}

let s = Solution()
let t = s.deserialize("1,2,3,null,null,4,5")
t?.right?.right?.val
let r = s.serialize(t!)
r
