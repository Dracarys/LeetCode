import Cocoa

// 投机取巧的写法，直接应用来Swift提供的随机算法
class Solution1 {
    
    let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        return nums.shuffled()
    }
}

// 该问题是典型的洗牌问题，即随机打乱手头组合
class Solution2 {
    
    let nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return nums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var result = nums
        for i in 0..<nums.count {//依次取出
            let randomNum = Int.random(in: 0...i)
            // 与之前的数随机交换
            result.swapAt(i, randomNum)
        }
        return result
    }
}

let nums = [1, 2, 3, 4]
let s = Solution2(nums)
let ret_1: [Int] = s.reset()
let ret_2: [Int] = s.shuffle()

