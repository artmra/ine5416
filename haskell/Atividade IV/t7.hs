fibonacci :: Int -> Int
fibonacci n =
    if n == 0 then
        0
    else
        if n == 1 then
            1
        else
            fibonacci(n - 1) + fibonacci(n - 2)

main = do
    print("Insira a posicao do n-esimo numero da sequencia de Fibonnaci que voce deseja calcular: ")
    n <- getLine
    let nInt = (read n :: Int)
    print (fibonacci nInt)
