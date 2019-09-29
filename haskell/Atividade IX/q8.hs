type Matrix = ([[Int]])

criar_linha :: Int -> (Int, Int) -> ((Int, Int) -> Int) -> [Int]
criar_linha j (row, colnum) f = if j < colnum then [f (row, j)] ++ criar_linha (j+1) (row, colnum) f else []

matrix :: Int -> (Int, Int) -> ((Int, Int) -> Int) -> Matrix
matrix i (rownum, colnum) f =
    if i < rownum then
        [criar_linha 0 (i, colnum) f] ++ matrix (i+1) (rownum, colnum) f
    else
        []

soma_elementos_linha :: [Int] -> Int
soma_elementos_linha [] = 0
soma_elementos_linha (a:b) = a + soma_elementos_linha b

soma_elementos_matriz :: Matrix -> Int
soma_elementos_matriz ([]) = 0
soma_elementos_matriz ((a:b):c) = soma_elementos_linha (a:b) + soma_elementos_matriz c

main = do
    let a = matrix 0 (4, 4) $ \(i, j) -> (i+j)
    print (a)
    print (soma_elementos_matriz a)
