operar :: String -> Float -> Float -> Float
operar operador a b = if (operador == "+") then a + b else if (operador == "-") then a - b else if (operador == "*") then a * b else a/b

main = do
    print("Insira o valor de x: ")
    x <- getLine
    let xFloat = (read x :: Float)
    print("Insira o valor de y: ")
    y <- getLine
    let yFloat = (read y :: Float)
    print("Insira o operador que voce deseja aplicar: ")
    operador <- getLine
    print (operar operador xFloat yFloat)
