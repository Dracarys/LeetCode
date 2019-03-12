 import Cocoa

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var dic = [Int: Int]()
        nums.forEach { (n) in
            if let counter = dic[n] {
                dic[n] = counter + 1
            } else {
                dic[n] = 1
            }
        }
        
        var result = 0
        var counter = 0
        dic.keys.forEach { (k) in
            if let n = dic[k], n > counter {
                result = k
                counter = n
            }
        }
        return result
    }
}

 
// 众数：在数组中出现次数大于 ⌊ n/2 ⌋ 的元素
// 注意⚠️，这种方案只有存在众数的情况下才会返回正确结果，有点废话，这只是相对上面而言的。
class Solution1 {

    func majorityElement(_ nums: [Int]) -> Int {
        var curNum = nums.first!
        var result = 0
        
        nums.forEach { (n) in
            if curNum == n {
                result += 1
            } else {
                result -= 1
                if result < 1 {
                    curNum = n
                    result = 1
                }
            }
        }
        return curNum
    }
}

let nums = [2, 2, 1, 1, 1, 1, 1, 3]
let s = Solution1()
s.majorityElement(nums)
