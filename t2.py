def organize(array):
	size = len(array)
	n = size
	train_station = []
	organized_train = []
	while (len(array) != 0 and len(organized_train) != size):
		if (len(train_station) != 0):
			temp = train_station.pop()
			if (temp == n):
				organized_train.append(temp)
			else:
				train_station.append(temp)
		else:
			if (len(array) != 0):
				train_station.append(temp)
			else:
				return 'NO'

