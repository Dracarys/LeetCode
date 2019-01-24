import Cocoa

class Solution1 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic1 = [Int: Int]()
        for n in nums1 {
            if let k = dic1[n] {
                dic1[n] = k + 1
            } else {
                dic1[n] = 1
            }
        }

        var dic2 = [Int: Int]()
        for n in nums2 {
            if let k = dic2[n] {
                dic2[n] = k + 1
            } else {
                dic2[n] = 1
            }
        }

        let set = Set(nums1).intersection(Set(nums2))
        
        var dic = [Int: Int]()
        for n in set {
            let count1 = dic1[n]!
            let count2 = dic2[n]!
            dic[n] = count1 < count2 ? count1 : count2
        }
        
        var result = [Int]()
        for (key, n) in dic {
            for _ in 0..<n {
                result.append(key)
            }
        }
        
        return result
    }
}

class Solution2 {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dic1 = [Int: Int]()
        for n in nums1 {
            if let k = dic1[n] {
                dic1[n] = k + 1
            } else {
                dic1[n] = 1
            }
        }
        
        var result = [Int]()
        for num in nums2 {
            if let n = dic1[num], n >= 1 {
                result.append(num)
                dic1[num] = n - 1
            }
        }
        
        return result
    }
}

let nums1 = [1,2,2,1], nums2 = [2, 2]
let s = Solution2()
s.intersect(nums1, nums2)
