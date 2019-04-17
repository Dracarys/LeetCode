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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let ro = root else { return result }
        
        if let l = ro.left { postorderTraversal(l) }
        if let r = ro.right { postorderTraversal(r)}
        result.append(ro.val)
        
        return result
    }
}

// 迭代解法
class Solution1 {
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        // 因为需要越过父节点，访问右节点，所以必须标示该节点是否已经访问过了
        // 以免陷入死循环
        struct NodeStruct {
            var node: TreeNode
            var visited: Bool
            
            init(_ node: TreeNode, _ visited: Bool) {
                self.node = node
                self.visited = visited
            }
        }
        var result = [Int]()
        var nodesStack = [NodeStruct]()
        var cur = root
        var visited = false
        while cur != nil || !nodesStack.isEmpty {
            if let node = cur {
                nodesStack.append(NodeStruct(node, false))
                cur = node.left
            } else {
                cur = nodesStack.last!.node
                visited = nodesStack.last!.visited
                if visited {
                    nodesStack.popLast()
                    result.append(cur!.val)
                    cur = nil
                } else {
                    nodesStack[nodesStack.count - 1].visited = true
                    cur = cur?.right
                }
            }
        }
        
        return result
    }
}
