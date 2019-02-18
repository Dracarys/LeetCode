import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}

// Solution 1、2 的解题思路是一致的，都是将一个二叉树拆分成两个子树，然后比较是否左右相同。
// 来自leetcode，自己没能解决该问题。
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(tree: root, with: root)
    }
    
    private func isMirror(tree: TreeNode?, with anotherTree: TreeNode?) ->Bool {
        guard let t1 = tree, let t2 = anotherTree else {
            if tree == nil && anotherTree == nil {
                return true
            }
            return false
        }
        if t1.val != t2.val { return false }
        return isMirror(tree:t1.left, with:t2.right) && isMirror(tree: t1.right
            ,with:t2.left)
    }
}

class Solution2 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        var queue = [TreeNode?]()
        queue.append(root)
        queue.append(root)
        
        while !queue.isEmpty {
            // 随着树的高度增加，这里的操作也越来越耗时
            let tree = queue.removeFirst()
            let anotherTree = queue.removeFirst()
            if tree == nil && anotherTree == nil { continue }
            if tree == nil || anotherTree == nil { return false }
            if tree!.val != anotherTree!.val { return false }
            queue.append(tree?.left)
            queue.append(anotherTree?.right)
            queue.append(tree?.right)
            queue.append(anotherTree?.left)
        }
        return true
    }
}




