from cmath import sqrt
bhaskara = lambda a, b, c: print('sua expressão é: ',a,'x² +',b,'x + ',c,'\n1ª raiz: ', -(b + sqrt(b**2 - 4 * a * c))/(2*a), '\n2ª raiz: ', (-b + sqrt(b**2 - 4 * a * c))/(2*a))
bhaskara(int(input('considerando uma expressão do tipo \'ax² + bx + c\', \ninsira o valor de a: ')), int(input('insira o valor de b: ')), int(input('insira o valor de c: ')))
