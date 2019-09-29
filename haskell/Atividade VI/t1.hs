type Aluno = (String, String, Float, Float, Float)
aluno :: Int -> Aluno
aluno 1 = ("Ana", "INE5416", 6, 3.4, 7.9)
aluno 2 = ("Bruno", "INE5416", 5, 10, 9)
aluno 3 = ("Carlos", "INE5416", 6, 6.5, 5.75)
aluno _ = ("" , "", 0, 0, 0)
getNome :: Aluno -> String
getNome (n, _, _, _, _) = n
getMedia :: Aluno -> Float
getMedia (_, _, n1, n2, n3) = (n1 + n2 + n3)/3
media :: Int -> Float
media n = getMedia (aluno n)
getMediaTurma :: Int -> Int -> Float
getMediaTurma m i = if (aluno i == ("" , "", 0, 0, 0)) then 0 else (media i)/(fromIntegral m) + getMediaTurma m (i - 1)

main = do
    print(aluno 1)
    print(aluno 2)
    print(aluno 3)
    print(aluno 0)
    print(aluno 10)
    print(getNome (aluno 1))
    print(media 1)
    print(media 2)
    print(media 3)
    print(getMediaTurma 3 3)

