import Cocoa


class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}


class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else { return [] }
        
        
        var result = [[Int]]()
        
        appendLevelNode(result: &result, nodes: [r])
        
        return result
    }
    
    func appendLevelNode(result: inout [[Int]], nodes: [TreeNode]){
        guard nodes.count > 0 else { return }
        
        var curLevelResult = [Int]()
        var nextLevelNodes = [TreeNode]()
        for node in nodes {
            if let l = node.left {
                nextLevelNodes.append(l)
                curLevelResult.append(l.val)
            }
            if let r = node.right {
                nextLevelNodes.append(r)
                curLevelResult.append(r.val)
            }
        }
        result.append(curLevelResult)

        appendLevelNode(result: &result, nodes: nextLevelNodes)
    }
}
