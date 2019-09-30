type Matrix = ([Int])

-- Construtores

magic_matrix :: Matrix
magic_matrix = ([2, 7, 6, 9, 5, 1, 4, 3, 8])

incomplete_magic_matrix :: Matrix
incomplete_magic_matrix = ([2, 0, 0, 9, 0, 1, 0, 3, 0])

null_matrix :: Int -> Matrix
null_matrix n = replicate n 0

-- Método para acessar um elemento em um determinado índice (i, j) da matriz

getElem :: (Int, Int) -> (Int, Int) -> (Int, Int)-> Matrix -> Int
getElem _ _ _ [] = -101010101010101
getElem (i, j) (rownum, colnum) (total_rownum, total_colnum) (a:b) = 
    if i < total_rownum && j < total_colnum then
        if (i * total_colnum + j) == (rownum * total_colnum + colnum) then
            a
        else
            getElem (i, j + 1) (rownum, colnum) (total_rownum, total_colnum) b
    else
        if j < total_colnum then
            getElem (i, j + 1) (rownum, colnum) (total_rownum, total_colnum) (a:b)
        else
            getElem (i+1, 0) (rownum, colnum) (total_rownum, total_colnum) (a:b)

-- Método para alterar um elemento em um determinado índice (i, j) da matriz

setElem :: Int -> (Int, Int) -> (Int, Int) -> (Int, Int) -> Matrix -> Matrix
setElem _ _ _ _ [] = []
setElem new_value (i,j) (rownum, colnum) (total_rownum, total_colnum) (a:b) =
    if i < total_rownum && j < total_colnum then
        if (i * total_colnum + j) == (rownum * total_colnum + colnum) then
            new_value : b
        else
            a : setElem new_value (i, j + 1) (rownum, colnum) (total_rownum, total_colnum) b
           
    else
        if j < total_colnum then
            setElem new_value (i, j + 1) (rownum, colnum) (total_rownum, total_colnum) (a:b)
        else
            setElem new_value (i + 1, 0) (rownum, colnum) (total_rownum, total_colnum) (a:b)
--____________________________________________________________________________________________________________________________________________

-- Método para somar elementos de um linha i da matriz

sum_row :: (Int, Int) -> (Int, Int) -> Matrix -> Int
sum_row (i, j) (total_rownum, total_colnum) matrix = 
    if (j >= total_colnum) then
        0
    else
        getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix + sum_row (i, j + 1) (total_rownum, total_colnum) matrix

-- Método para pegar element de uma linha i

get_row :: (Int, Int) -> (Int, Int) -> Matrix -> [Int]
get_row (i, j) (total_rownum, total_colnum) matrix = 
    if (j >= total_colnum) then
        []
    else
        [getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix] ++ get_row (i, j + 1) (total_rownum, total_colnum) matrix

-- Método para somar elementos de uma coluna j da matriz

sum_col :: (Int, Int) -> (Int, Int) -> Matrix -> Int
sum_col (i, j) (total_rownum, total_colnum) matrix = 
    if (i >= total_rownum) then
        0
    else 
        getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix + sum_col (i + 1, j) (total_rownum, total_colnum) matrix

-- Método para pegar elementos de uma coluna j

get_col :: (Int, Int) -> (Int, Int) -> Matrix -> [Int]
get_col (i, j) (total_rownum, total_colnum) matrix = 
    if (i >= total_rownum) then
        []
    else 
        [getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix] ++ get_col (i + 1, j) (total_rownum, total_colnum) matrix

-- Método para somar elementos da diagonal principal da matriz

sum_main_diagonal :: Int -> (Int, Int) -> Matrix -> Int
sum_main_diagonal i_j (total_rownum, total_colnum) matrix =
    if (i_j >= total_rownum) then
        0
    else
        getElem (0, 0) (i_j, i_j) (total_rownum, total_colnum) matrix + sum_main_diagonal (i_j + 1) (total_rownum, total_colnum) matrix

-- Método para retornar os elementos da diagonal principal

get_main_diagonal :: :: Int -> (Int, Int) -> Matrix -> [Int]
get_main_diagonal i_j (total_rownum, total_colnum) matrix =
    if (i_j >= total_rownum) then
        []
    else
        [getElem (0, 0) (i_j, i_j) (total_rownum, total_colnum) matrix] ++ get_main_diagonal (i_j + 1) (total_rownum, total_colnum) matrix

-- Método para somar elementos da diagonal secundária da matriz

