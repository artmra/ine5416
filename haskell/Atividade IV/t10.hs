maior :: Float -> Float -> Float -> Float
maior a b c = if a > b && a > c then a else if b > c then b else c

main = do
    print("Insira o primeiro numero: ")
    a <- getLine
    let aInt = (read a :: Float)
    print("Insira o segundo numero: ")
    b <- getLine
    let bInt = (read b :: Float)
    print("Insira o terceiro numero: ")
    c <- getLine
    let cInt = (read c :: Float)
    print(maior aInt bInt cInt)