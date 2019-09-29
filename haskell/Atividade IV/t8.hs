eq2grau :: Float -> Float -> Float -> String
eq2grau a b c = show (((b*(-1) - (b**2 - 4*a*c)**(1/5)))/(2*a)) ++ " ou " ++ show (((b*(-1) + (b**2 - 4*a*c)**(1/5)))/(2*a))

main = do
    print("Insira o valor de a: ")
    a <- getLine
    let aInt = (read a :: Float)
    print("Insira o valor de b: ")
    b <- getLine
    let bInt = (read b :: Float)
    print("Insira o valor de c: ")
    c <- getLine
    let cInt = (read c :: Float)
    print(eq2grau aInt bInt cInt)