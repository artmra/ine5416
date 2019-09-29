inverte :: [t] -> [t]
inverte (a:b) =
    if length b > 0 then
        inverte b ++ a:[]
    else
        [a]

main = do
    print("A lista que sera revertida contem numeros de 1 ate N. Insira N: ")
    n <- getLine
    let nInt = (read n :: Int)
    let lista = [1..nInt]
    print(lista)
    print(inverte lista)