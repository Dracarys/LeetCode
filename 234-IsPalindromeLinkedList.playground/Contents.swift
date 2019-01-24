import Cocoa

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil else { return true }
        
        var fast = head
        var slow = head
        
        while let nextNode = fast?.next {
            fast = nextNode.next
            slow = slow?.next
        }
        
        var half = reverseList(slow)
        
        var newHead = head
        while newHead != nil && half != nil {
            if newHead?.val != half?.val {
                return false
            }
            newHead = newHead?.next
            half = half?.next
        }
        return true
    }
    
    func reverseList(_ head: ListNode? ) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        
        let h = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return h
    }
    
}
