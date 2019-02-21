import Cocoa

// 最简单暴力直接的算法，时间杂度O(n²)
class Solution {
    func countPrimes(_ n: Int ) -> Int {
        var result = [Int]()
        for i in 1...n {
            if isPrimes(i) {
                result.append(i)
            }
        }
        print(result)
        return result.count
    }
    
    private func isPrimes(_ n: Int ) ->Bool {
        if n <= 3 { return n > 1 }
        for i in 2..<n {
            if n % i == 0 {
                return false
            }
        }
        return true
    }
}


let s = Solution()
let result = s.countPrimes(100)




