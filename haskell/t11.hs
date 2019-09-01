dividir :: Int -> Int -> Int
dividir a b = if ((mod a b) == 0) then div a b else dividir b (mod a b)
mdc :: Int -> Int -> Int
mdc a b = if b < a then dividir a b else dividir b a

main = do
    print("Insira o valor de a: ")
    a <- getLine
    let aInt = (read a :: Int)
    print("Insira o valor de b: ")
    b <- getLine
    let bInt = (read b :: Int)
    print(mdc aInt bInt)