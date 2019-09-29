-- feito
main = do 
    putStrLn "a:"
    r <- getLine
    let a = (read r :: Float)
    putStrLn "b:"
    r <- getLine
    let b = (read r :: Float)
    putStrLn "c:"
    r <- getLine
    let c = (read r :: Float)

    let bhaskara = \a b c -> ((-b + (sqrt (b^2 - 4 * a * c)))/(2*a), (-b - (sqrt (b^2 - 4 * a * c)))/(2*a))

    print (bhaskara a b c)
