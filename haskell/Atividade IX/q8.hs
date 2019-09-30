type Matrix = ([[Int]])

matrix_unica :: Matrix
matrix_unica = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15]]

matrix_repetida :: Matrix
matrix_repetida = [[1, 2, 3, 4], [5, 6, 7, 2], [9, 1, 11, 12], [2, 3, 4, 9]]

matrix_magica :: Matrix
matrix_magica = [[2, 7, 6], [9, 5, 1], [4, 3, 8]]

-- _________________________________________________________________________________________________________________________________________

criar_linha :: Int -> (Int, Int) -> ((Int, Int) -> Int) -> [Int]
criar_linha j (row, colnum) f = if j < colnum then [f (row, j)] ++ criar_linha (j+1) (row, colnum) f else []

matrix :: Int -> (Int, Int) -> ((Int, Int) -> Int) -> Matrix
matrix i (rownum, colnum) f =
    if i < rownum then
        [criar_linha 0 (i, colnum) f] ++ matrix (i+1) (rownum, colnum) f
    else
        []

-- _________________________________________________________________________________________________________________________________________


soma_elementos_linha :: [Int] -> Int
soma_elementos_linha [] = 0
soma_elementos_linha (a:b) = a + soma_elementos_linha b

soma_elementos_linha_n :: Int -> Int -> Matrix -> Int
soma_elementos_linha_n _ _ [] = 0
soma_elementos_linha_n i rownum (a:b) = if i == rownum then soma_elementos_linha a else soma_elementos_linha_n (i+1) rownum b

soma_elementos_coluna :: Int -> Int -> Matrix -> Int
soma_elementos_coluna _ _ [] = 0
soma_elementos_coluna j colnum ((a:b):c) = if j == colnum then a + soma_elementos_coluna 0 colnum c else soma_elementos_coluna (j+1) colnum (b:c)

-- _________________________________________________________________________________________________________________________________________

soma_elementos_matriz :: Matrix -> Int
soma_elementos_matriz ([]) = 0
soma_elementos_matriz ((a:b):c) = soma_elementos_linha (a:b) + soma_elementos_matriz c

soma_elementos_linhas :: [Int] -> [Int] -> Int
soma_elementos_linhas [] _ = 0
soma_elementos_linhas (a_1:b_1) (a_2:b_2) = a_1 + a_2 + soma_elementos_linhas b_1 b_2

soma_elementos_matrizes :: Matrix -> Matrix -> Int
soma_elementos_matrizes ([]) _ = 0
soma_elementos_matrizes ((a_1:b_1):c_1) ((a_2:b_2):c_2) = soma_elementos_linhas (a_1:b_1) (a_2:b_2) + soma_elementos_matrizes c_1 c_2

-- _________________________________________________________________________________________________________________________________________

linha_possui_elemento :: Int -> [Int] -> Bool
linha_possui_elemento _ [] = False
linha_possui_elemento x (a:b) = if a == x then True else linha_possui_elemento x b

verificar_unicidade_elemento :: Int -> Matrix -> Bool
verificar_unicidade_elemento _ [] = True
verificar_unicidade_elemento x (a:b) = if linha_possui_elemento x a == True then False else verificar_unicidade_elemento x b

verificar_unicidade_elementos :: Matrix -> Bool
verificar_unicidade_elementos [] = True
verificar_unicidade_elementos ([]:c) = verificar_unicidade_elementos c
verificar_unicidade_elementos ((a:b):c) = if verificar_unicidade_elemento a (b:c) == True then verificar_unicidade_elementos (b:c) else False

verificar_soma_linhas :: Int -> Int -> Int -> Matrix -> Bool
verificar_soma_linhas i rownum soma_linha matriz = 
    if i < rownum then
        if soma_linha == soma_elementos_linha_n 0 i matriz then 
            verificar_soma_linhas (i+1) rownum soma_linha matriz 
        else False 
    else True

verificar_soma_colunas :: Int -> Int -> Int -> Matrix -> Bool
verificar_soma_colunas j colnum soma_coluna matriz =
    if j < colnum then
        if soma_coluna == soma_elementos_coluna 0 j matriz then
            verificar_soma_colunas (j+1) colnum soma_coluna matriz
        else False
    else True

soma_diagonal_pricipal :: Int -> Int -> Matrix -> Int
soma_diagonal_pricipal _ _ [] = 0
soma_diagonal_pricipal i row_col ((a:b):c) = if i == row_col then a + soma_diagonal_pricipal 0 (row_col + 1) c else soma_diagonal_pricipal (i+1) row_col (b:c)

soma_diagonal_secundaria :: Int -> Int -> Matrix -> Int
soma_diagonal_secundaria _ _ [] = 0
soma_diagonal_secundaria i row_col ((a:b):c) = if i == row_col then a + soma_diagonal_secundaria 0 (row_col - 1) c else soma_diagonal_secundaria (i+1) row_col (b:c)

eh_quadrado_magico :: Matrix -> Bool
eh_quadrado_magico matriz = if  verificar_unicidade_elementos matriz == True && 
                                verificar_soma_linhas 0 (length(matriz)) (soma_elementos_linha_n 0 0 matriz) matriz == True &&
                                verificar_soma_colunas 0 (length(matriz)) (soma_elementos_coluna 0 0 matriz) matriz == True &&
                                soma_diagonal_pricipal 0 0 matriz == soma_diagonal_secundaria 0 (length(matriz) - 1) matriz then True else False

-- _________________________________________________________________________________________________________________________________________
linha_obdece_regra :: Int -> Int -> Int -> [Int] -> Bool
linha_obdece_regra n_1 n_0 colnum [] = if n_1 == 1 && n_0 == (colnum - 1) then True else False
linha_obdece_regra n_1 n_0 colnum (a:b) = if a == 1 && n_1 == 0 then linha_obdece_regra (n_1 + 1) n_0 colnum b else if a == 0 then linha_obdece_regra n_1 (n_0 + 1) colnum b else False

eh_matriz_permutacao :: Int -> Matrix -> Bool
eh_matriz_permutacao _ [] = True
eh_matriz_permutacao row_col_num (a:b) = if linha_obdece_regra 0 0 row_col_num a == True then eh_matriz_permutacao row_col b else False

-- _________________________________________________________________________________________________________________________________________
percorrer_linha :: Int -> Int -> Int -> [Int] -> Matrix -> [Int]
percorrer_linha i j n (a:b) = 
    if a == 0 then
        if () then
            
        else
    else

percorrer_matriz :: Int -> Int -> Matrix -> Matrix
percorrer_matriz i j (a:b)  = ([percorrer_linha]:(percorrer_matriz (i+1) j b))

main = do
    let a = matrix 0 (4, 4) $ \(i, j) -> (i+j)
    let b = matrix 0 (4, 4) $ \(i, j) -> (i+j)
    print (a)
    print (b)
    print (soma_elementos_matriz a)
    print (soma_elementos_matrizes a b)
    print (eh_quadrado_magico a)
    print (eh_quadrado_magico matrix_magica)

