import Cocoa

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ x: Int) {
        val = x
    }
}

// 直接是最优解，耶✌️，不枉费思考这半个多小时。
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        
        let medianIndex = nums.count/2
        let median = nums[medianIndex]
        
        // 因为要递归，所以这里的数组边界是固定的，如此还想要修改取值，那么就只能改变数组，
        // 不能改变边界就改变容器，不能改变容器，就改变边界，殊途同归！
        let left = sortedArrayToBST(Array(nums[0..<medianIndex]))
        let tree = TreeNode(median)
        let right = sortedArrayToBST(Array(nums[medianIndex + 1..<nums.count]))
        tree.left = left
        tree.right = right
        return tree
    }
}

