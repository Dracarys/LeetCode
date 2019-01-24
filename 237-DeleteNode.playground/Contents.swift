import Cocoa

class Solution {
    class ListNode {
        var val: Int
        var next: ListNode?
        
        init(x: Int = 0) {
            val = x
        }
    }
    
    func deleteNode(node: ListNode) {
        node.val = node.next?.val ?? 0
        node.next = node.next?.next
    }
}
