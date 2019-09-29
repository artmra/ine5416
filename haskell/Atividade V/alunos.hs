aprovados :: [(Int, String, Float)] -> [String]
aprovados lista = map getNome (filter estahAprovado lista)

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 (a:b) =
    if (estahAprovado a) then
        if length b > 0 then
            (getNome a) : (aprovados2 b)
        else
            [getNome a]
    else
        if length b > 0 then
            (aprovados2 b)
        else
            []


alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

estahAprovado :: (Int, String, Float) -> Bool
estahAprovado (a, b, c) = if c >= 6 then True else False


getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [t] -> [u] -> [(t,u)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2]

main = do
    print (getPrimeiroAluno alunos)
    print (aprovados alunos)
    print (aprovados2 alunos)