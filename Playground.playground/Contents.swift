import Cocoa

func fib (_ n: Int) -> Int {
    if n < 2 {
        return n
    }
    return fib(n - 1) + fib(n - 2)
}

fib(5)


func test(_ i: Int, _ j: Int) -> Int {
    if i <= 0 || j <= 0 {
        return 1
    }
    return 2 * test(i - 3, j / 2)
}

test(15, 20)

round(11.56)
