dividir :: Int -> Int -> Int
dividir a b = if ((mod a b) == 0) then b else dividir b (mod a b)
mdc :: Int -> Int -> Int
mdc a b = if b < a then dividir a b else dividir b a
ehCoprimo :: Int -> String
ehCoprimo n = if n == 1 then "Esses numeros sao coprimos" else "Esses numeros nao sao coprimos"

main = do
    print("Insira o valor de a: ")
    a <- getLine
    let aInt = (read a :: Int)
    print("Insira o valor de b: ")
    b <- getLine
    let bInt = (read b :: Int)
    print(ehCoprimo (mdc aInt bInt))