sum_second_diagonal :: (Int, Int) -> (Int, Int) -> Matrix -> [Int]
sum_second_diagonal (i, j) (total_rownum, total_colnum) matrix =
    if (i >= total_rownum) then
        0
    else
        getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix + sum_second_diagonal (i + 1, j - 1) (total_rownum, total_colnum) matrix

-- Método para retornar os elementos da diagonal secundária

get_second_diagonal :: (Int, Int) -> (Int, Int) -> Matrix -> [Int]
get_second_diagonal (i, j) (total_rownum, total_colnum) matrix =
    if (i >= total_rownum) then
        []
    else
        [getElem (0, 0) (i, j) (total_rownum, total_colnum) matrix] ++ get_second_diagonal (i + 1, j - 1) (total_rownum, total_colnum) matrix

-- ____________________________________________________________________________________________________________________________________________

-- Método para verificar se o valor da soma dos valores de cada linha é igual

assert_rows_equality :: Int -> Int -> (Int, Int) -> Matrix -> Bool
assert_rows_equality row_sum i (total_rownum, total_colnum) matrix = 
    if i >= total_rownum then
        True
    else
        if row_sum == (sum_row (i, 0) (total_rownum, total_colnum) matrix) then
            assert_rows_equality row_sum (i + 1) (total_rownum, total_colnum) matrix
        else
            False

-- Método para verificar se o valor da soma dos valores de cada coluna é igual

assert_cols_equality :: Int -> Int -> (Int, Int) -> Matrix -> Bool
assert_cols_equality col_sum j (total_rownum, total_colnum) matrix =
    if j >= total_colnum then
        True
    else
        if col_sum == (sum_col (0, j) (total_rownum, total_colnum) matrix) then
            assert_cols_equality col_sum (j + 1) (total_rownum, total_colnum) matrix
        else
            False

-- ____________________________________________________________________________________________________________________________________________

-- Método para verificar se a linha está completa
row_is_complete :: Int -> Matrix -> Bool
row_is_complete 


-- Método para verificar a unicidade de um elemento

assert_unicity_of_element :: Int -> Matrix -> Bool
assert_unicity_of_element _ [] = True
assert_unicity_of_element x (a:b) =
    if a == x then
        False
    else
        assert_unicity_of_element x b

-- Método para verificar a unicidade de todos os elementos

assert_unicity_of_all_elements :: Matrix -> Bool
assert_unicity_of_all_elements [] = True
assert_unicity_of_all_elements (a:b) =
    if assert_unicity_of_element a b == True then
        assert_unicity_of_all_elements b
    else
        False


Método que verifica se após a inserção de um elemento as outras linhas, colunas e diagonais afetadas por ele obedecem a regra

try_insert_number :: Matrix -> Int -> (Int, Int) -> (Int, Int) -> Bool
try_insert_number matrix n (i, j) (total_rownum, total_colnum) =
    if (row_is_complete == True) && (col_is_complete == True) then
        if i == j then
            if (main_diagonal_is_complete == True) && (second_diagonal_is_complete == True) then
                if (sum_row (i, 0) (total_rownum, total_colnum) matrix) == (sum_col (, j) (total_rownum, total_colnum) matrix) && 
                    (sum_row (i, 0) (total_rownum, total_colnum) matrix) == (sum_main_diagonal 0 (total_rownum, total_colnum) matrix) then
                        True
                else
                    False
            else
                if (sum_row (i, 0) (total_rownum, total_colnum) matrix) == (sum_col (, j) (total_rownum, total_colnum) matrix) then
                        True
                else
                    False
        else
            if (belong_second_diagonal == True) then
    else
        True

        
backtracking :: Matrix-> [Int] -> Int -> Int -> (Int, Int) -> Matrix
backtracking [] m _ _ = m
backtracking (a:b) m n MAX_N =
    if a == 0 then
        if try_insert_number ((m:n) ++ b) == True then
            backtracking b m:n 1 MAX_N
        else
            if n > MAX_N then
                null_matrix
            else
                backtracking (a:b) m (n + 1) MAX_N

        


main = do
    print(magic_matrix)
    -- print(getElem (0,0) (1, 2) (3, 3) magic_matrix)
    -- print(setElem (-1000) (0,0) (2, 2) (3, 3) magic_matrix)
    -- print(sum_row (1, 0) (3, 3) magic_matrix)
    -- print(sum_col (0, 0) (3, 3) magic_matrix)
    -- print(sum_main_diagonal 0 (3, 3) magic_matrix)
    -- print(sum_second_diagonal (0, 2) (3, 3) magic_matrix)