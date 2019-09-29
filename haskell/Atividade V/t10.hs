filtrar :: (t -> Bool) -> [t] -> [t]
filtrar func lista = [b | b <- lista, func b]

maiorQ5 :: Int -> Bool
maiorQ5 a = if a > 5 then True else False

main = do
    let lista = [1.. 11]
    print(filtrar maiorQ5 lista)