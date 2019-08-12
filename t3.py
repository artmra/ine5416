def organize(train, desired_output, size):
    print('inicio do processo :')
    i = 0
    answer = ''
    train_station, organized_train = [], []
    finished = False
    while finished == False:
        if (len(train_station) > 0):
            train_car = train_station.pop()
            if (ord(train_car) == ord(desired_output[i])):
                organized_train.append(train_car)
                i += 1
                answer = answer + 'R'
                continue
            else:
                if len(train) == 0:
                    answer = answer + ' Impossible'
                    finished = True
                    continue
                train_station.append(train_car)
        if (len(train) > 0):
            train_station.append(train.pop(0))
            answer = answer + 'I'
        if (i >= size):
            finished = True
            print(organized_train)
    return answer

end = False

while (end == False):
    num_train_cars = int(input('numero de vagoes: '))
    if (num_train_cars == 0):
        end = True
        continue
    else:
        print (organize(input('vagoes desorganizados: ').split(), input('vagoes organizados: ').split(), num_train_cars))