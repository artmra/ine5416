qual_o_maior = lambda numbers: numbers[0] if (int(numbers[0]) > int(numbers[1]) and int(numbers[0]) > int(numbers[2])) else numbers[1] if (int(numbers[1]) > int(numbers[2])) else numbers[2]
print(qual_o_maior(input('Insira os valores a serem comparados: ').split()))