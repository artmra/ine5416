busca :: [Int] -> Int -> Bool
busca (a:b) c = 
    if a == c then
        True
    else
        if length b > 0 then
            busca b c
        else
            False
main = do
    print("Teste do metodo, ele ira criar uma lista de 1 ate N. Insira o valor de N: ")
    n <- getLine
    let nInt = (read n :: Int)

    let lista = [1..nInt]

    if nInt > 50 then
        print("O teste sera feito, so nao irei imprimir a lista para nao travar o terminal.")
    else
        print(lista)

    print("Digite um valor qualquer M para procurar na lista: ")
    m <- getLine
    let mInt = (read m :: Int)

    print("Buscando o elemento M na lista criada")
    print(busca lista mInt)