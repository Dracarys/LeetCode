import Cocoa

// 暴力算法：时间杂度 O(n**n)。递归调用函数 n**n次，空间杂度 O(n)
class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        return calculate(prices: prices, s: 0)
    }
    
    func calculate(prices: [Int], s: Int) -> Int {
        if s >= prices.count {
            return 0
        }
        var max = 0
        for start in s..<prices.count {
            var maxProfit = 0
            for i in (start + 1)..<prices.count {
                if prices[start] < prices[i] {
                    let profit = calculate(prices: prices, s: i + 1) + prices[i] - prices[start]
                    if profit > maxProfit {
                        maxProfit = profit
                    }
                }
            }
            if maxProfit > max {
                max = maxProfit
            }
        }
        return max
    }
}

class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var i = 0
        var valley = prices[0]
        var peak = prices[0]
        var maxprofit = 0
        while i < prices.count - 1 {
            while i < prices.count - 1 && prices[i] >= prices[i + 1] {
                i += 1
            }
            valley = prices[i]
            while i < prices.count - 1 && prices[i] <= prices[i + 1] {
                i += 1
            }
            peak = prices[i]
            maxprofit += peak - valley
        }
        return maxprofit
    }
}

/*
 * 对于递增的数列，最高点和最低点的差等于每次递增之和
 * 所以解决此类问题时，无需考虑去寻求最高点，只要逐级增加上去即可。
 */
class Solution3 {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i - 1] {
                maxProfit += prices[i] - prices[i - 1]
            }
        }
        return maxProfit
    }
}

// 相对 3 逻辑无变化，只是利用了 Swift 的特点，效率无变化
class Solution4 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0
        for i in 1..<prices.count where prices[i] > prices[i - 1] {
            maxProfit += prices[i] - prices[i - 1]
        }
        return maxProfit
    }
}


let prices = [7, 1, 5, 3, 4, 8]
let s = Solution4()
s.maxProfit(prices)
