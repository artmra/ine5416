impar_ou_par = lambda a: 'par' if (int(a) % 2 == 0) else 'ímpar'
final_map = map(impar_ou_par, input('Insira a sequencia de nºs: ').split())
print (list(final_map))