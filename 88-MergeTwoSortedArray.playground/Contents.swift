import Cocoa

class Solution1 {
    // 正序合并，插入还会导致之后的元素整体移动，所以非常耗时，最坏O(nm2)，最好是O(nm)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var count = m
        
        for num2 in nums2 {
            var flag = false
            for (i, num1) in nums1.enumerated()  {
                if num2 < num1 {
                    nums1.insert(num2, at: i)
                    nums1.popLast()
                    count += 1
                    flag = true
                    break;
                }
            }
            if !flag {
                nums1[count] = num2
                count += 1
            }
        }
    }
}

class Solution2 {
    // 由于nums1合并后的空间已经在尾部预设，所以倒序合并只需一次遍历即可，O(m+n)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastIndex1 = m - 1
        var lastIndex2 = n - 1
        
        while lastIndex1 >= 0 || lastIndex2 >= 0 {
            if lastIndex2 < 0 {
                break
            }
        
            if lastIndex1 < 0 {
                nums1[lastIndex1 + lastIndex2 + 1] = nums2[lastIndex2]
                lastIndex2 -= 1
            } else if nums1[lastIndex1] < nums2[lastIndex2] {
                nums1[lastIndex1 + lastIndex2 + 1] = nums2[lastIndex2]
                lastIndex2 -= 1
            } else {
                nums1[lastIndex1 + lastIndex2 + 1] = nums1[lastIndex1]
                lastIndex1 -= 1
            }
        }
    }
}

class Solution3 {
    // 由于nums1合并后的空间已经在尾部预设，所以倒序合并只需一次遍历即可，O(m+n)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var lastIndex1 = m - 1
        var lastIndex2 = n - 1
        
        while lastIndex1 >= 0 || lastIndex2 >= 0 {
            // n 不存在等于 0 的情况，否则不用合并了，因此此判断在逻辑上是多余；
            // 但是，实际应用中，n = 0 的情况是客观存在的。
            if lastIndex2 < 0 {
                break
            }
            // ⚠️注意：边界问题，lastIndex == 0 也是合法的
            if lastIndex1 >= 0  && nums1[lastIndex1] > nums2[lastIndex2] {
                nums1[lastIndex1 + lastIndex2 + 1] = nums1[lastIndex1]
                lastIndex1 -= 1
            } else {
                nums1[lastIndex1 + lastIndex2 + 1] = nums2[lastIndex2]
                lastIndex2 -= 1
            }
        }
    }
}


var nums1 = [2,0]
let nums2 = [1]

let s = Solution3()
s.merge(&nums1, 1, nums2, 1)
nums1
