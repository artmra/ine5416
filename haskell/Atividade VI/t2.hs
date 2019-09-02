data Forma = Circulo Float | Retangulo Float Float | Triangulo Float Float
area :: Forma -> Float
area (Circulo r) = pi * r * r
area (Retangulo b a) = b * a
area (Triangulo b h) = area (Retangulo b h)/2

minhaForma :: Forma
minhaForma = (Retangulo 4 6)

main = do
    print(show(area (Circulo 6.42)))
    print(show(area (Retangulo 4 5)))
    print(show(area minhaForma))
    print(show(area (Triangulo 4 5)))