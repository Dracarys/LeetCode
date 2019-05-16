import Cocoa

// 完全不用🧠的解法
class Solution {
    func myAtoi(_ str: String) -> Int {
        guard !str.isEmpty else { return 0 }
        
        let trimedStr = str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)

        var signed = 1;
        var nums = [Int]();
        
        for (i, c) in trimedStr.enumerated() {
            let s = c.unicodeScalars.first!
            if i == 0 {
                if s.value == 45 {
                signed = -1;
                    continue
                } else if s.value == 43{
                    signed = 1;
                    continue
                }
            }
            if s.value > 47 &&  s.value < 58 {
                if s.value == 48  && nums.count == 0 {
                    continue
                }
                nums.append(Int(s.value - 48))
            } else if nums.count > 0 {
                break
            } else {
                return 0
            }
        }
        if nums.count > 10 {
            if signed  < 0 { return Int(Int32.min) }
            return Int(Int32.max)
        }
        var result = 0;
        for (i, n) in nums.enumerated() {
            if result == 0 && n == 0 { continue }
            var factor = 1
            for _ in 0..<nums.count - i - 1 {
                factor *= 10;
            }
            result += n * factor
        }
        result *= signed
        if signed < 0 {
            return max(result, Int(Int32.min))
        }
        
        return min(result, Int(Int32.max))
    }

}


