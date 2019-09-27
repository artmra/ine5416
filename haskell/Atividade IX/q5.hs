main = do
    let dist = \(a1, b1, c1) (a2, b2, c2) -> ((a2 - a1)**2 + (b2 - b1)**2 + (c2 - c1)**2)**(1/2)
    print (dist (1, 1, 1) (2, 3, 3))