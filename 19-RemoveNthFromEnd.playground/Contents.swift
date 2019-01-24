import Cocoa

// 该算法因为需要频繁对字典进行操作，所以耗时较多
class Solution1 {
    class ListNode {
        var val: Int
        var next: ListNode?
        
        init(_ val: Int = 0) {
            self.val = 0
        }
    }
    
    // 字典缓存
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let node = head else { return nil }
        
        var count = 1
        var curNode: ListNode?
        var dic = [count: node]
        
        while  node.next != nil {
            count += 1
            curNode = node.next
            dic[count] = curNode
        }
        
        if let m = dic[count - n - 1] {
            if let mm = m.next {
                m.val = mm.val
                m.next = mm.next
            } else {
                if let k = dic[count - n - 2] {
                    k.next = nil
                }
            }
        }
        
        return node
    }
}

class Solution2 {
    class ListNode {
        var val: Int
        var next: ListNode?
        
        init(_ val: Int = 0) {
            self.val = 0
        }
    }
    
    // 双指针
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let node = head, node.next != nil else { return nil }
        
        var first = node, second = node
        var step = 0;
        
        while first.next != nil {
            first = first.next!
            step += 1
            if step > n {
                step = n
                second = second.next!
            }
        }
        // 说明 second 尚未被移动，所以此时可以确定移除的是head
        if n > step {
            return second.next
        }
        
        second.next = second.next?.next
        
        return node
    }
}
