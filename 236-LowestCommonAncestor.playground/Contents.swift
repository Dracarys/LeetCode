import Cocoa

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ x: Int) {
        self.val = x
    }
    
    class func buildTreeWithValues(_ values: [Int?]) -> TreeNode?{
        guard values.first! != nil else { return nil }
        
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

// 递归解法，来自力扣评论。
class Solution {
    public func lowestCommonAncestor(_ root: TreeNode?, p: TreeNode, q: TreeNode) -> TreeNode? {
        // 首先考虑根节点
        guard let root = root else { return nil }
        guard root !== p && root !== q else { return root }
        
        // 分别在左右子树上递归查找。
        let left = lowestCommonAncestor(root.left, p: p, q: q)
        let right = lowestCommonAncestor(root.right, p: p, q: q)
        
        // 左右都找到了，那么必然是根结点
        if left != nil && right != nil {
            return root
        }
        // 左边找到了，那就是左边的
        if let l = left {
            return l
        }
        // 同理
        if let r = right {
            return r
        }
        
        return nil
    }
}


let root = TreeNode.buildTreeWithValues([3,5,1,6,2,0,8,nil,nil,7,4])

let q = root?.left?.right?.right!
let p = root?.left?.right?.left!
let s = Solution()
let r = s.lowestCommonAncestor(root, p: p!, q: q!)
