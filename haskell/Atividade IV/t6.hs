modulo :: Float -> Float
modulo x =
    if x < 0 then
        x * (-1)
    else
        x

tentarCriarTriangulo :: Float -> Float -> Float -> Bool
tentarCriarTriangulo a b c = if (((modulo b-c) < a && a < (b + c)) && ((modulo a-c) < b && b < (a + c)) && ((modulo a - b) < c && c < (a + b))) then True else False

main = do
    print("insira a medida do 1º lado: ")
    a <- getLine
    let afloat = (read a :: Float)
    print("insira a medida do 2º lado: ")
    b <- getLine
    let bfloat = (read b :: Float)
    print("insira a medida do 3º lado: ")
    c <- getLine
    let cfloat = (read c :: Float)

    print(tentarCriarTriangulo afloat bfloat cfloat)