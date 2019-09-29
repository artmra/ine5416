-- feito
main = do
   
    putStrLn "n:"
    r <- getLine
    let n = (read r :: Float)
    
    let fib = \n -> if n > 1 then fib(n-1) + fib(n-2) else if n == 1 then 1 else 0
    
    print(fib n)