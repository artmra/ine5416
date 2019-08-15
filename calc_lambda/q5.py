from math import sqrt
norma = lambda pto_a, pto_b: sqrt((int(pto_b[0]) - int(pto_a[0]))**2 + (int(pto_b[1]) - int(pto_a[1]))**2 + (int(pto_b[2]) - int(pto_a[2]))**2)
print(norma(input('coordenadas do 1º vetor: ').split(), input('coordenadas do 2º vetor: ').split()))
