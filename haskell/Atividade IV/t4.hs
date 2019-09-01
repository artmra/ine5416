xor :: Bool -> Bool -> Bool
xor True False = True
xor False True = True
xor _ _ = False

main = do
    print("insira o valor da primeira variavel")
    a <- getLine
    let abool = (read a :: Bool)
    print("insira o valor da segunda variavel")
    b <- getLine
    let bbool = (read b :: Bool)
    print(xor abool bbool)