import Cocoa
public class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ x: Int) {
        val = x
    }
}

// 要求时间复杂度为 O(n)，空间复杂度 O(1)，不能现有结构
class Solution {
    public func getIntersectionNode(_ headA: ListNode, _ headB: ListNode) -> ListNode? {
        var nodeA:ListNode? = headA
        var nodeB:ListNode? = headB
        // Swift 怎么判断两个引用是不是同一个对象呢？
        while !(nodeA === nodeB) {
            nodeA = nodeA == nil ? nodeA?.next : headB
            nodeB = nodeB == nil ? nodeB?.next : headA
        }
        return nodeA
    }
}

let headA = ListNode(0)
let nodeA1 = ListNode(1)
let nodeA2 = ListNode(2)
let nodeC3 = ListNode(3)
let nodeC4 = ListNode(4)
nodeC3.next = nodeC4
nodeA2.next = nodeC3
nodeA1.next = nodeA2
headA.next = nodeA1

let headB = ListNode(9)
let nodeB1 = ListNode(8)
let nodeB2 = ListNode(7)
nodeB2.next = nodeC3
nodeB1.next = nodeB2
headB.next = nodeB1

let s = Solution()
s.getIntersectionNode(headA, headB)

