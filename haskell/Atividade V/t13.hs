apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto func [] = []
apagarEnquanto func (a:b) = if func a == True then a:[] ++ (apagarEnquanto func b) else apagarEnquanto func b

funcTeste :: Int -> Bool
funcTeste n = n > 3

main = do
    let lista = [1..10]
    print (apagarEnquanto funcTeste lista)