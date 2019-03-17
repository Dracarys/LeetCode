import Cocoa

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var i = 0
        
        var remainder = 0
        var startPoint = -1
        var second = false
        while i < gas.count {
            remainder += gas[i] - cost[i]
            if remainder < 0 {
                i += 1
                if second || i == gas.count { return -1 }
                remainder = 0
                startPoint = -1
                continue
            }
            
            if startPoint == -1 {
                startPoint = i
            } else if startPoint == i {
                break
            }
            i += 1
            if i == gas.count {
                i = 0
                second = true
            }
        }
        return startPoint
    }
}


class Solution1 {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var step = 0
        
        var remainder = 0
        var startPoint = -1
        while true {
            let index = step % gas.count
            remainder += gas[index] - cost[index]
            if remainder < 0 {
                step += 1
                if step > gas.count { return -1 }
                remainder = 0
                startPoint = -1
                continue
            }
            
            if startPoint == -1 {
                startPoint = index
            } else if startPoint == index {
                break
            }
            step += 1
        }
        return startPoint
    }
}

let gas  = [2,3,4]
let cost = [3,4,3]

let s = Solution()
s.canCompleteCircuit(gas, cost)

