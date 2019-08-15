xor = lambda a,b: True if (a == 'True' and b == 'False') or (b == 'True' and a == 'False') else False
print(xor(input('primeiro parâmetro: '), input('Segundo parâmetro: ')))
