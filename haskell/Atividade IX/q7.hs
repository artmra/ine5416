main = do
    print (map (\a -> if a `mod` 2 == 0 then True else False)[0, 1 .. 100])