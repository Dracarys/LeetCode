import Cocoa

class SolutionWrong {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
        if nums1.count == 0 {
            if nums2.count % 2 == 0 {
                let median = nums2.count/2
                return (Double(nums2[median]) + Double(nums2[median - 1])) / 2.0
            } else {
                return Double(nums2[nums2.count / 2])
            }
        }
        if nums2.count == 0 {
            if nums1.count % 2 == 0 {
                let median = nums1.count/2
                return (Double(nums1[median]) + Double(nums1[median - 1])) / 2.0
            } else {
                return Double(nums1[nums2.count / 2])
            }
        }

        var nums = [Int]()
        var index = 0
        for i in 0..<min(nums1.count, nums2.count) {
            if nums1[i] < nums2[i] {
                nums.append(nums1[i])
                nums.append(nums2[i])
            } else {
                nums.append(nums2[i])
                nums.append(nums1[i])
            }
            index = i
        }
        
        if nums1.count != nums2.count {
            let nums3 = nums1.count > nums2.count ? nums1 : nums2
            nums.append(contentsOf: nums3.suffix(from: index + 1))
        }
        
        if nums.count % 2 == 0 {
            let median = nums.count/2
            return (Double(nums[median]) + Double(nums[median - 1])) / 2.0
        } else {
            return Double(nums[nums.count / 2])
        }
    }
}

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        
    }
}


