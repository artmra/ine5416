dividir :: Int -> Int -> Int
dividir a b = if ((mod a b) == 0) then b else dividir b (mod a b)

mdc :: Int -> Int -> Int
mdc a b = if b < a then dividir a b else dividir b a

fi :: Int -> Int -> Int
fi n i = if i > 1 then (if mdc n i == 1 then 1 + (fi n (i - 1)) else fi n (i - 1)) else 1

ehPrimo :: Int -> Bool
ehPrimo n = if (n == (fi n (n-1)) + 1) then True else False

decomporEmSomaDePrimos :: Int -> Int -> String
decomporEmSomaDePrimos n i = if (mod n 2 > 0) then "Numero invalido" else (if (ehPrimo i == True && ehPrimo(n - i) == True) then show (i) ++ "+" ++ show (n-i) ++ "=" ++ show (n) else decomporEmSomaDePrimos n (i + 1))
main = do
    print("Insira um numero par para verificar quais os numeros primos que quando somados irao resultar nele: ")
    n <- getLine
    let nInt = (read n :: Int)
    print(decomporEmSomaDePrimos nInt 2)