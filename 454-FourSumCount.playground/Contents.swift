import Cocoa

// 暴力直观，时间负责度O(n4), 空间复杂度O(1)
class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        guard A.count > 0 else { return 0 }
        
        var result = 0
        A.forEach { (a) in
            B.forEach({ (b) in
                C.forEach({ (c) in
                    D.forEach({ (d) in
                        if a + b + c + d == 0 {
                            result += 1
                        }
                    })
                })
            })
        }
        
        return result
    }
}


class Solution1 {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        guard A.count > 0 else { return 0 }
        
        var dic = [Int : Int]()
        A.forEach { (a) in
            B.forEach({ (b) in
                if let r = dic[a + b] {
                    dic[a + b] = r + 1
                } else { // 这个 else 很恶心
                    dic[a + b] = 1
                }
            })
        }
        
        var result = 0
        C.forEach({ (c) in
            D.forEach({ (d) in
                if let r = dic[-(c + d)]{
                    result += r
                }
            })
        })
        
        return result
    }
}


let A = [-1,-1]
let B = [-1,1]
let C = [-1,1]
let D = [1,-1]

let s = Solution1()
s.fourSumCount(A, B, C, D)
