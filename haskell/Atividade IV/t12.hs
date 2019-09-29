dividir :: Int -> Int -> Int
dividir a b = if ((mod a b) == 0) then b else dividir b (mod a b)
mdc :: Int -> Int -> Int
mdc a b = if b < a then dividir a b else dividir b a

main = do
    print("Insira o valor de a: ")
    a <- getLine
    let aInt = (read a :: Int)
    print("Insira o valor de b: ")
    b <- getLine
    let bInt = (read b :: Int)
    print("Insira o valor de c: ")
    c <- getLine
    let cInt = (read c :: Int)
    if aInt > bInt then
        if bInt > cInt then
            print(mdc (mdc aInt bInt) cInt)
        else
            print(mdc (mdc aInt cInt) bInt)
    else 
        if aInt > cInt then
            print(mdc (mdc bInt aInt) cInt)
        else
            print(mdc (mdc bInt cInt) aInt)