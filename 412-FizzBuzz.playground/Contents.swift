import Cocoa

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for i in 1...n {
            if i % 3 == 0 {
                if i % 5 == 0 {
                    result.append("FizzBuzz")
                } else {
                    result.append("Fizz")
                }
                continue
            }
            if i % 5 == 0 {
                result.append("Buzz")
                continue
            }
            result.append(String(i))
        }
        return result
    }
}

class Solution1 {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = [String]()
        for i in 1...n {
            if i % 15 == 0 {
                result.append("FizzBuzz")
                continue
            }
            if i % 3 == 0 {
                result.append("Fizz")
                continue
            }
            if i % 5 == 0 {
                result.append("Buzz")
                continue
            }
            result.append(String(i))
        }
        return result
    }
}

let s = Solution()
let result = s.fizzBuzz(15)
print(result.description)
