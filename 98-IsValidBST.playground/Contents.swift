import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ x: Int) {
        val = x
    }
}


class SolutionError1 {
    // 这个算法是错误的，没有充分理解BST的定义：
    // 1、左子节点小于父节点，右子节点大于父节点；
    // 2、左子树的所有节点都必须小于根节点，右子树的所有节点都必须大于跟节点。
    // 如果对这个定义模糊，请思考设计二叉搜索树的初衷——便于查询
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

class SolutionError2 {
    // 这里犯了逻辑上的错误，会将左子树的验证逻辑应用到右子树上去
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let r = root else { return true }
        
        return isValidBST(r, r)
    }
    
    func isValidBST(_ root: TreeNode, _ node: TreeNode?) ->Bool {
        guard let n = node else { return true }
        
        var leftValid: Bool, rightValid: Bool
        if let l = n.left {
            
            if l.val < n.val && l.val < root.val {
                leftValid = isValidBST(root, l)
            } else {
                return false
            }
        } else {
            leftValid = true
        }
        
        if let r = n.right{
            if r.val > n.val && r.val > root.val {
                // 一旦到3层，就会导致该问题出现。
                rightValid = isValidBST(root, r)
            } else {
                return false
            }
        } else {
            rightValid = true
        }
        return leftValid && rightValid
    }
}

class Solution {
    // 卡太久了，借鉴他人的中序遍历方法。对树的理解还不够深，再接再厉
    var previousNode: TreeNode?
    func isValidBST(_ root: TreeNode? ) -> Bool {
        return inOrder(root)
    }
    
    func inOrder(_ root: TreeNode? ) -> Bool {
        guard let r = root else { return true }
        if !inOrder(r.left) {
            return false
        }
        if let p = previousNode, p.val >= r.val {
            return false
        }
        previousNode = r
        return inOrder(r.right)
    }
}

let root = TreeNode(2)
root.left = TreeNode(1)
let right = TreeNode(3)
//right.left = TreeNode(6)
//right.right = TreeNode(20)
root.right = right

let s = Solution()
s.isValidBST(root)


