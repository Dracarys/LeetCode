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
        
        if let l = root.left {
            if !isValidBST(l) {
                return false
            } else if l.val >= root.val{
                return false
            }
        }
        
        if let r = root.right {
            if !isValidBST(r) {
                return false
            } else if r.val <= root.val{
                return false
            }
        }
        
        return true
    }
}
