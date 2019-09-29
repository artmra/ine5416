ocorrencias :: [Int] -> Int -> Int
ocorrencias (a:b) c = 
    if a == c then
        if length b > 0 then
            1 + ocorrencias b c
        else
            1
    else 
        if length b > 0 then
            ocorrencias b c
        else
            0

main = do
    print("Teste do metodo, ele ira operar sobre uma lista pre determinda: ")

    let lista = 1:2:4:5:1:10:11:2:7:8:9:9:10:4:6:2:7:9:1:3:5:3:10:11:2:7:8:9:9:10:4:6:2:7:9:1:3:5:3:4:6:2:7:9:1:3:5:3:10:1:2:4:5:1:10:11:2:7:8:9:9:10:4:6:2:7:9:1:3:5:3:10:11:2:7:8:9:9:10:4:6:2:7:9:1:3:5:3:4:6:2:7:9:1:3:5:3:10:110:[]

    print(lista)

    print("Digite um valor qualquer M para verificar a ocorrencia na lista: ")
    m <- getLine
    let mInt = (read m :: Int)

    print("Verificando a ocorrencia do elemento M na lista criada")
    print(ocorrencias lista mInt)