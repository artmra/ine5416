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
    print ((\a b c -> if a > b && b > c then a else if b > c then b else c) a b c)