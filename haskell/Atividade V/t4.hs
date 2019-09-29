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
maior :: [Int] -> Int
maior [] = 0
maior (a:b) = 
    if a > (cabeca b) then 
        if length (cauda b) > 0 then 
            maior (a:(cauda b))
        else 
            a
    else
        if length (cauda b) > 0 then
            maior b
        else 
            cabeca b

diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor [] = 0
diferencaMaiorMenor vetor = if length(vetor) == 0 then 0 else (maior vetor) - (menor vetor)
main = do
    print("Teste do metodo, ele ira retornar a diferenca entre o maior e menor elemento de uma lista pre determinada: ")
    let vetor1 = 2:4:8:9:10:11:-1:1:100:1000:20:[]
    print(vetor1)
    print("Diferenca entre o maior e o menor elemento da lista : ")
    print(diferencaMaiorMenor vetor1)
