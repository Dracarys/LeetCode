import Cocoa

// 复习位运算，说明来自 LeetCode-cn @福
// 该算法有越界的风险。
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var  sum: Int, carry: Int
        /**
          异或这里可看做是相加但是不显现进位，比如5 ^ 3
            0 1 0 1
            0 0 1 1
           ---------
            0 1 1 0
          上面的如果看成传统的加法，不就是1+1=2，进1得0，但是这里没有显示
        */
        sum = a ^ b
        /**
          相与为了让进位显现出来，比如5 & 3
            0 1 0 1
            0 0 1 1
           ---------
            0 0 0 1
          上面的最低位1和1相与得1，而在二进制加法中，这里1+1也应该是要进位的，
          所以刚好吻合，但是这个进位1应该要再往前一位，所以左移一位
        */
        carry = (a & b) << 1
        // 还有进位则重复这一过程
        if carry != 0 {
            return getSum(sum, carry)
        }
        return sum
    }
}

let s = Solution()
s.getSum(-5, -3)

