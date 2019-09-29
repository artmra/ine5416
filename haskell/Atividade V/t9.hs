mapear :: (t -> y) -> [t] -> [y]
mapear func lista = [func b | b <- lista]

dobro :: Int -> Int
dobro a = 2 * a

main = do
    let lista = [1.. 10]
    print(mapear dobro lista)
