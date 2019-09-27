main = do
    let xor = (\x y -> (not x && y) || (x && not y))
    print (xor True True)
    print (xor True False)
    print (xor False True)
    print (xor False False)