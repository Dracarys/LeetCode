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

class Solution1 {
    func majorityElement(_ nums: [Int]) -> Int {
        var counter = 1
        var result = nums.first!
        
        for i in 1..<nums.count {
            if result == nums[i] {
                counter += 1
            } else {
                counter -= 1
                if result == 0 {
                    result = nums[i + 1]
                }
            }
        }
        
        return result
    }
}

let nums = [2,2,1,1,1,3,3]
let s = Solution1()
s.majorityElement(nums)
