media = lambda a, b, c: 'Aprovado' if ((a + b + c)/3 >= 6) else 'Reprovado'
print(media(int(input('1ª nota: ')), int(input('2ª nota: ')), int(input('3ª nota: '))))
