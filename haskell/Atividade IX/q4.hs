main = do
    let bhaskara = \a b c -> ((-b - (-4*a*c)**(0.5))/(2*a), (-b + (-4*a*c)**(0.5))/(2*a))
    print (bhaskara 1 -3 2)