import Cocoa

class Solution1 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var nums = digits
        let last = digits.last! + 1
        nums[nums.count - 1] = last % 10
        var carry = last / 10
        if carry == 0 {
            return nums
        }
        
        for i in 1..<nums.count {
            let index = nums.count - i - 1
            let result = nums[index] + carry
            nums[index] = result % 10
            carry = result / 10
            if carry == 0 {
                return nums
            }
        }
        if carry > 0 {
            nums.insert(carry, at: 0)
        }
        return nums
    }
}

class Solution2 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var nums = [Int](digits.reversed())
        let result = nums[0] + 1
        nums[0] = result % 10
        var carry = result / 10
        if carry == 0 {
            return nums.reversed()
        }
        for i in 1..<nums.count {
            let result = nums[i] + carry
            nums[i] = result % 10
            carry = result / 10
            if carry == 0 {
                return nums.reversed()
            }
        }
        if carry > 0 {
            nums.append(carry)
        }
        return nums.reversed()
    }
}

let nums = [9, 9, 9]
let s = Solution2()
s.plusOne(nums)
