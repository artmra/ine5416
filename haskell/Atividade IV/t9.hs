somaCoordenada :: [Float] -> [Float] -> Float
somaCoordenada [] [] = 0
somaCoordenada (a1:b1) (a2:b2) = (a2 - a1)**2 + somaCoordenada b1 b2

distPtos :: [Float] -> [Float] -> Float
distPtos v1 v2 = (somaCoordenada v1 v2)**(1/2)

main = do
    print("Insira o valor da 1 cordenada do 1 vetor: ")
    a1 <- getLine
    let a1Int = (read a1 :: Float)
    print("Insira o valor da 2 cordenada do 1 vetor: ")
    b1 <- getLine
    let b1Int = (read b1 :: Float)
    print("Insira o valor da 3 cordenada do 1 vetor: ")
    c1 <- getLine
    let c1Int = (read c1 :: Float)
    print("Insira o valor da 1 cordenada do 2 vetor: ")
    a2 <- getLine
    let a2Int = (read a2 :: Float)
    print("Insira o valor da 2 cordenada do 2 vetor: ")
    b2 <- getLine
    let b2Int = (read b2 :: Float)
    print("Insira o valor da 3 cordenada do 2 vetor: ")
    c2 <- getLine
    let c2Int = (read c2 :: Float)
    let v1 = a1Int:b1Int:c1Int:[]
    let v2 = a2Int:b2Int:c2Int:[]
    print(distPtos v1 v2)
    