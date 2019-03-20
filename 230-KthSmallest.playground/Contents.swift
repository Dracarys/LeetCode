import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}

// 中序遍历得到值的数组，然后在取值。

class Solution {
    var nums = [Int]()
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        guard let r = root else { return -1 }
        
        inOrder(r);
        return nums[k - 1]
    }
    
    func inOrder(_ root: TreeNode?) {
        guard let r = root else { return }
        
        if let left = r.left {
            inOrder(left)
        }
        nums.append(r.val)
        if let right = r.right {
            inOrder(right)
        }
    }
}

// 来自《剑指offer》
class Solution1 {
    private var k:Int = 0
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        self.k = k
        return kthSmallestCore(root)?.val ?? -1
    }
    
    func kthSmallestCore(_ root: TreeNode?) -> TreeNode? {
        var target: TreeNode? = nil
        if let l = root?.left {
            target = kthSmallestCore(l)
        }
        if target == nil {
            if k == 1 {
                target = root
            }
            k -= 1
        }
        
        if target == nil, let r = root?.right {
            target = kthSmallestCore(r)
        }
        return target
    }
}
