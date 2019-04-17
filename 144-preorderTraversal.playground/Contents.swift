import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ x: Int) {
        val = x
    }
}

// 递归解法
class Solution {
    var result = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let ro = root else { return result }
        
        result.append(ro.val)
        if let l = ro.left { preorderTraversal(l) }
        if let r = ro.right { preorderTraversal(r)}
        
        return result
    }
}

// 迭代解法
class Solution1 {
    var result = [Int]()
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let ro = root else { return result }
        
        var nodes = [TreeNode]()
        nodes.append(ro)
        while !nodes.isEmpty {
            if let curRoot = nodes.popLast() {
                result.append(curRoot.val)
                // 注意这里用的是栈，所以左右顺序颠倒，如果是队列，则不需要。
                if let r = curRoot.right {
                    nodes.append(r)
                }
                if let l = curRoot.left {
                    nodes.append(l)
                }
            }
        }
        
        return result
    }
}

