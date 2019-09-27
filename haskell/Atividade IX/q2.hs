main = do
    let estah_aprovado = \a b c -> if (a + b + c)/3 >= 6 then "Aprovado" else "Reprovado"
    print(estah_aprovado 5 5 5)
    print(estah_aprovado 6 6 6)
    print(estah_aprovado 4 1 9)
    print(estah_aprovado 6.9 7.5 3.6)