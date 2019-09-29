apagar :: Int -> [t] -> [t]
apagar 0 a = a
apagar n (a:b) = apagar (n-1) b

main = do
    let lista = [1..10]
    print (apagar 4 lista)