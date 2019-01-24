import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ x: Int) {
        val = x
    }
}

class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        
        if !isValidLeftOfBST(root, left: root.left) || !isValidRightOfBST(root, right: root.right) {
            return false;
        }
        return isValidBST(root.left) && isValidBST(root.right)
    }
    
    func isValidLeftOfBST(_ root: TreeNode?, left: TreeNode? ) -> Bool {
        guard let root = root else { return true }
        
        if let left = left, left.val >= root.val {
            return false;
        }
        return true
    }
    
    func isValidRightOfBST(_ root: TreeNode?, right: TreeNode? ) -> Bool {
        guard let root = root else { return true }
        
        if let right = right, right.val <= root.val {
            return false;
        }
        return true
    }
}
