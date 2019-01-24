//: Playground - noun: a place where people can play

import Cocoa


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil;
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var factor = 1
        var result = 0
        
        var currentNode: ListNode? = self
        repeat {
            result += currentNode!.val * factor
            factor *= 10
            currentNode = currentNode?.next
        } while currentNode != nil
        
        return String(result)
    }
}

public class List {
    public var head: ListNode?
    
    init(node: ListNode) {
        head = node
    }
    
    init(_ value: Int) {
        head = ListNode(value)
    }
    
    func append(newNode: ListNode) -> List {
        
        if var currentNode = head {
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            currentNode.next = newNode
        } else {
            head = newNode
        }
        return self
    }
    
    func append(_ value: Int) -> List {
        return self.append(newNode: ListNode(value))
    }
}


extension List: CustomStringConvertible {
  public var description: String {
    var factor = 1
    var result = 0
    
    guard let _ = head else {
        return "List is nil!"
    }
    
    var currentNode = head
    repeat {
        result += currentNode!.val * factor
        factor *= 10
        currentNode = currentNode!.next
    } while currentNode != nil
    
     return String(result)
  }
}



class SolutionOne {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, curr = dummyHead
        var carry = 0
        while(p != nil || q != nil) {
            let x = (p != nil) ? p!.val : 0
            let y = (q != nil) ? q!.val : 0
            let sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if p != nil {
                p = p?.next
            }
            if q != nil {
                q = q?.next
            }
        }
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        return dummyHead.next
    }
}

class SolutionTwo {
    // 该方法在一的基础上进行改进，两条链长度差距越大相对优势越明显。
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var p = l1, q = l2, curr = dummyHead
        var carry = 0
        while(p != nil && q != nil) {
            let x = (p != nil) ? p!.val : 0
            let y = (q != nil) ? q!.val : 0
            let sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if p != nil {
                p = p?.next
            }
            if q != nil {
                q = q?.next
            }
        }
        
        var r = p ?? q
        
        if r == nil {
            if carry > 0 {
                curr.next = ListNode(carry)
            }
            return dummyHead.next
        }
        
        if carry > 0 {
            while(r != nil) {
                let z = (r != nil) ? r!.val : 0
                let sum = carry + z
                carry = sum / 10
                curr.next = ListNode(sum % 10)
                curr = curr.next!
                if carry == 0 {
                    curr.next = r?.next
                    return dummyHead.next
                } else {
                    r = r?.next
                    if r == nil {
                        if carry > 0 {
                            curr.next = ListNode(carry)
                        }
                        return dummyHead.next
                    }
                }
            }
        } else {
            curr.next = r
        }
        
        return dummyHead.next
    }
}


let l1 = List(1)
print(l1.description)

let l2 = List(9).append(7).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9).append(9)
print(l2.description)

let solutionOne = SolutionOne()
let start1 = CACurrentMediaTime()
if let n3 = solutionOne.addTwoNumbers(l1.head, l2.head) {
    let end = CACurrentMediaTime()
    print("Solution 1 测量时间：\(end - start1)")
    let l3 = List(node: n3)
    print(l3.description)
}

let solutionTwo = SolutionTwo()
let start2 = CACurrentMediaTime()
if let n3 = solutionTwo.addTwoNumbers(l1.head, l2.head) {
    let end = CACurrentMediaTime()
    print("Solution 2 测量时间：\(end - start2)")
    print(n3.description)
}
