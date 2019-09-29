primeiros :: Int -> [t] -> [t]
primeiros 0 lista = []
primeiros n (a:b) = a:[] ++ primeiros (n-1) b

main = do
    let lista = [2..20]
    print (primeiros 7 lista)