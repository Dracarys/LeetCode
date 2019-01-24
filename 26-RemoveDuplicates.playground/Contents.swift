import Cocoa

class Solution1 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var sortedIndex = 1
        var preValue = nums[0];
        for i in 1..<nums.count {
            let n = nums[i]
            if n != preValue {
                if  i - sortedIndex >= 1  {
                    nums[sortedIndex] = n
                }
                 sortedIndex += 1
            }
            preValue = n
        }
        
        return sortedIndex
    }
}

class Solution2 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count==0 {return 0}
        var i = 0
        for j in 1..<nums.count {
            if nums[j] == nums[i] {
                continue
            }
            else {
                i+=1
                nums[i]=nums[j]
            }
        }
        return i + 1
    }
}


var nums = [0,1,2,3,4,5,6,7,8,9]

let s = Solution2()
let result = s.removeDuplicates(&nums)
nums
