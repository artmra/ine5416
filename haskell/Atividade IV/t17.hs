dividir :: Int -> Int -> Int
dividir a b = if ((mod a b) == 0) then b else dividir b (mod a b)

mdc :: Int -> Int -> Int
mdc a b = if b < a then dividir a b else dividir b a

fi :: Int -> Int -> Int
fi n i = if i > 1 then (if mdc n i == 1 then 1 + (fi n (i - 1)) else fi n (i - 1)) else 1

ehPrimo :: Int -> String
ehPrimo n = if (n == (fi n (n-1)) + 1) then "Esse numero eh primo" else "Esse numero nao eh primo"
main = do
    print("Insira um numero para verificar se o mesmo eh primo: ")
    n <- getLine
    let nInt = (read n :: Int)
    print(ehPrimo nInt)