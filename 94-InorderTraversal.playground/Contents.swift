import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ x: Int) {
        val = x
    }
}

// 递归解法，
class Solution {
    var result = [Int]()
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let ro = root else { return result }
        
        if let l = ro.left { inorderTraversal(l) }
        result.append(ro.val)
        if let r = ro.right { inorderTraversal(r)}
        
        return result
    }
}

// 迭代解法
class Solution1 {
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        // 声明一个“栈”，用来容纳尚未被打印的节点
        var nodesStack = [TreeNode]()
        
        var cur = root
        // 考虑只有跟节点的情况，或一个右节点的情况。
        while cur != nil || !nodesStack.isEmpty {
            if let node = cur {
                // 不断递进查看左节点，不为空即入栈保存
                nodesStack.append(node)
                cur = node.left
            } else {
                // 一旦为空，那么最后入栈的即为最左边的叶子节点
                cur = nodesStack.popLast()
                if let node = cur {
                    result.append(node.val)
                }
                cur = cur?.right
            }
        }
        
        return result
    }
}
