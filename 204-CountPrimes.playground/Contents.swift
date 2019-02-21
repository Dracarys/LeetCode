import Cocoa

// 最简单暴力直接的算法，时间杂度O(n²)
class Solution {
    func countPrimes(_ n: Int ) -> Int {
        guard n >= 2 else { return 0 }
        
        var result = [Int]()
        for i in 1..<n {
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

// 鉴于该题的关键在于如何高效判断是否为质数，所以改写一下原函数

func count(numberOf n: Int, asYouWant:(_ x: Int) -> Bool) -> Int {
    var result = [Int]()
    for i in 1...n {
        if asYouWant(i) {
            result.append(i)
        }
    }
    print(result)
    return result.count
}

print("=========Solution0==============")
let s = Solution()
s.countPrimes(100)

print("=========Solution1==============")
// 自然数 n 肯定不能被大于n/2的自然数整除，所以：
count(numberOf: 100) { (n) -> Bool in
    if n <= 3 { return n > 1 }
    for i in 2...n/2 {
        if n % i == 0 { return false }
    }
    return true
}

print("=========Solution2==============")
/* 12的因子如下：
 * 2 × 6 = 12
 * 3 × 4 = 12
 * 4 × 3 = 12
 * 6 × 2 = 12
 * 可以看到有一半计算其实是没必要的，由此可以看到，其实
 * 只考虑小于等于n的平方根的数即可
 */
count(numberOf: 100) { (n) -> Bool in
    if n <= 3 { return n > 1 }
    let upper = Int(sqrt(Double(n)))
    for i in 2...upper {
        if n % i == 0 { return false }
    }
    return true
}

// 该算法来自维基
class Solution3 {
    func countPrimes(_ n: Int ) -> Int {
        guard n >= 2 else { return 0 }
        
        var isPrime = [Bool](repeating: true, count: n)
        for i in 0..<2 {
            isPrime[i] = false
        }
        
        var step = 2
        // 这里用step * step 取代sqrt函数，目的是提高效率，
        while step * step < n {
            if !isPrime[step] {
                step += 1
                continue
            }
            
            var j = step * step
            while j < n {
                isPrime[j] = false
                j += step
            }
            step += 1
        }
        
        var count = 0
        for i in 2..<n {
            if isPrime[i] { count += 1 }
        }
        return count
    }
}

// 下面连个算法与上面的算法基本思路相同，略有优化。
class Solution4 {
    func countPrimes(_ n: Int ) -> Int {
        if n <= 2 { return 0 }
        if n == 3 { return 1 }
        
        var isPrime = [Bool](repeating: true, count: n)
        var result = n - 2
        
        let upper = Int(sqrt(Double(n)))
        for i in 2...upper {
            var j = i * i
            while j < n {
                if isPrime[j] {
                    isPrime[j] = false
                    result -= 1
                }
                j += i
            }
        }
        return result
    }
}

class SolutionFinal {
    func countPrimes(_ n: Int ) -> Int {
        if n <= 2 { return 0 }
        if n == 3 { return 1 }
        
        var isPrime = [Bool](repeating: true, count: n)
        var result = n - 2
        
        var i = 2
        while i * i < n {
            var j = i * i
            while j < n {
                if isPrime[j] {
                    isPrime[j] = false
                    result -= 1
                }
                j += i
            }
            i += 1
        }
        return result
    }
}

let sf = SolutionFinal2()
sf.countPrimes(100)


