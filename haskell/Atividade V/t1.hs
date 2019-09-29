soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma(b)

main = do
    print("Teste do metodo, ele ira somar todos os elementos de uma lista de 1 ate N. Insira o valor de N: ")
    n <- getLine
    let nInt = (read n :: Int)

    if nInt > 50 then
        print("A soma sera feita, so nao irei imprimir a lista para nao travar o terminal.")
    else
        print(([1..nInt]))
    print("Soma dos elementos da lista criada: ")
    print(soma ([1..nInt]))