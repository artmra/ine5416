cabeca :: [Int] -> Int
cabeca (a:_) = a
cauda :: [Int] -> [Int]
cauda (_:b) = b
menor :: [Int] -> Int
menor [] = 0
menor (a:b) = 
    if a < (cabeca b) then 
        if length (cauda b) > 0 then 
            menor (a:(cauda b))
        else 
            a
    else
        if length (cauda b) > 0 then
            menor b
        else 
            cabeca b
main = do
    print("Teste do metodo, ele ira somar todos os elementos de uma lista pre determinada: ")
    let vetor = 2:4:8:9:10:11:(-1):1:(-100):1000:20:[]
    print(vetor)
    print("Menor elemento da lista criada: ")
    print(menor vetor)