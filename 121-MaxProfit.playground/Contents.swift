import Cocoa

class Solution1 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else {
            return 0
        }
        var maxProfit = 0
        var minPrice = prices.first!
        
        for n in prices {
            if n - minPrice > maxProfit {
                maxProfit = n - minPrice
            } else if n < minPrice {
                minPrice = n
            }
        }
        return maxProfit
    }
}

class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else {
            return 0
        }
        
        var maxProfit = 0
        var minPrice = prices.first!
        
        prices.forEach { price in
            if price - minPrice > maxProfit {
                maxProfit = price - minPrice
            }
            if price < minPrice {
                minPrice = price
            }
        }
        
        return maxProfit
    }
}



let prices = [7, 1, 5, 3, 6, 4]
let s = Solution1()
let maxProfit = s.maxProfit(prices)

