areaTriangulo :: Float -> Float -> Float
areaTriangulo b h = (b * h)/2

main = do
    print("insira a base do triangulo: ")
    b <- getLine
    let bfloat = (read b :: Float)
    print("insira a altura do triangulo: ")
    h <- getLine
    let hfloat = (read h :: Float)
    print(areaTriangulo bfloat hfloat)