n_tests = int(input())
n_c = 0
n_r = 0
n_s = 0
for i in range(10):
    n, animal = input().split()
    if animal == 'C':
        n_c += int(n)
    elif animal == 'R':
        n_r += int(n)
    else:
        n_s += int(n)
print('Total:', (n_c + n_r + n_s), 'cobaias')
print('Total de coelhos:', n_c)
print('Total de ratos:', n_r)
print('Total de sapos:', n_s)
print('Percentual de coelhos:', round(n_c/(n_c + n_r + n_s) * 100, 2), '%')
print('Percentual de ratos:', round(n_r/(n_c + n_r + n_s) * 100, 2), '%')
print('Percentual de sapos:', round(n_s/(n_c + n_r + n_s) * 100, 2), '%')