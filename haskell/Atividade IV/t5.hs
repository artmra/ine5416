estahAprovado :: Float -> Float -> Float -> String
estahAprovado a b c = if (a + b + c)/3 >= 6 then "Aprovado" else "Reprovado"
main = do
    print("insira a 1ª nota: ")
    a <- getLine
    let afloat = (read a :: Float)
    print("insira a 2ª nota: ")
    b <- getLine
    let bfloat = (read b :: Float)
    print("insira a 3ª nota: ")
    c <- getLine
    let cfloat = (read c :: Float)
    print(estahAprovado afloat bfloat cfloat)
