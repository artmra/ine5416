n_lines = int(input())
for i in range(0, n_lines):
    word = input()
    encrypted_word = []
    for j in range(0, len(word)):
        if (ord(word[j]) >= 65 and ord(word[j]) <= 90) or (ord(word[j]) >= 97 and ord(word[j]) <= 122):
            encrypted_word.append(chr(ord(word[j]) + 3))
        else:
            encrypted_word.append(word[j])
    encrypted_word.reverse()
    for k in range((len(word) // 2), len(word)):
        symbol = encrypted_word.pop(k)
        encrypted_word.insert(k, chr(ord(symbol) - 1))
    print(''.join(encrypted_word))