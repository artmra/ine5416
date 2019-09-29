soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma(b)

media :: [Int] -> Float
media [] = 0
media (a:b) = fromIntegral(soma(a:b)) / fromIntegral(length(a:b))

main = do
    print("Teste do metodo, ele ira calcular a media de todos os elementos de uma lista de 1 ate N. Insira o valor de N: ")
    n <- getLine
    let nInt = (read n :: Int)

    if nInt > 50 then
        print("A media sera feita, so nao irei imprimir a lista para nao travar o terminal.")
    else
        print(([1..nInt]))

    print("Media dos elementos da lista criada: ")
    print(media ([1..nInt]))