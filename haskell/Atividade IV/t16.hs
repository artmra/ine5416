ehDivisivel :: Int -> Int -> String
ehDivisivel a b = if a > b then (if mod a b == 0 then "Eh divisivel" else "Nao eh divisivel") else (if mod b a == 0 then "Eh divisivel" else "Nao eh divisivel")

main = do
    print("Insira o valor de a: ")
    a <- getLine
    let aInt = (read a :: Int)
    print("Insira o valor de b: ")
    b <- getLine
    let bInt = (read b :: Int)
    print(ehDivisivel aInt bInt)