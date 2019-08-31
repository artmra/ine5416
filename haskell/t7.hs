fibonacci :: int -> int
fibonacci n = if (n <= 1) then 1 else (fibonacci n - 1) + (fibonacci n - 2)

main = do
    print("Insira a posição do n-ésimo número da sequência de Fibonnaci que você deseja calcular: ")
    n <- getLine
    let nInt = (read n :: Int)
    print (fibonacci nInt)