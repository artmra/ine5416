main = do
    
    let fib = \n -> if n < 10 then n + fib n+1 else n
    print(fib 1)
    print(fib 2)
    print(fib 3)
    print(fib 4)
    print(fib 5)
    print(fib 6)
    print(fib 7)
    print(fib 8)
    print(fib 9)