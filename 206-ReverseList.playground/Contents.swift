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

class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let list = head else { return nil }
        
        var count = 1
        var node: ListNode? = list
        while node?.next != nil {
            count += 1
            node = node?.next
        }
        
        if count == 1 { return list }
        
        var first: ListNode? = list
        var second: ListNode?
        for _ in 1..<count/2 {
            first = first?.next
        }
        
        if count % 2 == 0 {
            second = first?.next
        } else {
            second = first?.next?.next
        }
        
        count /= 2
        while count > 0 {
            let val = first?.val
            first?.val = second!.val
            second?.val = val!
            
            second = second?.next
            first = list
            var step = count - 2
            while step > 0 {
                step -= 1
                first = first?.next
                
            }
            count -= 1
        }
        
        return list
    }
}

class Solution2 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        
        var previous = head
        var node = head?.next
        var next: ListNode?
        previous?.next = nil
        
        while node?.next != nil {
            next = node?.next
            node?.next = previous
            previous = node
            node = next
            next = nil
        }
        node?.next = previous
        return node
    }
}

class Solution3 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else {
            return head
        }
        let h = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return h
    }
}

let l = ListNode(1)
var setup = 1
while setup < 3 {
    setup += 1
    l.append(x: setup)
}
print(l.description)


let s = Solution3()

let list = s.reverseList(l)

print(list!.description)

