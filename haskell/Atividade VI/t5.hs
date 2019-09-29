-- Type = é uma maneira de dizer que um tipo y qualquer é equivalente a um tipo já primitivo já existente. Por exemplo Nome = String
-- Data = é uma maneira de construir um tipo que pode possuir mais de uma estrutura, permitindo variação na estrutura do dado em tempo de compilação. Por exemplo, Forma = Triangulo b h | Retangulo b h | Circulo r
-- Newtype = Funciona como o Data, POREM denota um tipo com apenas uma estrutura, ou seja, sem variação em tempo de execução. Por exemplo, Terra = Redonda r

type Nome = String

nome :: Nome
nome = "Josue"

--

data Forma = Triangulo Float Float | Retangulo Float Float | Circulo Float

forma :: Forma
forma = (Retangulo 4 5)

--

newtype Terra = Redonda (Float)

terra :: Terra
terra = Redonda (6.371)

--

main = do
    print(nome)
    print(forma)
    print(terra)