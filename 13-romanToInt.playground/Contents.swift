import Cocoa

class Solution {
    let romanDic = ["I": 1,
                    "V": 5,
                    "X": 10,
                    "L": 50,
                    "C": 100,
                    "D": 500,
                    "M": 1000]
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var result = 0
        var letters = [String]()
        for c in s {
            letters.append(String(c))
        }
        print(letters.description)
        
        for i in 0..<letters.count {
            if let num1 = romanDic[letters[i]] {
                if i + 1 < letters.count, let num2 = romanDic[letters[i + 1]], num1 < num2{
                    result -= num1
                } else {
                    result += num1
                }
            } else {
                return 0
            }
        }
        return result
    }
}

class Solution1 {
    static let romanDic:[Character: Int] = ["I": 1,
                                            "V": 5,
                                            "X": 10,
                                            "L": 50,
                                            "C": 100,
                                            "D": 500,
                                            "M": 1000]
                    
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var result = 0
        let letters = Array(s)
        
        for i in 0..<letters.count {
            if let num1 = Solution1.romanDic[letters[i]] {
                if i + 1 < letters.count, let num2 = Solution1.romanDic[letters[i + 1]], num1 < num2{
                    result -= num1
                } else {
                    result += num1
                }
            } else {
                return 0
            }
        }
        return result
    }
}

let s = Solution1()
s.romanToInt("XII")
