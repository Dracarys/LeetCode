import Cocoa

class Solution {
    
    func isPalindrome(num: Int) -> Bool {
        /*
         * 特殊情况：
         * 1、负数全部都不是回文
         * 2、个位数为 0 的也不可能是回文，否则高位必须也是 0
         * 3、同上 0 本身是，必须排除
         */
        if num < 0 || (num % 10 == 0 && num != 0) {
            return false
        }
        
        var x = num
        var revertedNumber = 0
        // 如果剩余部分小于已转部分，则说明翻转位数已过半，可以进行比较判断了
        while x > revertedNumber {
            revertedNumber = revertedNumber * 10 + x % 10
            x /= 10
        }
        // 偶数位数字判断：奇数位数字判断
        return x == revertedNumber || x == revertedNumber / 10
    }
    
    func revert(integer: Int) -> Int {
        var x = integer
        var nagative = false
        if (x < 0) {
            nagative = true
            x *= -1
        }
        
        var result = 0
        while(x > 0) {
            let temp = x % 10
            result = result * 10 + temp
            x /= 10
        }
        // 这里是存在溢出风险的，因为数字无限而存储空间有限
        if (result > Int.max) {
            return 0
        }
        
        if nagative {
            result *= -1
        }
        
        return result
    }
}

let s = Solution()

s.isPalindrome(num: 1000000000001)

