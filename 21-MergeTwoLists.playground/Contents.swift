import Cocoa

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int = 0) {
        self.val = val
    }
    
    public func append(x: Int) {
        var node = self
        while node.next != nil {
            node = node.next!
        }
        node.next = ListNode(x)
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var node: ListNode? = self
        var result = String(node!.val)
        while node?.next != nil {
            node = node?.next
            result.append("->")
            result.append(String(node!.val))
        }
        return result
    }
}


class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        if node1 == nil {
            return l2
        }
        var node2 = l2
        if node2 == nil {
            return l1
        }
        
        let dummyHead = ListNode(0)
        var node = dummyHead
        
        while let n1 = node1, let n2 = node2 {
            if n1.val <= n2.val {
                node.next = n1
                node1 = node1?.next
            } else  {
                node.next = n2
                node2 = node2?.next
            }
            node = node.next!
        }
        
        if node1 == nil {
            node.next = node2
        } else {
            node.next = node1
        }
        return dummyHead.next
    }
}

let l1 = ListNode(1)
l1.append(x: 2)
l1.append(x: 4)

let l2 = ListNode(1)
l2.append(x: 3)
l2.append(x: 4)

let s = Solution()
let l3 = s.mergeTwoLists(l1, l2)
print(l3!.description)
