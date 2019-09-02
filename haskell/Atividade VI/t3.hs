data Ponto = XY Float Float | XYZ Float Float Float
distancia :: Ponto -> Ponto -> Float
distancia (XY x1 y1) (XY x2 y2) = ((x2 - x1)**(2) + (y2 - y1)**2)**(1/2)
distancia (XYZ x1 y1 z1) (XYZ x2 y2 z2) = ((x2 - x1)**(2) + (y2 - y1)**2 + (z2 - z1)**2)**(1/2)

main = do
    print (show(distancia (XY 1 1) (XY 1 3)))
    print (show(distancia (XYZ 1 1 1) (XYZ 1 1 3)))