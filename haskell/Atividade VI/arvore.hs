data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 32 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 35 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x 
    | (n == x) = True                           
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y | (x < y) = x
           | otherwise = y

minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup 
minimoElemento (No n esq dir) = 
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) elemento = if n == elemento then 1 + ocorrenciasElemento esq elemento + ocorrenciasElemento dir elemento else ocorrenciasElemento esq elemento + ocorrenciasElemento dir elemento

maiorQueElemento :: Arvore -> Int -> Int
maiorQueElemento Null _ = 0
maiorQueElemento (No n esq dir) elemento = if n > elemento then 1 + maiorQueElemento esq elemento + maiorQueElemento dir elemento else maiorQueElemento esq elemento + maiorQueElemento dir elemento

quantidade :: Arvore -> Int
quantidade Null = 0
quantidade (No n esq dir) = 1 + quantidade esq + quantidade dir

mediaElementos :: Arvore -> Float
mediaElementos Null = 0
mediaElementos (No n esq dir) = (fromIntegral (somaElementos (No n esq dir))) / (fromIntegral (quantidade (No n esq dir))) 

elementos :: Arvore -> [Int]
elementos Null = []
elementos (No n esq dir) = [n] ++ (elementos esq) ++ (elementos dir)
                               
main = do 
    print (show(somaElementos minhaArvore))
    print (show(buscaElemento minhaArvore 30))
    print (show(buscaElemento minhaArvore 55))
    print (show(minimoElemento minhaArvore))
    print (show(ocorrenciasElemento minhaArvore 35))
    print (show(maiorQueElemento minhaArvore 12))
    print (show(quantidade minhaArvore))
    print (show(mediaElementos minhaArvore))
    print (show(elementos minhaArvore))
