import Cocoa

class Solution {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
// 暴力遍历算法，时间杂度 O(n²)、空间杂度 O(1)
//        var result:[Int] = []
//
//        for i in 0..<nums.count {
//            if !result.isEmpty {
//                break
//            }
//            let numX = nums[i]
//
//            for j in (i + 1)..<nums.count {
//                let numY = nums[j]
//                if (numX + numY) == target {
//                    result.append(i)
//                    result.append(j)
//                }
//            }
//        }
//        return result
        
        
// 因为题目限定了只有一组解，所以可以利用哈希表的方式空间换时间，提高效率
// 时间杂度 O(n)，空间杂度 O(n)
//        var dic = [Int: Int]()
//        for i in 0..<nums.count {
//            dic.updateValue(i, forKey: nums[i])
//        }
//        print(dic.description)
//        for i in 0..<nums.count {
//            let num = target - nums[i]
//            if dic.keys.contains(num) && dic[num] != i{
//                return [i, dic[num]!]
//            }
//        }
//        return []

// 对上一种算法的优化，减少一次循环，且除非最坏，否则空间杂度不会是 O(n), 时间杂度 O(n)
        var dic = [Int: Int]()
        for i in 0..<nums.count {
            let num = target - nums[i]
            if dic.keys.contains(num) {
                return [dic[num]!, i]
            }
            dic.updateValue(i, forKey: nums[i])
        }
        return []
    }
}

let nums = [3, 2, 4]

let solution = Solution()
solution.twoSum(nums, 6)
