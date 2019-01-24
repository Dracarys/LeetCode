import Cocoa

class Solution1 {
    
    func reverse(_ x: Int) -> Int {
        var y = x
        var negative = false
        if y < 0 {
            negative = true
            y = y * -1
        }
        
        var result = 0
        while y > 0 {
            //虽然通过了，但是这里有问题，低位环境，这里一步直接就已经溢出了。
            //因此要将溢出判断移至此处
            result = result * 10 + y % 10
            y /= 10
        }
        
        // 溢出点在上面的循环中，所以这里的判断无意义，而且可移植性不强
        if result > Int32.max || result < Int32.min {
            return 0
        }
        
        return negative ? result * -1 : result
    }
}

// 这个方案虽然解决了溢出问题，但是可移植性仍不够强
class Solution2 {
    
    func reverse(_ x: Int) -> Int {
        var y = x
        var result = 0
        while y != 0 {
            let carry = y % 10
            // 因为32位最大值是2147483647，个位数是7，所以要判断carry是否大于7
            if result > Int32.max/10 || (result == Int.max/10 && carry > 7) {
                return 0
            }
            // 因为32位最小值是-2147483648，个位数是-8，所以要判断carry是否小于-8
            if result < Int32.min/10 || (result == Int.min/10 && carry < -8) {
                return 0
            }
            result = result * 10 + carry
            y /= 10
        }
        
        return result
    }
}

class Solution3 {
    
    func reverse(_ x: Int) -> Int {
        var y = x
        var result = 0
        while y != 0 {
            let carry = y % 10
            // 让Int随平台编译环境而变化
            if result > Int.max/10 || (result == Int.max/10 && carry > Int.max%10) {
                return 0
            }
            // 理由同上
            if result < Int.min/10 || (result == Int.min/10 && carry < Int.min%10) {
                return 0
            }
            result = result * 10 + carry
            y /= 10
        }
        
        return result
    }
}

let s = Solution3()
s.reverse(-1234567891234567899)

