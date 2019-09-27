main = do
    print ((\a b c -> if a > b && b > c then a else if b > c then b else c) 3 2 1)
    print ((\a b c -> if a > b && b > c then a else if b > c then b else c) 1 5 3)
    print ((\a b c -> if a > b && b > c then a else if b > c then b else c) 1 2 10)