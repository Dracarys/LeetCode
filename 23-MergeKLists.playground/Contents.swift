import Cocoa

public class ListNode {
    public var val: Int;
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        var nodeVals = [Int]()
        lists.forEach {
            var curNode = $0
            while let n = curNode {
                nodeVals.append(n.val)
                curNode = n.next
            }
        }
        
        // 排序算法要自己写的。
        nodeVals.sort(by: <)
        
        let dummyHead = ListNode(0)
        var curNode = dummyHead
        nodeVals.forEach {
            curNode.next = ListNode($0)
            curNode = curNode.next!
        }

        return dummyHead.next
    }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        var nodeVals = [Int]()
        lists.forEach {
            var curNode = $0
            while let n = curNode {
                nodeVals.append(n.val)
                curNode = n.next
            }
        }
        
        nodeVals.sort(by: <)
        
        let dummyHead = ListNode(0)
        var curNode = dummyHead
        nodeVals.forEach {
            curNode.next = ListNode($0)
            curNode = curNode.next!
        }
        
        return dummyHead.next
    }
}
