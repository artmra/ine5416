def bubble_sort(array):
	size = len(array)
	for i in range(size):
		swapped = False
		for j in range(0, size - i - 1):
			if array[j] > array[j + 1]:
				array[j], array[j + 1] = array[j + 1], array[j]
				swapped = True
		if not swapped:
			break

def search_marbel(marbels, marbel_value):
	size = len(marbels)
	found = False
	for i in range(size):
		if marbels[i] == marbel_value:
			print('%s found at %s' % (marbel_value, i + 1))
			found = True
			break
	if not found:
		print('%s not found' % (marbel_value))
case_number = 1
while True:
	n, q = input().split()
	n, q = int(n), int(q)
	if (n != 0 and q != 0):
		marbels = []
		for i in range(n):
			marbels.append(int(input()))
		bubble_sort(marbels)
		print('CASE# %s'% (case_number))
		for i in range(q):
			search_marbel(marbels, int(input()))
		case_number += 1
	else:
		break