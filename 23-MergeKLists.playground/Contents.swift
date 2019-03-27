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

// 利用归并排序方法
class Solution1 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 1 else { return lists.first as? ListNode }
        return partition(lists, left: 0, right: lists.count - 1)
    }
    func partition(_ lists: [ListNode?], left: Int, right: Int) -> ListNode? {
        guard left < right else { return lists[left] }
        let mid = (left + right) / 2
        let l = partition(lists, left: left, right: mid)
        let r = partition(lists, left: mid + 1, right: right)
        return mergeTwoLists(l, r)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard l1 != nil else { return l2 }
        guard l2 != nil else { return l1 }
        if l1!.val > l2!.val {
            let temp = l2
            temp?.next = mergeTwoLists(l1, l2?.next)
            return temp
        } else {
            let temp = l1
            temp?.next = mergeTwoLists(l2, l1?.next)
            return temp
        }
    }
}


let a = [[1,4,5],[1,3,4],[2,6]]

var listNodes = [ListNode?]()
a.forEach {
    let dummyHead = ListNode(0)
    var curNode = dummyHead
    $0.forEach({ (n) in
        curNode.next = ListNode(n)
        curNode = curNode.next!
    })
    listNodes.append(dummyHead.next)
}

let s = Solution1()
let nodes = s.mergeKLists(listNodes)

var node = nodes
while let n = node {
    print(n.val, separator: ",", terminator: "")
    node = node?.next
}
