while True:
    n_lines = int(input())
    if n_lines == 0:
        break
    division_point_x, division_point_y = input().split()
    for i in range(0, n_lines):
        cordinate_x, cordinate_y = input().split()
        if (cordinate_x == division_point_x) or (cordinate_y == division_point_y):
            print('divisa')
        else:
            where_u_are = ''
            if int(cordinate_y) > int(division_point_y):
                where_u_are += 'N'
            else:
                where_u_are += 'S'
            if int(cordinate_x) > int(division_point_x):
                where_u_are += 'E'
            else:
                where_u_are += 'O'
            print(where_u_are)