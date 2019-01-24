import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let r = root else { return 0 }
        
        let left = maxDepth(r.left) + 1
        let right = maxDepth(r.right) + 1
        
        return max(left, right)
    }
}

class Solution2 {
    func maxDepth(_ root: TreeNode? ) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left),maxDepth(root.right)) + 1
    }
}
