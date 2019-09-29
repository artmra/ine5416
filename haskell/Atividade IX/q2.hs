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

    let estah_aprovado = \a b c -> if (a + b + c)/3 >= 6 then "Aprovado" else "Reprovado"
    
    print(estah_aprovado a b c)