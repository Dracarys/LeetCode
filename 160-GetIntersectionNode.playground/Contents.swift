import Cocoa
public class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ x: Int) {
        val = x
    }
}

// 要求时间复杂度为 O(n)，空间复杂度 O(1)，不能现有结构
// 自己没能在半小时内解决该问题，该算法来自leetcode评论区
class Solution {
    public func getIntersectionNode(_ headA: ListNode, _ headB: ListNode) -> ListNode? {
        var nodeA:ListNode? = headA
        var nodeB:ListNode? = headB
        /*
         该算法非常简洁，通过触底交换，巧妙地同步了两个长短不一的链表上的引用。
         假设 B 链较长，nodeA 将先抵达末尾，nodeA 指向 B 链，之后随着 nodeB 一起移动，
         当 NodeB 抵达末尾时，nodeA正好移动到与 A 等长（由尾至头）的位置，此时 NodeB 在
         指向 A 链，之后一起移动，引用相等时即为目标结点。
        */
        while nodeA !== nodeB {
            nodeA = nodeA == nil ? headB : nodeA?.next
            nodeB = nodeB == nil ? headA : nodeB?.next
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
s.getIntersectionNode(headA, headB)?.val

