import Cocoa


class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
    }
}


class Solution1 {
    // 此算法直观暴力时间杂度 O(n)，空间 O(n)
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
            curLevelResult.append(node.val)
            if let l = node.left {
                nextLevelNodes.append(l)
            }
            if let r = node.right {
                nextLevelNodes.append(r)
            }
        }
        result.append(curLevelResult)

        appendLevelNode(result: &result, nodes: nextLevelNodes)
    }
}

class Solution2 {
    // 总体思路与1相同，只是用迭代取代了递归，且无需每层创建一个数组
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let r = root else { return result }
        
        var curLevelNodes = [r]
        
        while !curLevelNodes.isEmpty {
            var curLevelVals = [Int]()
            for _ in 0..<curLevelNodes.count {
                let node = curLevelNodes.removeFirst()
                curLevelVals.append(node.val)
                if let l = node.left {
                    curLevelNodes.append(l)
                }
                if let r = node.right {
                    curLevelNodes.append(r)
                }
            }
            result.append(curLevelVals)
        }
        return result
    }
}

class Solution3 {
    // 这才是真正理解递归，将重复内容缩减至最少。
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let r = root  else {
            return result
        }
        levelOrder(result: &result, node: r, depth: 1)
        return result
    }
    
    func levelOrder(result: inout [[Int]], node: TreeNode?, depth: Int) {
        guard let n = node else {
            return
        }
        
        if result.count < depth {
            result.append([Int]())
        }
        result[depth - 1].append(n.val)
        levelOrder(result: &result, node: n.left, depth: depth + 1)
        levelOrder(result: &result, node: n.right, depth: depth + 1)
    }
}


